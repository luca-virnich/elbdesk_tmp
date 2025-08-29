import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_core/src/widgets/entity_card/entitiy_stream.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_core/src/global_settings/logic/global_settings_provider.dart';
import 'package:project_core/src/global_settings/logic/global_settings_state.dart';
import 'package:project_core/src/global_settings/models/global_settings.dart';

/// Page for managing global settings with real-time updates and locking
class GlobalSettingsPage extends HookConsumerWidget {
  const GlobalSettingsPage({
    required this.floatingWindowId,
    required this.navigatorKey,
    required this.floatingWindowFocus,
    required this.sessionId,
    required this.onInitialSettings,
    required this.validationGroupId,
    this.onSave,
    super.key,
  });

  final String floatingWindowId;
  final GlobalKey<NavigatorState> navigatorKey;
  final FocusNode floatingWindowFocus;
  final String sessionId;
  final void Function(GlobalSettings settings, int id) onInitialSettings;
  final void Function(GlobalSettings settings)? onSave;
  final String validationGroupId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final formKey = useRef(GlobalKey<FormState>());
    final hasRequestedEditNotifier = useValueNotifier<bool>(false);
    return ref.watch(fetchGlobalSettingsProvider).fastWhen(
      data: (globalSettings) {
        // Keepalive for the stream
        ref.listen(
          watchGlobalSettingsInAdminCardProvider(
            sessionId: sessionId,
            entityId: globalSettings.meta.id!,
          ),
          (previous, next) {},
        );

        final settingsState = ref.watch(
          globalSettingsStateProvider(globalSettings.meta.id!, sessionId),
        );

        if (settingsState.isLoading) {
          return const AppLoadingIndicator();
        }

        // Notify parent of initial settings once loaded - Runs once
        useEffect(
          () {
            if (settingsState.hasValue) {
              onInitialSettings(settingsState.value!, globalSettings.meta.id!);
            }
            return null;
          },
          [],
        );

        return Column(
          children: [
            EntityStream<GlobalSettings>(
              hasRequestedEditNotifier: hasRequestedEditNotifier,
              sessionId: sessionId,
              dataId: globalSettings.meta.id!,
              onRefresh: (editingSessionId, dataId) {
                ref
                    .read(
                      globalSettingsStateProvider(dataId, sessionId).notifier,
                    )
                    .refetchWithLock();
              },
              floatingWindowId: floatingWindowId,
              streamDataProvider: ({
                required sessionId,
                required dataId,
              }) =>
                  watchGlobalSettingsInAdminCardProvider(
                sessionId: sessionId,
                entityId: dataId,
              ),
              tableType: TableType.globalSettings.name,
              onRelease: (editingSessionId, entityId, navigatorKey) async {
                await ref
                    .read(
                      globalSettingsStateProvider(entityId, editingSessionId)
                          .notifier,
                    )
                    .saveAndUnlockAndRefetch();
              },
              stateProvider: globalSettingsStateProvider.call,
              navigatorKey: navigatorKey,
              refetchWithoutLock: (entityId, sessionId) async {
                await ref
                    .read(
                      globalSettingsStateProvider(entityId, sessionId).notifier,
                    )
                    .refetchWithoutLock();
              },
              formKey: formKey.value,
            ),
            Expanded(
              child: Stack(
                children: [
                  Form(
                    key: formKey.value,
                    child: ScrollableCardItem.constrained(
                      builder: (context, constraints) => Column(
                        children: [
                          CardSectionTitle(
                            title: l10n.data_import_settings,
                          ),
                          _AeEndpointPathArea(
                            entityId: globalSettings.meta.id!,
                            sessionId: sessionId,
                            validationGroupId: validationGroupId,
                          ),
                          const AppListViewSeperator.divider(),
                          _PdfViewerUrlArea(
                            entityId: globalSettings.meta.id!,
                            sessionId: sessionId,
                            validationGroupId: validationGroupId,
                          ),
                          const AppListViewSeperator.divider(),
                          _DataImportFolderPathArea(
                            entityId: globalSettings.meta.id!,
                            sessionId: sessionId,
                            validationGroupId: validationGroupId,
                          ),
                          const AppListViewSeperator.divider(),
                          _ArtworkFolderPathArea(
                            entityId: globalSettings.meta.id!,
                            sessionId: sessionId,
                            validationGroupId: validationGroupId,
                          ),
                          const SizedBox(
                            height: AppSpace.xxl * 3,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      const Spacer(),
                      _Footer(
                        floatingWindowId: floatingWindowId,
                        formKey: formKey.value,
                        readOnly: settingsState.whenOrNull(
                              data: (data) =>
                                  data.meta.editingSessionId != sessionId,
                            ) ??
                            true,
                        navigatorKey: navigatorKey,
                        entityId: globalSettings.meta.id!,
                        sessionId: sessionId,
                        meta: settingsState.whenOrNull(
                          data: (data) => data.meta,
                        ),
                        onSave: onSave,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

/// Area for managing AE endpoint path with validation
class _AeEndpointPathArea extends HookConsumerWidget {
  const _AeEndpointPathArea({
    required this.entityId,
    required this.sessionId,
    required this.validationGroupId,
  });

  final int entityId;
  final String sessionId;
  final String validationGroupId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final controller = useTextEditingController();
    final focusNode = useFocusNode();

    final settings = ref.watch(
      globalSettingsStateProvider(entityId, sessionId),
    );

    final readOnly = settings.whenOrNull(
          data: (data) => data.meta.editingSessionId != sessionId,
        ) ??
        true;

    // Set initial value only once
    useEffect(
      () {
        if (settings.hasValue) {
          controller.text = settings.value!.data.aeEndpointPath;
        }
        return null;
      },
      const [],
    );

    return _GlobalSettingsField(
      title: l10n.data_import_ae_endpoint,
      subTitle: l10n.data_import_ae_endpoint_subtitle,
      controller: controller,
      focusNode: focusNode,
      validationGroupId: validationGroupId,
      readOnly: readOnly,
      hint: 'https://example.com/api',
      onChanged: readOnly
          ? null
          : (value) {
              ref
                  .read(
                    globalSettingsStateProvider(entityId, sessionId).notifier,
                  )
                  .updateAeEndpointPath(value);
            },
      actions: [
        _ResetButton(
          tooltip: 'AE Endpoint zurücksetzen'.hc,
          readOnly: readOnly,
          onPressed: () async {
            try {
              ref
                  .read(
                    globalSettingsStateProvider(entityId, sessionId).notifier,
                  )
                  .updateAeEndpointPath('');
              controller.text = '';
            } catch (e) {
              if (context.mounted) {
                AppNotificationOverlay.error(
                  context,
                  'Fehler beim Zurücksetzen des AE Endpoints'.hc,
                );
              }
            }
          },
        ),
      ],
    );
  }
}

/// Area for managing PDF viewer URL with validation
class _PdfViewerUrlArea extends HookConsumerWidget {
  const _PdfViewerUrlArea({
    required this.entityId,
    required this.sessionId,
    required this.validationGroupId,
  });

  final int entityId;
  final String sessionId;
  final String validationGroupId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();
    final focusNode = useFocusNode();

    final settings = ref.watch(
      globalSettingsStateProvider(entityId, sessionId),
    );

    final readOnly = settings.whenOrNull(
          data: (data) => data.meta.editingSessionId != sessionId,
        ) ??
        true;

    // Set initial value only once
    useEffect(
      () {
        if (settings.hasValue) {
          controller.text = settings.value!.data.pdfViewerUrl ?? '';
        }
        return null;
      },
      const [],
    );

    return _GlobalSettingsField(
      title: 'Pdf Viewer Url'.hc,
      subTitle: 'URL für den externen PDF Viewer'.hc,
      controller: controller,
      focusNode: focusNode,
      validationGroupId: validationGroupId,
      readOnly: readOnly,
      hint: 'https://example.com/pdf-viewer',
      onChanged: readOnly
          ? null
          : (value) {
              ref
                  .read(
                    globalSettingsStateProvider(entityId, sessionId).notifier,
                  )
                  .updatePdfViewerUrl(value);
            },
      actions: [
        _ResetButton(
          tooltip: 'PDF Viewer URL zurücksetzen'.hc,
          readOnly: readOnly,
          onPressed: () async {
            try {
              ref
                  .read(
                    globalSettingsStateProvider(entityId, sessionId).notifier,
                  )
                  .updatePdfViewerUrl('');
              controller.text = '';
            } catch (e) {
              if (context.mounted) {
                AppNotificationOverlay.error(
                  context,
                  'Fehler beim Zurücksetzen des PDF Viewer URLs'.hc,
                );
              }
            }
          },
        ),
      ],
    );
  }
}

/// Area for managing data import output path with directory picker
class _DataImportFolderPathArea extends HookConsumerWidget {
  const _DataImportFolderPathArea({
    required this.entityId,
    required this.sessionId,
    required this.validationGroupId,
  });

  final int entityId;
  final String sessionId;
  final String validationGroupId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final controller = useTextEditingController();
    final focusNode = useFocusNode();
    final filePickerController = ref.watch(filePickerControllerProvider);

    final settings = ref.watch(
      globalSettingsStateProvider(entityId, sessionId),
    );

    final readOnly = settings.whenOrNull(
          data: (data) => data.meta.editingSessionId != sessionId,
        ) ??
        true;

    // Update text field when settings change
    useEffect(
      () {
        if (settings.hasValue) {
          controller.text = settings.value!.data.dataImportFolderPath;
        }
        return null;
      },
      [settings],
    );

    return _GlobalSettingsField(
      title: l10n.data_import_output_path,
      subTitle: l10n.data_import_output_path_subtitle,
      controller: controller,
      focusNode: focusNode,
      validationGroupId: validationGroupId,
      readOnly: true,
      hint: '/Documents/COE',
      actions: [
        _FolderPickerButton(
          tooltip: l10n.data_import_output_path_choose_folder,
          readOnly: readOnly,
          filePickerController: filePickerController,
          controller: controller,
          entityId: entityId,
          sessionId: sessionId,
          onPathSelected: (path) {
            ref
                .read(
                  globalSettingsStateProvider(entityId, sessionId).notifier,
                )
                .updateDataImportFolderPath(path);
          },
        ),
        _ResetButton(
          tooltip: l10n.data_import_output_path_reset_to_default,
          readOnly: readOnly,
          onPressed: () async {
            try {
              ref
                  .read(
                    globalSettingsStateProvider(entityId, sessionId).notifier,
                  )
                  .updateDataImportFolderPath('');
              controller.text = '';
            } catch (e) {
              if (context.mounted) {
                AppNotificationOverlay.error(
                  context,
                  l10n.data_import_error_resetting_directory,
                );
              }
            }
          },
        ),
      ],
    );
  }
}

/// Reusable reset button for global settings
class _ResetButton extends ConsumerWidget {
  const _ResetButton({
    required this.tooltip,
    required this.onPressed,
    this.readOnly = false,
  });

  final String tooltip;
  final VoidCallback? onPressed;
  final bool readOnly;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpace.xs),
      child: AppButton.secondary(
        iconPosition: AppButtonIconPosition.leftOutside,
        tooltip: tooltip,
        iconData: AppIcons.reset,
        onPressed: readOnly ? null : onPressed,
      ),
    );
  }
}

/// Reusable folder picker button for global settings
class _FolderPickerButton extends HookConsumerWidget {
  const _FolderPickerButton({
    required this.tooltip,
    required this.readOnly,
    required this.filePickerController,
    required this.controller,
    required this.entityId,
    required this.sessionId,
    required this.onPathSelected,
  });

  final String tooltip;
  final bool readOnly;
  final FilePickerController filePickerController;
  final TextEditingController controller;
  final int entityId;
  final String sessionId;
  final void Function(String path) onPathSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = useState(false);

    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpace.xs),
      child: AppButton.secondary(
        iconPosition: AppButtonIconPosition.leftOutside,
        tooltip: tooltip,
        iconData: AppIcons.folder,
        onPressed: readOnly || isLoading.value
            ? null
            : () async {
                if (readOnly) return;
                isLoading.value = true;

                try {
                  final result = await filePickerController.pickDirectory(
                    initialDirectory:
                        controller.text.isEmpty ? null : controller.text,
                  );

                  if (result != null) {
                    onPathSelected(result);
                  }
                } catch (e) {
                  if (context.mounted) {
                    AppNotificationOverlay.error(
                      context,
                      context.l10n.data_import_error_picking_directory,
                    );
                  }
                } finally {
                  if (context.mounted) isLoading.value = false;
                }
              },
      ),
    );
  }
}

/// Reusable field component for global settings with consistent layout
class _GlobalSettingsField extends HookConsumerWidget {
  const _GlobalSettingsField({
    required this.title,
    required this.subTitle,
    required this.controller,
    required this.focusNode,
    required this.validationGroupId,
    required this.readOnly,
    required this.hint,
    this.onChanged,
    this.actions = const [],
  });

  final String title;
  final String subTitle;
  final TextEditingController controller;
  final FocusNode focusNode;
  final String validationGroupId;
  final bool readOnly;
  final String hint;
  final void Function(String)? onChanged;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppWindowTile(
      isTextField: true,
      title: title,
      subTitle: subTitle,
      content: (width) => Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: NextCardFormField.text(
              labelPosition: NextCardFormFieldLabelPosition.top,
              validationGroup: validationGroupId,
              validator: null,
              controller: controller,
              focusNode: focusNode,
              maxLines: 1,
              label: '',
              readOnly: readOnly,
              hint: hint,
              onChanged: onChanged,
            ),
          ),
          ...actions.map(
            (action) => Padding(
              padding: const EdgeInsets.only(left: AppSpace.m),
              child: action,
            ),
          ),
        ],
      ),
    );
  }
}

/// Area for managing artwork folder path with directory picker
class _ArtworkFolderPathArea extends HookConsumerWidget {
  const _ArtworkFolderPathArea({
    required this.entityId,
    required this.sessionId,
    required this.validationGroupId,
  });

