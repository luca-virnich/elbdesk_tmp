import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_core/src/framework/floating_window/widgets/entity_floating_title_bar.dart';
import 'package:elbdesk_core/src/framework/floating_window/widgets/error_floating_window.dart';
import 'package:elbdesk_core/src/framework/floating_window/widgets/loading_floating_window.dart';
import 'package:elbdesk_core/src/widgets/entity_card/entitiy_stream.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:elbdesk_window_manager/elbdesk_window_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// This Card should be used when dealing with entities, it support all
/// stuff like ribbons, error handling, loading, etc.
///
/// Also we the entity lock and release is managed
class EntityCard<T extends HasMetaData> extends HookConsumerWidget {
  const EntityCard({
    required this.stateProvider,
    required this.createEntity,
    required this.getTitle,
    required this.tableIcon,
    required this.tablePrefix,
    required this.childBuilder,
    required this.stateRefetchWithLock,
    required this.entityId,
    required this.streamDataProvider,
    required this.stateRefetchWithoutLock,
    required this.tableType,
    required this.stateSaveUnlockRefetch,
    required this.floatingWindowId,
    required this.invalidateEntityState,
    required this.formKey,
    required this.onSave,
    required this.floatingWindowType,
    this.floatingWindowFocus,
    this.showRibbonsOnFirstOpening = true,
    super.key,
    this.onSaveError,
    this.showTitleBar = true,
    this.ignoreChangesOnSave = false,
    this.showToolbar = true,
    this.showFooter = true,
    this.showBottomStatusBar = true,
    this.tableSessionId,
    this.initialViewOnly = false,
    this.ribbonsBuilder,
    this.ignoreEntityEditStatusRibbon = false,
  });

  /// The type of the table
  final String tableType;

  /// The Provider which provides the entity data
  final ProviderListenable<AsyncValue<T>> Function(
    int entityId,
    String editingSessionId,
  ) stateProvider;

  /// The Function to create a new entity
  final Future<int> Function(String)? createEntity;

  /// The Function to refetch the entity without locking
  final Future<void> Function(int, String) stateRefetchWithoutLock;

  /// The id of the entity
  final int? entityId;

  /// The Function to retry on error
  final Future<void> Function(int, String) invalidateEntityState;

  /// The Function to get the title of the entity
  final String Function(T entity) getTitle;

  /// The Function to provide the stream data
  final ProviderListenable<AsyncValue<T>> Function({
    required int dataId,
    required String sessionId,
  }) streamDataProvider;

  /// This Function is called when the user is in edit mode and releases
  /// the entity for another user
  final Future<void> Function(String, int, GlobalKey<NavigatorState>?)
      stateSaveUnlockRefetch;

  final bool showToolbar;

  final bool showFooter;

  final bool showBottomStatusBar;

  final bool? ignoreChangesOnSave;
  final FocusNode? floatingWindowFocus;
  final bool initialViewOnly;

  final bool showTitleBar;

  final List<Widget> Function(
    int entityId,
    String sessionId,
    GlobalKey<NavigatorState> navigatorKey,
    ObjectRef<T?> savedOrInitialEntity,
  )? ribbonsBuilder;

  final String? tableSessionId;
  final IconData Function(int entityId, String sessionId) tableIcon;
  final String floatingWindowId;
  final String Function(int entityId, String sessionId) tablePrefix;

  final Widget Function(
    BuildContext context,
    int entityId,
    String sessionId,
    ValueNotifier<int> selectedNavigationIndexNotifier,
    GlobalKey<NavigatorState> navigatorKey,
    bool readOnly,
    DataMeta meta,
    T initialEntity,
    ValueNotifier<bool> isSaving,
    ObjectRef<T?> savedOrInitialEntity,
    ObjectRef<bool> isFirstRender,
  ) childBuilder;

  // onRefresh with entityId and sessionId
  final Future<void> Function(int, String)? stateRefetchWithLock;

  final GlobalKey<FormState> formKey;

  final Future<void> Function(int, String, GlobalKey<NavigatorState>)? onSave;
  final void Function(ElbException?, GlobalKey<NavigatorState>)? onSaveError;

