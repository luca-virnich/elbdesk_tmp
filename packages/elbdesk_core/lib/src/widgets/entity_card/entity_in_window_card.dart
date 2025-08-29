import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_core/src/widgets/entity_card/entitiy_stream.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// This Card should be used when we have a entity card inside another card
/// E.g. a Card in the same window as the parent Table
/// See [EntityCard] for more information

class EntityInWindowCard<T extends HasMetaData> extends HookConsumerWidget {
  /// @nodoc
  const EntityInWindowCard({
    required this.stateProvider,
    required this.childBuilder,
    required this.stateRefetchWithLock,
    required this.entityId,
    required this.streamDataProvider,
    required this.stateRefetchWithoutLock,
    required this.tableType,
    required this.stateSaveUnlockRefetch,
    required this.invalidateEntityState,
    required this.formKey,
    required this.floatingWindowId,
    required this.parentNavigatorKey,
    required this.sessionId,
    required this.cardBody,
    required this.onSave,
    required this.onSaveError,
    required this.isSavingNotifier,
    this.floatingWindowFocus,
    // required this.savedOrInitialEntity,
    super.key,
    this.showBottomStatusBar = true,
  });

  /// The size of AddEntity widget
  // final ObjectRef<T?> savedOrInitialEntity;

  /// The Provider which provides the entity data
  final ProviderListenable<AsyncValue<T>> Function(
    int entityId,
    String sessionId,
  ) stateProvider;

  final String floatingWindowId;

  final String sessionId;

  // final Future<int> Function(String) createEntity;

  /// The Function to refetch the entity without locking
  final Future<void> Function(int, String) stateRefetchWithoutLock;

  /// The id of the entity
  final int entityId;

  /// The Function to retry on error
  final Future<void> Function(int, String) invalidateEntityState;

  /// The Function to provide the stream data
  final ProviderListenable<AsyncValue<T>> Function({
    required int dataId,
    required String sessionId,
  }) streamDataProvider;

  /// The Function to convert the entity to a comparable value

  /// The type of the table
  final String tableType;

  /// This Function is called when the user is in edit mode and releases
  /// the entity for another user
  final Future<void> Function(String, int, GlobalKey<NavigatorState>?)
      stateSaveUnlockRefetch;

  final bool showBottomStatusBar;

  final GlobalKey<NavigatorState> parentNavigatorKey;
  final Widget Function({
    required int entityId,
    required String sessionId,
    required ValueNotifier<int> selectedNavigationIndexNotifier,
    required GlobalKey<NavigatorState> navigatorKey,
    required bool readOnly,
    required T initialEntity,
    required DataMeta meta,
    required ValueNotifier<T?> savedOrInitialEntity,
  }) childBuilder;

  /// This method is called when the card is ready to be edited (a other
  /// user releases the entity)
  final Future<void> Function(int, String)? stateRefetchWithLock;

  final GlobalKey<FormState> formKey;
  final Widget cardBody;
  final FocusNode? floatingWindowFocus;

  final Future<T?> Function() onSave;
  final ValueNotifier<bool> isSavingNotifier;
  final void Function(ElbException?)? onSaveError;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final windowFocus = useFocusNode(debugLabel: 'entity Window Focus');
    final addEntityWidgetSize = useValueNotifier<Size?>(null);
    final floatingWindowFocus = ref.watch(
      windowFocusNodeProvider(floatingWindowId),
    );
    final isInitialLoading = ref.watch(
      stateProvider(entityId, sessionId)
          .select((value) => value.isLoading && !value.hasValue),
    );
    final shortcutDialogOpen = useRef<bool>(false);
    useEffect(
      () {
        void unfocusParentRequestChildFocus() {
          if (floatingWindowFocus.hasFocus) {
            floatingWindowFocus.unfocus();
            windowFocus.requestFocus();
          }
        }

        floatingWindowFocus.addListener(unfocusParentRequestChildFocus);
        return () =>
            floatingWindowFocus.removeListener(unfocusParentRequestChildFocus);
      },
      [floatingWindowFocus],
    );