  final int entityId;
  final String sessionId;
  final String validationGroupId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final l10n = context.l10n;
    final controller = useTextEditingController();
    final focusNode = useFocusNode();
    final filePickerController = ref.watch(filePickerControllerProvider);

    final settings = ref.watch(
      globalSettingsStateProvider(entityId, sessionId),
    );

    final readOnly = settings.whenOrNull(
          data: (data) => data.meta.editingSessionId != sessionId,
        ) ??
        true;

    // Update text field when settings change
    useEffect(
      () {
        if (settings.hasValue) {
          controller.text = settings.value!.data.artworkFolderPath;
        }
        return null;
      },
      [settings],
    );

    return _GlobalSettingsField(
      title: 'Artwork Folder Path'.hc,
      subTitle: 'Ordner für die Artwork-Dateien'.hc,
      controller: controller,
      focusNode: focusNode,
      validationGroupId: validationGroupId,
      readOnly: true,
      hint: '/Documents/Artwork'.hc,
      actions: [
        _FolderPickerButton(
          tooltip: 'Artwork-Ordner auswählen'.hc,
          readOnly: readOnly,
          filePickerController: filePickerController,
          controller: controller,
          entityId: entityId,
          sessionId: sessionId,
          onPathSelected: (path) {
            ref
                .read(
                  globalSettingsStateProvider(entityId, sessionId).notifier,
                )
                .updateArtworkFolderPath(path);
          },
        ),
        _ResetButton(
          tooltip: 'Artwork-Ordner zurücksetzen'.hc,
          readOnly: readOnly,
          onPressed: () async {
            try {
              ref
                  .read(
                    globalSettingsStateProvider(entityId, sessionId).notifier,
                  )
                  .updateArtworkFolderPath('');
              controller.text = '';
            } catch (e) {
              if (context.mounted) {
                AppNotificationOverlay.error(
                  context,
                  'Fehler beim Zurücksetzen des Artwork-Ordners'.hc,
                );
              }
            }
          },
        ),
      ],
    );
  }
}

