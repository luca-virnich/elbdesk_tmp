import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_core/src/data/edit_request/reject_edit_request.dart';
import 'package:elbdesk_core/src/framework/window_shortcut_blocker.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:elbdesk_window_manager/elbdesk_window_manager.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'edit_request_view.g.dart';

@riverpod
class DataHasUpdates extends _$DataHasUpdates {
  @override
  bool build(String sessionId) {
    return false;
  }

  void setHasUpdates() {
    state = true;
  }

  void resetHasUpdates() {
    state = false;
  }
}

class DataRequestView extends HookConsumerWidget {
  const DataRequestView({
    required this.formKey,
    required this.dataEditType,
    required this.editingByName,
    required this.onRefresh,
    required this.primaryKey,
    required this.windowId,
    required this.sessionId,
    required this.tableType,
    required this.onRelease,
    required this.navigatorKey,
    required this.showCanEditBar,
    required this.hasRequestedEditNotifier,
    super.key,
  });
  final DataEditType dataEditType;
  final String? editingByName;
  final GlobalKey<FormState>? formKey;
  final VoidCallback onRefresh;
  final int primaryKey;
  final String? windowId;
  final String sessionId;
  final String tableType;
  final Future<void> Function() onRelease;
  final GlobalKey<NavigatorState>? navigatorKey;
  final ValueNotifier<bool> showCanEditBar;
  final ValueNotifier<bool> hasRequestedEditNotifier;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    // whenever the status changes, the user can re-request the edit
    useEffect(
      () {
        if (hasRequestedEditNotifier.value) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            hasRequestedEditNotifier.value = false;
          });
        }
        return null;
      },
      [dataEditType],
    );
    // if the same user edits the data, we show the requests area, this will
    // be popping up when some other user requests an edit
    if (dataEditType == DataEditType.same) {
      return _RequestsArea(
        windowId: windowId,
        entityId: primaryKey,
        sessionId: sessionId,
        onRelease: onRelease,
        tableType: tableType,
        formKey: formKey,
        navigatorKey: navigatorKey,
      );
    }

    // when another user is editing the data when we are opening the window,
    // we want to show a notification
    useEffect(
      () {
        if (dataEditType == DataEditType.other ||
            dataEditType == DataEditType.you) {
          Future.delayed(const Duration(milliseconds: 500), () {
            if (context.mounted) {
              final text = dataEditType == DataEditType.you
                  ? l10n.gen_already_edited_by_you
                  : l10n.gen_already_edited_by(editingByName!);
              AppNotificationOverlay.info(
                context,
                text,
                duration: const Duration(milliseconds: 4000),
              );
            }
          });
        }
        return null;
      },
      [],
    );

    // listen to the reject edit requests to show a dialog when the request
    // is rejected
    ref.listen(
        watchRejectEditRequestsByWindowIdProvider(
          tableType: tableType,
          primaryKey: primaryKey,
          requestingFloatingWindowId: windowId!,
        ), (previous, next) {
      if (next is AsyncData<RejectEditRequest>) {
        showElbDialog<void>(
          isDismissible: true,
          context: context,
          navigatorKey: navigatorKey,
          child: ElbAlertDialog(
            titleText: l10n.gen_attention,
            actions: [
              AppButton.secondary(
                label: l10n.gen_close,
                onPressed: () {
                  hasRequestedEditNotifier.value = false;
                  Navigator.of(context).pop();
                },
              ),
            ],
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  l10n.gen_rejected_edit_request_by(next.value.createdByName),
                ),
                if (next.value.reason.isNotEmpty) ...[
                  const SizedBox(height: AppSpace.m),
                  AppText(
                    next.value.reason,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ],
            ),
          ),
        );
      }
    });

    useValueListenable(showCanEditBar);
    if (!showCanEditBar.value && dataEditType == DataEditType.none) {
      return const SizedBox.shrink();
    }
    if (dataEditType != DataEditType.none) {
      return const SizedBox.shrink();
    }

    final statusColors = context.appTheme.statusColors;

    return Column(
      children: [
        InfoBar(
          height: 55,
          color: statusColors.success,
          children: [
            Expanded(
              child: AppText(
                l10n.gen_prev_edited_hint,
                maxLines: 1,
                color: statusColors.onSuccess,
              ),
            ),
            if (dataEditType == DataEditType.none)
              AppButton.outline(
                color: context.appTheme.statusColors.onSuccess,
                borderColor: context.appTheme.statusColors.onSuccess,
                borderColorOnHover: context.appTheme.statusColors.onSuccess,
                foregroundColorOnHover: context.appTheme.statusColors.onSuccess,
                overlayColor:
                    context.appTheme.generalColors.overlayColorWhileDragging,
                onPressed: onRefresh,
                label: l10n.gen_edit,
                iconData: AppIcons.edit,
                iconPosition: AppButtonIconPosition.rightInside,
              ),
          ],
        ),
      ],
    );
  }
}

class _UpdateAvailableBar extends StatelessWidget {
  const _UpdateAvailableBar({
    required this.hasUpdates,
    required this.onRefresh,
  });