  final bool showRibbonsOnFirstOpening;
  final bool ignoreEntityEditStatusRibbon;
  final String floatingWindowType;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final navigatorKey = useMemoized(GlobalKey<NavigatorState>.new, []);
    final navigatorKey = ref.watch(windowNavigatorProvider(floatingWindowId));

    final floatingWindowFocus = this.floatingWindowFocus ??
        ref.watch(windowFocusNodeProvider(floatingWindowId));

    final sessionId = useUuid();
    ref.listen(entityViewOnlyProvider(sessionId), (previous, next) {});
    final viewOnlySet = useState<bool>(false);
    useEffect(
      () {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (context.mounted) {
            ref
                .read(entityViewOnlyProvider(sessionId).notifier)
                .setViewOnly(initialViewOnly);
            viewOnlySet.value = true;
          }
        });

        return null;
      },
      [sessionId],
    );
    if (!viewOnlySet.value) {
      return LoadingFloatingWindow(
        windowId: floatingWindowId,
        titleIconData: null,
        showTitleBar: showTitleBar,
      );
    }

    final entityId = useState<int?>(this.entityId);
    final selectedNavigationIndexNotifier = useValueNotifier<int>(0);
    final createError = useState<String>('');
    final createAndSetEntity = useCallback(
      () async {
        try {
          final id = await createEntity!(sessionId);
          entityId.value = id;

          if (context.mounted) {
            createError.value = '';
          }
        } catch (error) {
          if (context.mounted) {
            createError.value = error.toString();
          }
        }
      },
      [],
    );

    useEffect(
      () {
        if (entityId.value == null && createEntity != null) {
          createAndSetEntity();
        }

        return null;
      },
      [this.entityId, floatingWindowId],
    );

    if (createError.value.isNotEmpty) {
      return ErrorFloatingWindow(
        errorMessage: createError.value,
        windowId: floatingWindowId,
        showTitleBar: showTitleBar,
        onRetry: () async {
          await createAndSetEntity();
        },
      );
    }
    // If the contactId is null, show a loading indicator until it is created
    if (entityId.value == null) {
      return LoadingFloatingWindow(
        windowId: floatingWindowId,
        titleIconData: null,
        showTitleBar: showTitleBar,
      );
    }
    ref.listen(stateProvider(entityId.value!, sessionId), (previous, next) {
      if (next.hasValue && !next.isLoading) {
        final titleData = FloatingWindowTitlebarData(
          title: getTitle(next.requireValue),
          icon: tableIcon(entityId.value!, sessionId),
          baseTitle: tablePrefix(entityId.value!, sessionId).isNotEmpty
              ? tablePrefix(entityId.value!, sessionId)
              : '',
        );

        ref.read(windowManagerProvider).updateWindowTitleData(
              floatingWindowId,
              titleData,
            );
      }
    });

    final isInitialLoading = ref.watch(
      stateProvider(entityId.value!, sessionId)
          .select((value) => value.isLoading && !value.hasValue),
    );

    // return Container();
    // If the contact is not loaded yet, show a loading indicator
    if (isInitialLoading) {
      return LoadingFloatingWindow(
        windowId: floatingWindowId,
        titleIconData: null,
        showTitleBar: showTitleBar,
      );
    }

    final hasError = ref.watch(
      stateProvider(entityId.value!, sessionId)
          .select((value) => value.hasError),
    );

    if (hasError) {
      return ErrorFloatingWindow(
        errorMessage: ref.read(
          stateProvider(entityId.value!, sessionId).select(
            (value) => '${value.error}\n${value.stackTrace}',
          ),
        ),
        windowId: floatingWindowId,
        onRetry: () async {
          await invalidateEntityState(
            entityId.value!,
            sessionId,
          );
        },
      );
    }

    final savedOrInitialEntity = useRef<T?>(null);

    final shortcutDialogOpen = useRef<bool>(false);
    final l10n = context.l10n;
    final isSavingNotifier = useValueNotifier<bool>(false);
    // checks if the card has been rendered
    final isFirstRender = useRef<bool>(true);
    final isDeleted = ref.watch(
      stateProvider(entityId.value!, sessionId).select(
        (state) => state.requireValue.meta.deletedAt != null,
      ),
    );

    // Listen for taskbar remove requests
    ref.listen(
      floatingWindowRemoveFromTaskbarStateProvider(floatingWindowId),
      (prev, next) async {
        // Skip if no floatingWindowId
        if (next) {
          // Prevent removal while saving or dialog is open
          if (isSavingNotifier.value || shortcutDialogOpen.value) {
            return;
          }

          // Get current entity state
          final currentState = ref.read(
            stateProvider(entityId.value!, sessionId).select(
              (state) => state.valueOrNull,
            ),
          );

          // Remove window if entity is deleted or null
          if (currentState == null || isDeleted) {
            ref.removeWindow(floatingWindowId);
            return;
          }

          // Remove window if no initial state
          if (savedOrInitialEntity.value == null) {
            ref.removeWindow(floatingWindowId);
            return;
          }

          // Check for unsaved changes
          final hasChanges = hasEntityChanges(
            savedOrInitialEntity.value,
            currentState,
          );

          // Remove window if no changes or changes should be ignored
          if (!hasChanges || (ignoreChangesOnSave ?? false)) {
            ref.removeWindow(floatingWindowId);
            return;
          }

          final isMinimized = ref.read(windowManagerProvider).isMinimized(
                floatingWindowId,
              );

          // Check if window is in front

          // Bring to front if it's minimzed
          if (isMinimized) {
            // Bring to front
            ref.read(windowManagerProvider).bringToFront(floatingWindowId);
            // Remove from minimized state
          }

          // Show close confirmation dialog
          shortcutDialogOpen.value = true;
          final result = await showElbDialog<bool>(
            context: context,
            navigatorKey: navigatorKey,
            isDismissible: false,
            child: const CloseFloatingWindowDialog(),
          );
          shortcutDialogOpen.value = false;

          // Handle dialog result
          if (result ?? false) {
            ref.removeWindow(floatingWindowId);
            return;
          } else {
            ref
                .read(
                  floatingWindowRemoveFromTaskbarStateProvider(
                    floatingWindowId,
                  ).notifier,
                )
                .resetRemove();
          }
          return;
        }
      },
    );

    // TODO(tk): Initialize with saved cfg, luca todo

    final hasRequestedEditNotifier = useValueNotifier<bool>(false);

    return Shortcuts(
      shortcuts: {
        if (!kIsWeb) closeWindowShortcutMeta: const CloseWindowIntent(),
        closeWindowShortcutControl: const CloseWindowIntent(),
        closeWindowShortcutAlt: const CloseWindowIntent(),
        if (!kIsWeb)
          saveAndCloseWindowShortcutMeta: const SaveAndCloseWindowIntent(),
        saveAndCloseWindowShortcutControl: const SaveAndCloseWindowIntent(),
        if (!kIsWeb) saveWindowShortcutMeta: const SaveWindowIntent(),
        saveWindowShortcutControl: const SaveWindowIntent(),
      },
      child: Actions(
        actions: {
          SaveAndCloseWindowIntent: CallbackAction<SaveAndCloseWindowIntent>(
            onInvoke: (intent) async {
              final isInFront = ref
                  .read(
                    windowManagerProvider,
                  )
                  .isInFront(floatingWindowId);
              if (!isInFront) {
                return;
              }

              if (isDeleted) return null;
              final currentState = ref.read(
                stateProvider(entityId.value!, sessionId).select(
                  (state) => state.valueOrNull,
                ),
              );

              if (isSavingNotifier.value ||
                  shortcutDialogOpen.value ||
                  onSave == null ||
                  currentState == null) {
                return null;
              }
              final stateSessionId = currentState.meta.editingSessionId;
              final readOnly = stateSessionId != sessionId;

              if (readOnly) {
                return null;
              }

              final isValid = formKey.currentState?.validate() ?? false;
              if (!isValid) {
                AppNotificationOverlay.error(
                  context,
                  l10n.gen_saving_error,
                );

                return;
              }
              final hasChanges = hasEntityChanges(
                savedOrInitialEntity.value,
                currentState,
              );
              if (!hasChanges) {
                ref.removeWindow(floatingWindowId);
                return;
              }

              isSavingNotifier.value = true;

              final (:success, :exception, :data) =
                  await AsyncHandler.handleAsyncOperation(
                context,
                () => onSave!.call(entityId.value!, sessionId, navigatorKey),
                errorNavigatorKey: navigatorKey,
                successNavigatorKey: AppNavigatorKeys.appRootNavigatorKey,
                successMessage: l10n.gen_saving_success,
                showErrorNotification: onSaveError == null,
              );

              if (!success) {
                if (context.mounted) {
                  isSavingNotifier.value = false;
                  onSaveError?.call(exception, navigatorKey);
                }
                return;
              }
              ref.removeWindow(floatingWindowId);
              return null;
            },
          ),
          SaveWindowIntent: CallbackAction<SaveWindowIntent>(
            onInvoke: (intent) async {
              final currentState = ref.read(
                stateProvider(entityId.value!, sessionId).select(
                  (state) => state.valueOrNull,
                ),
              );
              if (onSave == null ||
                  isSavingNotifier.value ||
                  shortcutDialogOpen.value ||
                  currentState == null) {
                return null;
              }
              if (isDeleted) return null;
              final stateSessionId = currentState.meta.editingSessionId;
              final readOnly = stateSessionId != sessionId;
              if (readOnly) {
                return null;
              }

              final isValid = formKey.currentState?.validate() ?? false;

              if (!isValid) {
                AppNotificationOverlay.error(
                  context,
                  l10n.gen_saving_error,
                  navigatorKey: navigatorKey,
                );

                return;
              }

              final hasChanges = hasEntityChanges(
                savedOrInitialEntity.value,
                currentState,
              );
              if (!hasChanges) {
                return;
              }

              isSavingNotifier.value = true;

              final (:success, :exception, :data) =
                  await AsyncHandler.handleAsyncOperation(
                context,
                () => onSave!.call(entityId.value!, sessionId, navigatorKey),
                successMessage: l10n.gen_saving_success,
                successNavigatorKey: navigatorKey,
                errorNavigatorKey: navigatorKey,
                showErrorNotification: onSaveError == null,
              );
              if (context.mounted) {
                isSavingNotifier.value = false;
                if (success) {
                  final updatedState = ref.read(
                    stateProvider(entityId.value!, sessionId).select(
                      (state) => state.valueOrNull,
                    ),
                  );
                  savedOrInitialEntity.value = updatedState;
                } else {
                  onSaveError?.call(exception, navigatorKey);
                }
              }

              return null;
            },
          ),
          CloseWindowIntent: CallbackAction<CloseWindowIntent>(
            onInvoke: (intent) async {
              final isInFront = ref.read(windowManagerProvider).isInFront(
                    floatingWindowId,
                  );
              if (!isInFront) {
                return;
              }
              if (isSavingNotifier.value || shortcutDialogOpen.value) {
                return null;
              }

              final currentState = ref.read(
                stateProvider(entityId.value!, sessionId).select(
                  (state) => state.valueOrNull,
                ),
              );
              if (currentState == null || isDeleted) {
                ref.removeWindow(floatingWindowId);
                return null;
              }

              if (savedOrInitialEntity.value == null) {
                ref.removeWindow(floatingWindowId);
                return null;
              }
              final hasChanges = hasEntityChanges(
                savedOrInitialEntity.value,
                currentState,
              );

              if (!hasChanges || (ignoreChangesOnSave ?? false)) {
                ref.removeWindow(floatingWindowId);
                return null;
              }

              shortcutDialogOpen.value = true;
              final result = await showElbDialog<bool>(
                context: context,
                navigatorKey: navigatorKey,
                isDismissible: true,
                child: const CloseFloatingWindowDialog(),
              );
              shortcutDialogOpen.value = false;
              if (result ?? false) {
                ref.removeWindow(floatingWindowId);
                return null;
              }
              return null;
            },
          ),
        },
        child: Focus(
          autofocus: true,
          skipTraversal: true,
          focusNode: floatingWindowFocus,
          child: GestureDetector(
            onTap: () {
              ref.read(windowManagerProvider).bringToFront(floatingWindowId);
            },
            child: ColoredBox(
              color: context.appTheme.generalColors.background,
              child: Column(
                children: [
                  if (showTitleBar)
                    EntityFloatingTitleBar(
                      floatingWindowType: floatingWindowType,
                      floatingWindowId: floatingWindowId,
                      stateProvider: stateProvider,
                      streamDataProvider: streamDataProvider,
                      entityId: entityId.value!,
                      ignoreEntityEditStatusRibbon:
                          ignoreEntityEditStatusRibbon,
                      editSessionId: ref.watch(
                        stateProvider(entityId.value!, sessionId).select(
                          (state) => state.requireValue.meta.editingSessionId,
                        ),
                      ),
                      showRibbonHandler: !(isDeleted ||
                          (ignoreEntityEditStatusRibbon &&
                              ribbonsBuilder == null)),
                      floatingWindowFocus: floatingWindowFocus,

                      sessionId: sessionId,
                      onClose: () async {
                        if (shortcutDialogOpen.value) {
                          return;
                        }

                        final currentState = ref.read(
                          stateProvider(entityId.value!, sessionId).select(
                            (state) => state.valueOrNull,
                          ),
                        );
                        if (currentState == null) {
                          ref.removeWindow(floatingWindowId);
                          return;
                        }
                        if (savedOrInitialEntity.value == null) {
                          ref.removeWindow(floatingWindowId);
                          return;
                        }

                        final hasChanges = hasEntityChanges(
                          savedOrInitialEntity.value,
                          currentState,
                        );

                        if (!hasChanges || (ignoreChangesOnSave ?? false)) {
                          ref.removeWindow(floatingWindowId);
                          return;
                        }
                        shortcutDialogOpen.value = true;
                        final result = await showElbDialog<bool>(
                          context: context,
                          navigatorKey: navigatorKey,
                          isDismissible: false,
                          child: const CloseFloatingWindowDialog(),
                        );
                        shortcutDialogOpen.value = false;
                        if (result ?? false) {
                          ref.removeWindow(floatingWindowId);
                          return;
                        }
                      },
                      onUpdate: () async {
                        await stateRefetchWithLock!(
                          entityId.value!,
                          sessionId,
                        );
                      },
                      windowId: floatingWindowId,
                      // navigatorKey: navigatorKey,
                    ),
                  Expanded(
                    child: ValueListenableBuilder(
                      valueListenable: isSavingNotifier,
                      builder: (context, isSaving, child) {
                        return FloatingWindowLoadingOverlay(
                          isLoading: isSaving,
                          child: Navigator(
                            key: navigatorKey,
                            onGenerateRoute: (settings) {
                              return PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) {
                                  return Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      if (isDeleted)
                                        Positioned.fill(
                                          child: Column(
                                            children: [
                                              const SizedBox(
                                                height:
                                                    UiConstants.defaultPadding *
                                                        2,
                                              ),
                                              AppText(
                                                l10n.gen_deleted_entity_hint_message,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 16,
                                              ),
                                              const Spacer(),
                                              DefaultEntityDeletedCardFooter(
                                                meta: ref.watch(
                                                  stateProvider(
                                                    entityId.value!,
                                                    sessionId,
                                                  ).select(
                                                    (state) =>
                                                        state.valueOrNull?.meta,
                                                  ),
                                                ),
                                                savedOrInitialEntity:
                                                    savedOrInitialEntity,
                                                windowId: floatingWindowId,
                                              ),
                                            ],
                                          ),
                                        ),
                                      if (!isDeleted)
                                        Positioned.fill(
                                          child: Column(
                                            children: [
                                              _EntityRibbons(
                                                floatingWindowType:
                                                    floatingWindowType,
                                                hasRequestedEdit:
                                                    hasRequestedEditNotifier,
                                                tableType: tableType,
                                                onRefresh: stateRefetchWithLock,
                                                onRelease:
                                                    stateSaveUnlockRefetch,
                                                savedOrInitialEntity:
                                                    savedOrInitialEntity,
                                                ignoreEntityEditStatusRibbon:
                                                    ignoreEntityEditStatusRibbon,
                                                entityId: entityId.value!,
                                                sessionId: sessionId,
                                                ribbonsBuilder: ribbonsBuilder,
                                                stateProvider: stateProvider,
                                                navigatorKey: navigatorKey,
                                                floatingWindowId:
                                                    floatingWindowId,
                                                streamDataProvider:
                                                    streamDataProvider,
                                                formKey: formKey,
                                              ),
                                              Expanded(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  children: [
                                                    EntityStream<T>(
                                                      hasRequestedEditNotifier:
                                                          hasRequestedEditNotifier,
                                                      formKey: formKey,
                                                      stateProvider:
                                                          stateProvider,
                                                      refetchWithoutLock:
                                                          stateRefetchWithoutLock,
                                                      streamDataProvider:
                                                          streamDataProvider,
                                                      dataId: entityId.value!,
                                                      floatingWindowId:
                                                          floatingWindowId,
                                                      navigatorKey:
                                                          navigatorKey,
                                                      tableType: tableType,
                                                      onRelease:
                                                          stateSaveUnlockRefetch,
                                                      sessionId: sessionId,
                                                      onRefresh: (
                                                        editingSessionId,
                                                        dataId,
                                                      ) async {
                                                        await stateRefetchWithLock!(
                                                          dataId,
                                                          sessionId,
                                                        );
                                                      },
                                                    ),
                                                    Expanded(
                                                      child: _View<T>(
                                                        isFirstRender:
                                                            isFirstRender,
                                                        savedOrInitialEntity:
                                                            savedOrInitialEntity,
                                                        stateProvider:
                                                            stateProvider,
                                                        entityId: entityId,
                                                        sessionId: sessionId,
                                                        selectedNavigationIndexNotifier:
                                                            selectedNavigationIndexNotifier,
                                                        navigatorKey:
                                                            navigatorKey,
                                                        floatingWindowId:
                                                            floatingWindowId,
                                                        tableType: tableType,
                                                        showTitleBar:
                                                            showTitleBar,
                                                        childBuilder:
                                                            childBuilder,
                                                        isSavingNotifier:
                                                            isSavingNotifier,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _View<T extends HasMetaData> extends ConsumerWidget {
  const _View({
    required this.stateProvider,
    required this.entityId,
    required this.isFirstRender,
    required this.sessionId,
    required this.childBuilder,
    required this.selectedNavigationIndexNotifier,
    required this.navigatorKey,
    required this.floatingWindowId,
    required this.tableType,
    required this.showTitleBar,
    required this.savedOrInitialEntity,
    required this.isSavingNotifier,
    super.key,
  });

  final ProviderListenable<AsyncValue<T>> Function(
    int entityId,
    String editingSessionId,
  ) stateProvider;
  final ValueNotifier<int?> entityId;
  final String sessionId;
  final ObjectRef<bool> isFirstRender;
  final Widget Function(
    BuildContext context,
    int entityId,
    String sessionId,
    ValueNotifier<int> selectedNavigationIndexNotifier,
    GlobalKey<NavigatorState> navigatorKey,
    bool readOnly,
    DataMeta meta,
    T initialEntity,
    ValueNotifier<bool> isSaving,
    ObjectRef<T?> savedOrInitialEntity,
    ObjectRef<bool> isFirstRender,
  ) childBuilder;
  final ValueNotifier<int> selectedNavigationIndexNotifier;
  final GlobalKey<NavigatorState> navigatorKey;
  final String? floatingWindowId;
  final String tableType;
  final bool showTitleBar;
  final ObjectRef<T?> savedOrInitialEntity;
  final ValueNotifier<bool> isSavingNotifier;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(
      stateProvider(entityId.value!, sessionId)
          .select((value) => value.isLoading),
    );
    if (isLoading) {
      return const Center(child: AppLoadingIndicator());
    }
    return Consumer(
      builder: (context, ref, child) {
        final meta = ref.watch(
          stateProvider(
            entityId.value!,
            sessionId,
          ).select(
            (state) => state.requireValue.meta,
          ),
        );

        final readOnly = meta.editingSessionId != sessionId;

        return HookBuilder(
          builder: (context) {
            final initialEntity = useMemoized(
              () => ref
                  .read(stateProvider(entityId.value!, sessionId))
                  .requireValue,
              [entityId.value, sessionId],
            );
            useEffect(
              () {
                savedOrInitialEntity.value = initialEntity;
                Future<void>.delayed(const Duration(milliseconds: 500))
                    .then((_) {
                  isFirstRender.value = false;
                });
                return null;
              },
              [initialEntity],
            );
            return childBuilder(
              context,
              entityId.value!,
              sessionId,
              selectedNavigationIndexNotifier,
              navigatorKey,
              readOnly,
              meta,
              initialEntity,
              isSavingNotifier,
              savedOrInitialEntity,
              isFirstRender,
            );
          },
        );
      },
    );
  }
}

class _EntityRibbons<T extends HasMetaData> extends ConsumerWidget {
  const _EntityRibbons({
    required this.entityId,
    required this.sessionId,
    required this.stateProvider,
    required this.streamDataProvider,
    required this.savedOrInitialEntity,
    required this.navigatorKey,
    required this.floatingWindowId,
    required this.onRelease,
    required this.formKey,
    required this.hasRequestedEdit,
    required this.onRefresh,
    required this.ribbonsBuilder,
    required this.ignoreEntityEditStatusRibbon,
    required this.tableType,
    required this.floatingWindowType,
    super.key,
  });

  final int entityId;
  final String sessionId;

  final List<Widget> Function(
    int entityId,
    String sessionId,
    GlobalKey<NavigatorState> navigatorKey,
    ObjectRef<T?> savedOrInitialEntity,
  )? ribbonsBuilder;
  final GlobalKey<NavigatorState> navigatorKey;
  final ProviderListenable<AsyncValue<T>> Function(
    int entityId,
    String editingSessionId,
  ) stateProvider;
  final ObjectRef<T?> savedOrInitialEntity;
  final String floatingWindowId;
  final ProviderListenable<AsyncValue<T>> Function({
    required String sessionId,
    required int dataId,
  }) streamDataProvider;
  final Future<void> Function(
    String editingSessionId,
    int dataId,
    GlobalKey<NavigatorState>?,
  ) onRelease;
  final GlobalKey<FormState> formKey;
  final Future<void> Function(int, String)? onRefresh;
  final bool ignoreEntityEditStatusRibbon;
  final String tableType;
  final ValueNotifier<bool> hasRequestedEdit;
  final String floatingWindowType;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(
      stateProvider(entityId, sessionId).select((value) => value.isLoading),
    );

    return isLoading
        ? const SizedBox()
        : CardRibbons(
            ignoreEntityEditStatusRibbon: ignoreEntityEditStatusRibbon,
            floatingWindowId: floatingWindowId,
            floatingWindowType: floatingWindowType,
            entityEditStatusRibbon: _ModeRibbon<T>(
              floatingWindowType: floatingWindowType,
              hasRequestedEditNotifier: hasRequestedEdit,
              tableType: tableType,
              customerId: entityId,
              sessionId: sessionId,
              navigatorKey: navigatorKey,
              floatingWindowId: floatingWindowId,
              stateProvider: stateProvider,
              entityId: entityId,
              streamDataProvider: streamDataProvider,
              onRelease: onRelease,
              formKey: formKey,
              onRefresh: onRefresh,
            ),
            ribbons: [
              ...(ribbonsBuilder?.call(
                    entityId,
                    sessionId,
                    navigatorKey,
                    savedOrInitialEntity,
                  ) ??
                  []),
            ],
          );
  }
}

class _ModeRibbon<T extends HasMetaData> extends HookConsumerWidget {
  const _ModeRibbon({
    required this.customerId,
    required this.sessionId,
    required this.navigatorKey,
    required this.floatingWindowId,
    required this.stateProvider,
    required this.entityId,
    required this.streamDataProvider,
    required this.onRefresh,
    required this.onRelease,
    required this.formKey,
    required this.tableType,
    required this.hasRequestedEditNotifier,
    required this.floatingWindowType,
  });
  final int customerId;
  final String sessionId;
  final GlobalKey<NavigatorState> navigatorKey;
  final ProviderListenable<AsyncValue<T>> Function(int, String) stateProvider;
  final ProviderListenable<AsyncValue<T>> Function({
    required String sessionId,
    required int dataId,
  }) streamDataProvider;
  final String floatingWindowType;
  final String floatingWindowId;
  final int entityId;
  final Future<void> Function(
    String editingSessionId,
    int dataId,
    GlobalKey<NavigatorState>?,
  ) onRelease;
  final GlobalKey<FormState> formKey;
  final Future<void> Function(int, String)? onRefresh;
  final String tableType;
  final ValueNotifier<bool> hasRequestedEditNotifier;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myUserId = sessionManager.signedInUser?.id;
    final l10n = context.l10n;

    final meta = ref.watch(
      stateProvider(entityId, sessionId)
          .select((value) => value.requireValue.meta),
    );

    final editByState = useState<DataEditType>(
      ref
                  .read(
                    stateProvider(entityId, sessionId)
                        .select((value) => value.requireValue.meta),
                  )
                  .editingSessionId ==
              sessionId
          ? DataEditType.same
          : meta.editingSessionId == null
              ? DataEditType.none
              : meta.editingById == myUserId
                  ? DataEditType.you
                  : DataEditType.other,
    );

    ref.listen<AsyncValue<T>>(
      streamDataProvider(sessionId: sessionId, dataId: entityId),
      // we only get updates from another sessionId
      (previous, next) {
        final updatedData = next.asData?.value;
        if (updatedData == null) return;

        final serverEditSessionId = updatedData.meta.editingSessionId;

        if (serverEditSessionId == null) {
          editByState.value = DataEditType.none;
          return;
        }

        // if the sessionId is still the same, we dont want to do anyhting
        if (sessionId == serverEditSessionId) {
          editByState.value = DataEditType.same;
          return;
        }

        // sessionId is set but we are not editing, compare and check for
        // updates

        final editingUser = updatedData.meta.editingById;

        if (editingUser == myUserId) {
          editByState.value = DataEditType.you;
        } else if (editingUser != null) {
          editByState.value = DataEditType.other;
        } else {
          editByState.value = DataEditType.none;
        }
      },
    );

    final label = switch (editByState.value) {
      DataEditType.you => l10n.gen_entity_status_blocked,
      DataEditType.other => l10n.gen_entity_status_blocked,
      DataEditType.none => l10n.gen_entity_status_edit,
      DataEditType.same => l10n.gen_entity_status_view_mode,
    };

    useValueListenable(hasRequestedEditNotifier);
    final icon = switch (editByState.value) {
      DataEditType.you =>
        hasRequestedEditNotifier.value ? Icons.lock_clock : Icons.lock_person,
      DataEditType.other => Icons.lock,
      DataEditType.none => Icons.edit,
      DataEditType.same => Icons.visibility,
    };

    final isLoading = useState<bool>(false);
    return Ribbon(
      floatingWindowId: floatingWindowId,
      floatingWindowType: floatingWindowType,
      icon: icon,
      label: label,
      onPressed: isLoading.value || hasRequestedEditNotifier.value
          ? null
          : () async {
              // user edits in same window, try to save and go to view mode
              // calling the onRelease callback
              if (editByState.value == DataEditType.same) {
                final isValid = formKey.currentState?.validate() ?? false;

                if (!isValid) {
                  AppNotificationOverlay.error(
                    context,
                    l10n.gen_saving_error,
                    navigatorKey: navigatorKey,
                  );
                  return;
                }
                isLoading.value = true;
                await onRelease(sessionId, entityId, navigatorKey);
                if (context.mounted) {
                  isLoading.value = false;
                }

                return;
              }
              // user want to edit
              if (editByState.value == DataEditType.none) {
                isLoading.value = true;
                await onRefresh?.call(entityId, sessionId);
                if (context.mounted) {
                  isLoading.value = false;
                }
                return;
              }

              if (editByState.value == DataEditType.other ||
                  (kDebugMode && editByState.value == DataEditType.you)) {
                isLoading.value = true;
                hasRequestedEditNotifier.value = true;

                await AsyncHandler.handleAsyncOperation(
                  context,
                  () => ref.read(editRequestRepositoryProvider).createRequest(
                        primaryKey: entityId,
                        tableType: tableType,
                        requestingFloatingWindowId: floatingWindowId,
                      ),
                  successMessage: l10n.gen_edit_request_send,
                  showErrorNotification: true,
                );
                if (context.mounted) {
                  isLoading.value = false;
                }
                return;
              }
            },
    );
  }
}
