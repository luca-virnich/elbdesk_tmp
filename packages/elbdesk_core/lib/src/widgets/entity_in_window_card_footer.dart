import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EntityInWindowCardFooter<T> extends HookWidget {
  const EntityInWindowCardFooter({
    required this.formKey,
    required this.onSave,
    required this.readOnly,
    required this.isSavingNotifier,
    required this.onSaveError,
    required this.navigatorKey,
    required this.stateProvider,
    required this.savedOrInitialEntity,
    this.meta,
    super.key,
  });

  final GlobalKey<NavigatorState> navigatorKey;
  final GlobalKey<FormState> formKey;

  final Future<T?> Function() onSave;

  final bool readOnly;
  final ValueNotifier<bool> isSavingNotifier;
  final void Function(ElbException?)? onSaveError;
  final DataMeta? meta;
  final ProviderListenable<AsyncValue<T>> stateProvider;
  final ValueNotifier<T?> savedOrInitialEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: meta != null
                    ? AppWindowBottomStatusBar(
                        padding: EdgeInsets.zero,
                        meta: meta!,
                        isEntityDeleted: false,
                      )
                    : const SizedBox.shrink(),
              ),
              _SaveOrCloseWrapper(
                isSavingNotifier: isSavingNotifier,
                readOnly: readOnly,
                navigatorKey: navigatorKey,
                formKey: formKey,
                onSave: onSave,
                savedOrInitialEntity: savedOrInitialEntity,
                onSaveError: onSaveError,
                stateProvider: stateProvider,
              ),
            ],
          ),
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
    required this.onSaveError,
    required this.stateProvider,
  });

  final ValueNotifier<bool> isSavingNotifier;

  final void Function(ElbException?)? onSaveError;
  final Future<T?> Function() onSave;
  // final ObjectRef<T?> savedOrInitialEntity;
  final bool readOnly;
  final GlobalKey<FormState> formKey;
  final GlobalKey<NavigatorState> navigatorKey;
  final ProviderListenable<AsyncValue<T>> stateProvider;
  final ValueNotifier<T?> savedOrInitialEntity;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uuid = useUuid();
    final currentState = ref.watch(stateProvider);
    useValueListenable(savedOrInitialEntity);
    final currentComparable = currentState.requireValue;
    final initialComparable = savedOrInitialEntity.value;

    final hasChanges = hasEntityChanges(
      currentComparable,
      initialComparable,
    );

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
      child: !hasChanges || readOnly
          ? _CloseButton(
              key: ValueKey('close_button_$uuid'),
            )
          : _SaveButton<T>(
              key: ValueKey('save_button_$uuid'),
              isSavingNotifier: isSavingNotifier,
              readOnly: readOnly,
              formKey: formKey,
              navigatorKey: navigatorKey,
              onSave: onSave,
              onSaveError: onSaveError,
              savedOrInitialEntity: savedOrInitialEntity,
            ),
    );
  }
}

class _CloseButton extends ConsumerWidget {
  const _CloseButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    return AppButton.secondary(
      onPressed: () {
        Navigator.of(context).pop();
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
    super.key,
  });

  final ValueNotifier<bool> isSavingNotifier;
  final bool readOnly;
  final GlobalKey<FormState> formKey;
  final GlobalKey<NavigatorState> navigatorKey;
  final Future<T?> Function() onSave;
  final ValueNotifier<T?>? savedOrInitialEntity;

  final void Function(ElbException?)? onSaveError;
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
                      await AsyncHandler.handleAsyncOperation<T>(
                    context,
                    onSave,
                    successMessage: l10n.gen_saving_success,
                    successNavigatorKey: navigatorKey,
                    errorNavigatorKey: navigatorKey,
                    showErrorNotification: onSaveError == null,
                  );
                  if (context.mounted) {
                    if (success) {
                      isSavingNotifier.value = false;
                      savedOrInitialEntity?.value = data;
                    } else {
                      onSaveError?.call(exception);
                      isSavingNotifier.value = false;
                    }
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
                      await AsyncHandler.handleAsyncOperation<T>(
                    context,
                    onSave,
                    errorNavigatorKey: navigatorKey,
                    successNavigatorKey: navigatorKey,
                    successMessage: l10n.gen_saving_success,
                    showErrorNotification: onSaveError == null,
                  );

                  if (!success) {
                    if (context.mounted) {
                      isSavingNotifier.value = false;
                      onSaveError?.call(exception);
                    }
                    return;
                  } else {
                    if (context.mounted) {
                      Navigator.of(context).pop(data);
                    }
                  }
                },
          icon: AppIcons.check,
        ),
      ],
    );
  }
}