    if (isInitialLoading) {
      return const SizedBox(
        height: 150,
        child: AppLoadingIndicator(),
      );
    }

    final l10n = context.l10n;
    final savedOrInitialEntity = useValueNotifier<T?>(null);
    // final initialEntity = useMemoized(
    //   () => ref.read(
    //     stateProvider(entityId, sessionId)
    //         .select((value) => value.requireValue),
    //   ),
    //   [entityId, sessionId],
    // );

    if (entityId == 0) {
      return ElbMeasureSize(
        onChange: (size) {
          addEntityWidgetSize.value = size;
        },
        child: ElbDialog(
          floatingWindowId: floatingWindowId,
          onCancel: () async {
            if (isSavingNotifier.value || shortcutDialogOpen.value) {
              return;
            }
            final currentState = ref.read(
              stateProvider(entityId, sessionId).select(
                (state) => state.valueOrNull,
              ),
            );
            if (currentState == null) {
              Navigator.of(context).pop();
              return;
            }
            final currentSaved = savedOrInitialEntity.value;

            final hasChanges = hasEntityChanges(
              currentState,
              currentSaved,
            );

            if (!hasChanges) {
              Navigator.of(context).pop(savedOrInitialEntity.value);
              return;
            } else {
              shortcutDialogOpen.value = true;
              final result = await showElbDialog<bool>(
                context: context,
                navigatorKey: parentNavigatorKey,
                isDismissible: false,
                child: ConfirmCloseEntityInWindowHasChangesDialog(
                  floatingFocusNode: floatingWindowFocus,
                  inWindowFocusNode: windowFocus,
                ),
              );
              if (result ?? false) {
                if (context.mounted) {
                  Navigator.of(context).pop(savedOrInitialEntity.value);
                  return;
                }
              }
              shortcutDialogOpen.value = false;
            }
            return;
          },
          onSaveAndCloseShortcut: () async {
            if (isSavingNotifier.value || shortcutDialogOpen.value) {
              return;
            }
            final isValid = formKey.currentState?.validate() ?? false;

            if (!isValid) {
              AppNotificationOverlay.error(
                context,
                l10n.gen_invalid_form,
              );
              return;
            }
            isSavingNotifier.value = true;

            final (:success, :exception, :data) =
                await AsyncHandler.handleAsyncOperation<T>(
              context,
              onSave,
              successMessage: l10n.gen_saving_success,
              successNavigatorKey: parentNavigatorKey,
              errorNavigatorKey: parentNavigatorKey,
              showErrorNotification: onSaveError == null,
            );
            if (context.mounted) {
              if (success) {
                Navigator.of(context).pop(data);
              } else {
                if (exception != null) {
                  onSaveError?.call(exception);
                }
                isSavingNotifier.value = false;
              }
            }
            return;
          },
          onSaveShortcut: () async {
            if (isSavingNotifier.value || shortcutDialogOpen.value) {
              return;
            }
            final isValid = formKey.currentState?.validate() ?? false;

            if (!isValid) {
              AppNotificationOverlay.error(
                context,
                l10n.gen_invalid_form,
              );
              return;
            }
            isSavingNotifier.value = true;
            final (:success, :exception, :data) =
                await AsyncHandler.handleAsyncOperation<T>(
              context,
              onSave,
              successMessage: l10n.gen_saving_success,
              successNavigatorKey: parentNavigatorKey,
              errorNavigatorKey: parentNavigatorKey,
            );
            if (context.mounted) {
              if (success) {
                isSavingNotifier.value = false;
                onSaveError?.call(null);
              } else {
                if (exception != null) {
                  onSaveError?.call(exception);
                }
                isSavingNotifier.value = false;
              }
            }
            return;
          },
          child: cardBody,
        ),
      );
    }

    final selectedNavigationIndexNotifier = useValueNotifier<int>(0);