/// Footer with save actions and state management
class _Footer extends HookConsumerWidget {
  const _Footer({
    required this.floatingWindowId,
    required this.formKey,
    required this.readOnly,
    required this.navigatorKey,
    required this.entityId,
    required this.sessionId,
    required this.meta,
    this.onSave,
  });

  final String floatingWindowId;
  final GlobalKey<FormState> formKey;
  final bool readOnly;
  final GlobalKey<NavigatorState> navigatorKey;
  final int entityId;
  final String sessionId;
  final DataMeta? meta;
  final void Function(GlobalSettings settings)? onSave;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSaving = useState(false);
    final savedOrInitialEntity = useRef<GlobalSettings?>(null);

    Future<void> onSavePressed({bool closeAfterSave = false}) async {
      Future<void> saveOperation() async {
        final settings = ref
            .read(globalSettingsStateProvider(entityId, sessionId))
            .requireValue;

        await ref.read(globalSettingsRepositoryProvider).update(
              entity: settings,
              release: closeAfterSave,
              sessionId: sessionId,
            );

        // Notify parent of successful save
        onSave?.call(settings);
      }

      final (:success, :exception, :data) =
          await AsyncHandler.handleAsyncOperation(
        context,
        saveOperation,
        successMessage: context.l10n.gen_saving_success,
        successNavigatorKey: navigatorKey,
        errorNavigatorKey: navigatorKey,
      );

      if (success && closeAfterSave) {
        ref.removeWindow(floatingWindowId);
      }
    }

    return ColoredBox(
      color: context.appTheme.generalColors.background,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const AppDivider(),
          Padding(
            padding: const EdgeInsets.all(AppSpace.m),
            child: DefaultCardFooter<GlobalSettings>(
              savedOrInitialEntity: savedOrInitialEntity,
              onSaveError: null,
              isSaving: isSaving,
              readOnly: readOnly,
              navigatorKey: navigatorKey,
              formKey: formKey,
              meta: meta,
              windowId: floatingWindowId,
              onSavePressed: () => onSavePressed(closeAfterSave: false),
              onSaveAndClosePressed: null,
              hideDeleteButton: true,
            ),
          ),
        ],
      ),
    );
  }
}
