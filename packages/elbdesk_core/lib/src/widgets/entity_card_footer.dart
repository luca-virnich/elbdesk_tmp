import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EntityCardFooter<T> extends StatelessWidget {
  const EntityCardFooter({
    required this.readOnly,
    required this.isSavingNotifier,
    required this.floatingWindowId,
    required this.meta,
    required this.onSavePressed,
    required this.formKey,
    required this.navigatorKey,
    required this.onSaveError,
    required this.savedOrInitialEntity,
    required this.stateProvider,
    super.key,
    this.hideDeleteButton = true,
    this.hideSaveAndCloseButton = false,
    this.onDeletePressed,
    this.onSaveAndClosePressed,
  });

  final bool readOnly;
  final ValueNotifier<bool> isSavingNotifier;

  final String floatingWindowId;
  final DataMeta meta;

  /// Whether to hide the delete button.
  /// Defaults to false.
  final bool hideDeleteButton;

  /// Whether to hide the save-and-close button.
  /// Defaults to false.
  final bool hideSaveAndCloseButton;

  /// The callback function that is called when the delete button is pressed.
  final Future<void> Function()? onDeletePressed;

  /// The callback function that is called when the save button is pressed.
  final Future<T> Function() onSavePressed;

  /// The callback function that is called when the save-and-close button is
  /// pressed.
  final Future<void> Function()? onSaveAndClosePressed;

  /// The leading, non-collapsible actions of the footer

  /// The list of widgets to display as collapsible actions.

  final GlobalKey<NavigatorState> navigatorKey;
  final GlobalKey<FormState> formKey;
  final ObjectRef<T?> savedOrInitialEntity;
  final void Function(ElbException?, GlobalKey<NavigatorState>)? onSaveError;
  final ProviderListenable<AsyncValue<T>> stateProvider;

  static const spacing = UiConstants.defaultPadding / 2;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16,
        right: 16,
        bottom: 2,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: AppWindowBottomStatusBar(
                  meta: meta,
                  isEntityDeleted: false,
                ),
              ),
              _SaveOrCloseWrapper<T>(
                stateProvider: stateProvider,
                isSavingNotifier: isSavingNotifier,
                readOnly: readOnly,
                formKey: formKey,
                navigatorKey: navigatorKey,
                onSave: onSavePressed,
                onSaveError: onSaveError,
                savedOrInitialEntity: savedOrInitialEntity,
                floatingWindowId: floatingWindowId,
                meta: meta,
              ),
            ],
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

class _SaveOrCloseWrapper<T> extends HookConsumerWidget {
  const _SaveOrCloseWrapper({
    required this.isSavingNotifier,
    required this.readOnly,
    required this.formKey,
    required this.navigatorKey,
    required this.onSave,
    required this.savedOrInitialEntity,
    required this.floatingWindowId,
    required this.onSaveError,
    required this.stateProvider,
    required this.meta,
  });

  final ValueNotifier<bool> isSavingNotifier;
  final String floatingWindowId;
  final void Function(ElbException?, GlobalKey<NavigatorState>)? onSaveError;
  final Future<void> Function() onSave;
  final ObjectRef<T?> savedOrInitialEntity;
  final bool readOnly;
  final GlobalKey<FormState> formKey;
  final GlobalKey<NavigatorState> navigatorKey;
  final ProviderListenable<AsyncValue<T>> stateProvider;
  final DataMeta meta;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentState = ref.watch(stateProvider);
    final currentComparable = currentState.requireValue;
    final initialComparable = savedOrInitialEntity.value;

    final hasChanges = hasEntityChanges(
      currentComparable,
      initialComparable,
    );

    useValueListenable(isSavingNotifier);

    return AnimatedSwitcher(
      duration: AnimationConstants.defaultDuration,
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      layoutBuilder: (currentChild, previousChildren) {
        return Stack(
          alignment: Alignment.centerRight,
          children: <Widget>[
            ...previousChildren,
            if (currentChild != null) currentChild,
          ],
        );
      },
      child: (!hasChanges && !meta.isDraft) || readOnly
          ? _CloseButton(
              key: ValueKey('close_button_$floatingWindowId'),
              floatingWindowId: floatingWindowId,
            )
          : _SaveButton<T>(
              stateProvider: stateProvider,
              key: ValueKey('save_button_$floatingWindowId'),
              isSavingNotifier: isSavingNotifier,
              readOnly: readOnly,
              formKey: formKey,
              navigatorKey: navigatorKey,
              onSave: onSave,
              onSaveError: onSaveError,
              savedOrInitialEntity: savedOrInitialEntity,
              floatingWindowId: floatingWindowId,
            ),
    );
  }
}

class _CloseButton extends ConsumerWidget {
  const _CloseButton({
    required this.floatingWindowId,
    super.key,
  });
  final String floatingWindowId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    return AppButton.secondary(
      onPressed: () {
        ref.removeWindow(floatingWindowId);
      },
      label: l10n.gen_close,
    );
  }
}

class _SaveButton<T> extends ConsumerWidget {
  const _SaveButton({
    required this.isSavingNotifier,
    required this.readOnly,
    required this.formKey,
    required this.navigatorKey,
    required this.onSave,
    required this.onSaveError,
    required this.savedOrInitialEntity,
    required this.floatingWindowId,
    required this.stateProvider,
    super.key,
  });

  final ValueNotifier<bool> isSavingNotifier;
  final bool readOnly;
  final GlobalKey<FormState> formKey;
  final GlobalKey<NavigatorState> navigatorKey;
  final Future<void> Function() onSave;
  final ObjectRef<T?> savedOrInitialEntity;
  final String floatingWindowId;
  final void Function(ElbException?, GlobalKey<NavigatorState>)? onSaveError;
  final ProviderListenable<AsyncValue<T>> stateProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;

    return SegmentedAppButton.primary(
      segments: [
        SegmentedAppButtonSegment(
          isLoading: isSavingNotifier.value,
          tooltip: l10n.gen_save,
          onPressed: isSavingNotifier.value || readOnly
              ? null
              : () async {
                  final isValid = formKey.currentState?.validate() ?? false;

                  if (!isValid) {
                    AppNotificationOverlay.error(
                      context,
                      l10n.gen_saving_error,
                    );

                    return;
                  }
                  isSavingNotifier.value = true;

                  final (:success, :exception, :data) =
                      await AsyncHandler.handleAsyncOperation(
                    context,
                    onSave,
                    successMessage: l10n.gen_saving_success,
                    successNavigatorKey: navigatorKey,
                    errorNavigatorKey: navigatorKey,
                    showErrorNotification: onSaveError == null,
                  );
                  if (context.mounted) {
                    if (success) {
                      savedOrInitialEntity.value =
                          ref.read(stateProvider).requireValue;
                    } else {
                      onSaveError?.call(exception, navigatorKey);
                    }
                    isSavingNotifier.value = false;
                  }
                },
          icon: AppIcons.save,
        ),
        SegmentedAppButtonSegment(
          isLoading: isSavingNotifier.value,
          label: l10n.gen_save_and_close,
          onPressed: isSavingNotifier.value || readOnly
              ? null
              : () async {
                  isSavingNotifier.value = true;

                  final isValid = formKey.currentState?.validate() ?? false;
                  if (!isValid) {
                    AppNotificationOverlay.error(
                      context,
                      l10n.gen_saving_error,
                    );
                    isSavingNotifier.value = false;
                    return;
                  }

                  final (:success, :exception, :data) =
                      await AsyncHandler.handleAsyncOperation(
                    context,
                    onSave,
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
                },
          icon: AppIcons.check,
        ),
      ],
    );
  }
}