    final hasError = ref.watch(
      stateProvider(entityId, sessionId).select((value) => value.hasError),
    );

    if (hasError) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppText(
            ref.read(
              stateProvider(entityId, sessionId).select(
                (value) => '${value.error}\n${value.stackTrace}',
              ),
            ),
          ),
          AppButton.secondary(
            onPressed: () async {
              await invalidateEntityState(entityId, sessionId);
            },
            label: l10n.gen_retry,
          ),
        ],
      );
    }

    final hasRequestedEditNotifier = useValueNotifier<bool>(false);

    return ElbDialog(
      isSelfScrollable: false,
      floatingWindowId: floatingWindowId,
      onSaveAndCloseShortcut: () async {
        if (isSavingNotifier.value || shortcutDialogOpen.value) return;

        final isValid = formKey.currentState?.validate() ?? false;

        if (!isValid) {
          AppNotificationOverlay.error(
            context,
            l10n.gen_invalid_form,
          );
          return;
        }
        final currentState = ref.read(
          stateProvider(entityId, sessionId).select(
            (state) => state.valueOrNull,
          ),
        );
        final stateSessionId = currentState?.meta.editingSessionId;
        final readOnly = stateSessionId != sessionId;
        if (readOnly) {
          return;
        }
        isSavingNotifier.value = true;

        final (:success, :exception, :data) =
            await AsyncHandler.handleAsyncOperation<T>(
          context,
          onSave,
          successMessage: l10n.gen_saving_success,
          successNavigatorKey: parentNavigatorKey,
          errorNavigatorKey: parentNavigatorKey,
          showErrorNotification: onSaveError == null,
        );
        if (context.mounted) {
          if (success) {
            Navigator.of(context).pop(data);
          } else {
            if (exception != null) {
              onSaveError?.call(exception);
            }
            isSavingNotifier.value = false;
          }
        }
        return;
      },
      onSaveShortcut: () async {
        if (isSavingNotifier.value || shortcutDialogOpen.value) return;
        final isValid = formKey.currentState?.validate() ?? false;

        if (!isValid) {
          AppNotificationOverlay.error(
            context,
            l10n.gen_invalid_form,
          );
          return;
        }

        final currentState = ref.read(
          stateProvider(entityId, sessionId).select(
            (state) => state.valueOrNull,
          ),
        );
        final stateSessionId = currentState?.meta.editingSessionId;
        final readOnly = stateSessionId != sessionId;
        if (readOnly) {
          return;
        }
        isSavingNotifier.value = true;

        final (:success, :exception, :data) =
            await AsyncHandler.handleAsyncOperation<T>(
          context,
          onSave,
          successMessage: l10n.gen_saving_success,
          successNavigatorKey: parentNavigatorKey,
          errorNavigatorKey: parentNavigatorKey,
          showErrorNotification: onSaveError == null,
        );
        if (context.mounted) {
          if (success) {
            isSavingNotifier.value = false;
            savedOrInitialEntity.value = currentState;
            onSaveError?.call(null);
          } else {
            if (exception != null) {
              onSaveError?.call(exception);
            }
            isSavingNotifier.value = false;
          }
        }
        return;
      },
      onCancel: () async {
        if (isSavingNotifier.value || shortcutDialogOpen.value) return;
        final currentState = ref.read(
          stateProvider(entityId, sessionId).select(
            (state) => state.valueOrNull,
          ),
        );
        if (currentState == null) {
          Navigator.of(context).pop();
          return;
        }
        final currentSaved = savedOrInitialEntity.value;

        final hasChanges = hasEntityChanges(
          currentState,
          currentSaved,
        );

        if (!hasChanges) {
          Navigator.of(context).pop(savedOrInitialEntity.value);
          return;
        } else {
          shortcutDialogOpen.value = true;
          final result = await showElbDialog<bool>(
            context: context,
            navigatorKey: parentNavigatorKey,
            isDismissible: false,
            child: ConfirmCloseEntityInWindowHasChangesDialog(
              floatingFocusNode: floatingWindowFocus,
              inWindowFocusNode: windowFocus,
            ),
          );
          if (result ?? false) {
            if (context.mounted) {
              Navigator.of(context).pop(savedOrInitialEntity.value);
            }
            return;
          }
          shortcutDialogOpen.value = false;
        }
        return;
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          EntityStream<T>(
            hasRequestedEditNotifier: hasRequestedEditNotifier,
            formKey: formKey,
            stateProvider: stateProvider,
            refetchWithoutLock: stateRefetchWithoutLock,
            streamDataProvider: streamDataProvider,
            dataId: entityId,
            floatingWindowId: floatingWindowId,
            navigatorKey: parentNavigatorKey,
            tableType: tableType,
            onRelease: stateSaveUnlockRefetch,
            sessionId: sessionId,
            onRefresh: (editingSessionId, dataId) async {
              await stateRefetchWithLock!(
                dataId,
                sessionId,
              );
            },
          ),
          Flexible(
            child: _View<T>(
              childSize: addEntityWidgetSize,
              stateProvider: stateProvider,
              entityId: entityId,
              savedOrInitialEntity: savedOrInitialEntity,
              sessionId: sessionId,
              selectedNavigationIndexNotifier: selectedNavigationIndexNotifier,
              navigatorKey: parentNavigatorKey,
              tableType: tableType,
              childBuilder: childBuilder,
            ),
          ),
        ],
      ),
    );
  }
}