  final bool hasUpdates;
  final VoidCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AutoAnimatedSize(
      expanded: hasUpdates,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const AppDivider(),
          InfoBar(
            mainAxisAlignment: MainAxisAlignment.end,
            color: context.appTheme.generalColors.primarySurface,
            children: [
              AppShimmer.fromColors(
                baseColor: context.appTheme.generalColors.onBackground,
                highlightColor: context.appTheme.generalColors.primarySurface,
                child: AppButton.outline(
                  iconData: AppIcons.refresh,
                  iconPosition: AppButtonIconPosition.rightInside,
                  onPressed: () {},
                  label: l10n.gen_update_available,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// This is shown when someone want to edit the data and the user has
/// currently in the session the lock/
class _RequestsArea extends HookConsumerWidget {
  const _RequestsArea({
    required this.entityId,
    required this.sessionId,
    required this.windowId,
    required this.onRelease,
    required this.tableType,
    required this.formKey,
    required this.navigatorKey,
  });
  final int entityId;
  final String sessionId;
  final String? windowId;
  final VoidCallback onRelease;
  final String tableType;
  final GlobalKey<FormState>? formKey;
  final GlobalKey<NavigatorState>? navigatorKey;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statusColors = context.appTheme.statusColors;
    final messages = useState<List<EditRequest>>([]);

    // this is inside the floating window mounted where we are editing

    useEffect(
      () {
        final lastRequest = messages.value.lastOrNull;
        if (lastRequest == null) return;

        if (windowId != null) {
          ref.read(windowManagerProvider).startHighlight(windowId!);
        }

        return null;
      },
      [],
    );

    ref.listen(
        watchEditRequestsProvider(
          primaryKey: entityId,
          tableType: tableType,
        ), (previous, next) {
      final request = next.asData?.value;
      if (request == null) return;
      if (windowId != null) {
        ref.read(windowManagerProvider).startHighlight(windowId!);
      }
      messages.value = [...messages.value, request];
    });
    final lastRequest = messages.value.lastOrNull;
    final l10n = context.l10n;

    final windowNavigator = ref.watch(windowNavigatorProvider(windowId!));

    return AutoAnimatedSize(
      expanded: messages.value.isNotEmpty,
      child: SizedBox(
        height: 55,
        child: InfoBar(
          color: statusColors.error,
          children: [
            Expanded(
              child: AppText(
                lastRequest?.formattedMessage(l10n) ?? '',
                color: statusColors.onError,
              ),
            ),
            // we can release the window and lock
            AppButton.outline(
              color: statusColors.onError,
              borderColor: statusColors.onError,
              borderColorOnHover: statusColors.onError,
              foregroundColorOnHover: statusColors.onError,
              overlayColor:
                  context.appTheme.generalColors.overlayColorWhileDragging,
              onPressed: () async {
                // check if current state is valid
                final isValid = formKey?.currentState?.validate() ?? false;

                if (!isValid) {
                  AppNotificationOverlay.error(
                    context,
                    l10n.gen_saving_error,
                    navigatorKey: windowNavigator,
                  );
                  return;
                }
                // try to relase and remove all highlights
                try {
                  onRelease();

                  if (windowId != null) {
                    ref.read(windowManagerProvider).stopHighlight(windowId!);
                  }
                  messages.value = [];
                } catch (e) {
                  if (context.mounted) {
                    AppNotificationOverlay.error(
                      context,
                      e.toString(),
                      navigatorKey: windowNavigator,
                    );
                  }
                }
              },
              label: l10n.gen_save_and_unlock,
            ),
            const SizedBox(width: AppSpace.m),
            // decline the request
            AppIconButton.secondary(
              color: statusColors.onError,
              overlayColor: statusColors.onError.withAppOpacity(0.2),
              onPressed: () async {
                if (windowId != null) {
                  ref.read(windowManagerProvider).stopHighlight(windowId!);
                }
                // decline the lastRequest, implement cancel request send to
                // floatung window with text field
                final reason = await showElbDialog<String?>(
                  context: context,
                  navigatorKey: windowNavigator,
                  child: const _RejectRequestDialog(),
                  isDismissible: false,
                );
                if (reason == null) {
                  return;
                }
                if (!context.mounted) return;
                // send the request to the server
                final request = RejectEditRequest(
                  tableType: tableType,
                  tablePrimaryKey: entityId,
                  createdByName: '',
                  createdAt: DateTime.now(),
                  reason: reason,
                  requestingFloatingWindowId:
                      lastRequest?.requestingFloatingWindowId ?? '',
                );

                final res = await AsyncHandler.handleAsyncOperation(
                  context,
                  () => ref
                      .read(editRequestRepositoryProvider)
                      .rejectRequest(request: request),
                );
                if (res.success && context.mounted) {
                  messages.value =
                      messages.value.sublist(0, messages.value.length - 1);
                }

                return;
              },
              iconData: AppIcons.close,
            ),
          ],
        ),
      ),
    );
  }
}

class _RejectRequestDialog extends HookWidget {
  const _RejectRequestDialog();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final focusNode = useFocusNode();
    final reasonController = useTextEditingController();
    useEffect(
      () {
        focusNode.requestFocus();
        return null;
      },
      [],
    );
    return WindowShortcutBlocker(
      child: ElbAlertDialog(
        hideCloseButton: true,
        titleText: l10n.gen_reject_edit_request,
        actions: [
          AppButton.secondary(
            label: l10n.gen_cancel,
            onPressed: () {
              Navigator.of(context).pop(null);
            },
          ),
          AppButton.danger(
            label: l10n.gen_reject,
            onPressed: () {
              Navigator.of(context).pop(reasonController.text.trim());
            },
          ),
          // AppButton.primary(label: 'Reject', onPressed: () {}),
        ],
        child: NextTextField(
          controller: reasonController,
          focusNode: focusNode,
          hintText: l10n.gen_reject_edit_request_reason,
        ),
      ),
    );
  }
}