class _View<T extends HasMetaData> extends HookConsumerWidget {
  const _View({
    required this.stateProvider,
    required this.entityId,
    required this.sessionId,
    required this.childBuilder,
    required this.selectedNavigationIndexNotifier,
    required this.navigatorKey,
    required this.tableType,
    required this.childSize,
    required this.savedOrInitialEntity,
    super.key,
  });

  final ProviderListenable<AsyncValue<T>> Function(
    int entityId,
    String editingSessionId,
  ) stateProvider;
  final int entityId;
  final String sessionId;
  final Widget Function({
    required int entityId,
    required String sessionId,
    required ValueNotifier<int> selectedNavigationIndexNotifier,
    required GlobalKey<NavigatorState> navigatorKey,
    required bool readOnly,
    required T initialEntity,
    required DataMeta meta,
    required ValueNotifier<T?> savedOrInitialEntity,
  }) childBuilder;
  final ValueNotifier<int> selectedNavigationIndexNotifier;
  final GlobalKey<NavigatorState> navigatorKey;

  final String tableType;

  final ValueNotifier<Size?> childSize;

  final ValueNotifier<T?> savedOrInitialEntity;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(
      stateProvider(entityId, sessionId).select((value) => value.isLoading),
    );

    if (isLoading) {
      return SizedBox(
        height: childSize.value?.height ?? 150,
        child: const AppLoadingIndicator(),
      );
    }

    return Consumer(
      builder: (context, ref, child) {
        final meta = ref.watch(
          stateProvider(
            entityId,
            sessionId,
          ).select(
            (state) => state.requireValue.meta,
          ),
        );

        final readOnly = meta.editingSessionId != sessionId;

        return HookBuilder(
          builder: (context) {
            final initialEntity = useMemoized(
              () => ref.read(
                stateProvider(entityId, sessionId)
                    .select((value) => value.requireValue),
              ),
              [entityId, sessionId],
            );
            useEffect(
              () {
                savedOrInitialEntity.value = initialEntity;
                return null;
              },
              [initialEntity],
            );

            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FocusScope(
                  child: childBuilder(
                    entityId: entityId,
                    sessionId: sessionId,
                    selectedNavigationIndexNotifier:
                        selectedNavigationIndexNotifier,
                    navigatorKey: navigatorKey,
                    readOnly: readOnly,
                    initialEntity: initialEntity,
                    meta: meta,
                    savedOrInitialEntity: savedOrInitialEntity,
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
