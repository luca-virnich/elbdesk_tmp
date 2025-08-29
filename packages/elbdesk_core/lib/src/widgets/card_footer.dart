import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// A widget that displays a footer with action buttons for a card.
///
/// The [DefaultCardFooter] widget is a [HookWidget] that provides a footer with
/// action buttons such as delete, save, and save-and-close. It also supports
/// collapsible actions that can be displayed in an [AppCollapsibleBar].
///
/// {@tool snippet}
/// This example shows how to use [DefaultCardFooter] with some action buttons:
///
/// ```dart
/// CardFooter(
///   onDeletePressed: () {
///     print('Delete button pressed');
///   },
///   onSavePressed: () {
///     print('Save button pressed');
///   },
///   onSaveAndClosePressed: () {
///     print('Save and close button pressed');
///   },
///   collapsibleActions: [
///     Text('Action 1'),
///     Text('Action 2'),
///   ],
/// )
/// ```
/// {@end-tool}
///
/// See also:
///
///  * [AppDeleteIconButton], which is used to display the delete button.

/// save-and-close buttons.
///  * [AppCollapsibleBar], which is used to display the collapsible actions.
class DefaultCardFooter<T> extends HookConsumerWidget {
  /// Creates a [DefaultCardFooter] widget.
  ///
  /// The [onDeletePressed], [onSavePressed], [onSaveAndClosePressed], and
  /// [collapsibleActions] parameters are optional.
  const DefaultCardFooter({
    required this.formKey,
    required this.onSavePressed,
    required this.savedOrInitialEntity,
    required this.windowId,
    required this.readOnly,
    required this.isSaving,
    required this.onSaveError,
    required this.navigatorKey,
    super.key,
    this.hideDeleteButton = false,
    this.hideSaveAndCloseButton = false,
    this.onDeletePressed,
    this.onSaveAndClosePressed,
    this.leadingActions = const [],
    this.trailingActions = const [],
    this.meta,
  });

  final bool readOnly;
  final ValueNotifier<bool> isSaving;

  final String? windowId;
  final DataMeta? meta;

  /// Whether to hide the delete button.
  /// Defaults to false.
  final bool hideDeleteButton;

  /// Whether to hide the save-and-close button.
  /// Defaults to false.
  final bool hideSaveAndCloseButton;

  /// The callback function that is called when the delete button is pressed.
  final Future<void> Function()? onDeletePressed;

  /// The callback function that is called when the save button is pressed.
  final Future<void> Function() onSavePressed;

  /// The callback function that is called when the save-and-close button is
  /// pressed.
  final Future<void> Function()? onSaveAndClosePressed;

  /// The leading, non-collapsible actions of the footer
  final List<Widget> leadingActions;

  /// The trailing, non-collapsible actions of the footer
  final List<Widget> trailingActions;

  /// The list of widgets to display as collapsible actions.

  final GlobalKey<NavigatorState> navigatorKey;
  final GlobalKey<FormState> formKey;
  final ObjectRef<T?> savedOrInitialEntity;
  final void Function(ElbException?, GlobalKey<NavigatorState>)? onSaveError;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // State to manage the loading status of the save button.
    useValueListenable(isSaving);

    final l10n = context.l10n;
    final leadingActionsWidgets = [
      if (!hideDeleteButton)
        CardFooterDeleteButton(
          isSaving: isSaving,
          onDelete: isSaving.value || readOnly
              ? null
              : () async {
                  await onDeletePressed?.call();
                },
          navigatorKey: navigatorKey,
        ),
      ...leadingActions,
    ];
    final trailingActionsWidgets = [
      ...trailingActions,
      if (!hideSaveAndCloseButton)
        SegmentedAppButton.primary(
          segments: [
            SegmentedAppButtonSegment(
              isLoading: isSaving.value,
              tooltip: l10n.gen_save,
              onPressed: isSaving.value || readOnly
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
                      isSaving.value = true;

                      final (:success, :exception, :data) =
                          await AsyncHandler.handleAsyncOperation(
                        context,
                        onSavePressed,
                        successMessage: l10n.gen_saving_success,
                        successNavigatorKey: navigatorKey,
                        errorNavigatorKey: navigatorKey,
                        showErrorNotification: onSaveError == null,
                      );
                      if (context.mounted) {
                        if (success) {
                          savedOrInitialEntity.value = data as T?;
                        } else {
                          onSaveError?.call(exception, navigatorKey);
                        }
                        isSaving.value = false;
                      }
                    },
              icon: AppIcons.save,
            ),
            SegmentedAppButtonSegment(
              isLoading: isSaving.value,
              label: l10n.gen_save_and_close,
              onPressed: isSaving.value || readOnly
                  ? null
                  : () async {
                      isSaving.value = true;

                      final isValid = formKey.currentState?.validate() ?? false;
                      if (!isValid) {
                        AppNotificationOverlay.error(
                          context,
                          l10n.gen_saving_error,
                        );
                        isSaving.value = false;
                        return;
                      }

                      final operation = onSaveAndClosePressed ?? onSavePressed;

                      final (:success, :exception, :data) =
                          await AsyncHandler.handleAsyncOperation(
                        context,
                        operation,
                        errorNavigatorKey: navigatorKey,
                        successNavigatorKey:
                            AppNavigatorKeys.appRootNavigatorKey,
                        successMessage: l10n.gen_saving_success,
                        showErrorNotification: onSaveError == null,
                      );

                      if (!success) {
                        if (context.mounted) {
                          isSaving.value = false;
                          onSaveError?.call(exception, navigatorKey);
                        }
                        return;
                      }
                      if (windowId != null) {
                        ref.removeWindow(windowId!);
                      }
                    },
              icon: AppIcons.check,
            ),
          ],
        ),
    ];

    return CardFooterTemplate(
      meta: meta,
      leadingActions: leadingActionsWidgets,
      trailingActions: trailingActionsWidgets,
    );
  }
}

class InWindowCardDialogFooter extends StatelessWidget {
  const InWindowCardDialogFooter({
    required this.trailingActions,
    this.leadingActions,
    super.key,
  });
  final List<Widget> trailingActions;
  final List<Widget>? leadingActions;
  @override
  Widget build(BuildContext context) {
    return CardFooterTemplate(
      leadingActions: leadingActions,
      trailingActions: trailingActions,
    );
  }
}

class DefaultEntityDeletedCardFooter<T> extends HookConsumerWidget {
  const DefaultEntityDeletedCardFooter({
    required this.savedOrInitialEntity,
    required this.windowId,
    super.key,
    this.meta,
    this.navigatorKey,
  });

  final String? windowId;
  final DataMeta? meta;
  final GlobalKey<NavigatorState>? navigatorKey;

  final ObjectRef<T?> savedOrInitialEntity;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;

    return CardFooterTemplate(
      meta: meta,
      isEntityDeleted: true,
      leadingActions: const [],
      trailingActions: [
        AppButton.primary(
          onPressed: () {
            ref.removeWindow(windowId!);
          },
          label: l10n.gen_close,
        ),
      ],
    );
  }
}

class CardFooterTemplate extends StatelessWidget {
  const CardFooterTemplate({
    this.meta,
    this.leadingActions,
    this.trailingActions,
    this.isEntityDeleted = false,
    this.padding,
    this.contentPadding,
    super.key,
  });

  final DataMeta? meta;
  final List<Widget>? leadingActions;
  final List<Widget>? trailingActions;

  final bool isEntityDeleted;
  final EdgeInsets? padding;
  final EdgeInsets? contentPadding;

  @override
  Widget build(BuildContext context) {
    const spacing = UiConstants.defaultPadding / 2;
    return Padding(
      padding: padding ??
          EdgeInsets.only(
            top: 16,
            bottom: meta != null ? 2 : 16,
          ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: contentPadding ??
                const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: 0,
                ),
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              spacing: spacing,
              runSpacing: spacing,
              children: [
                if (leadingActions != null && leadingActions!.isNotEmpty)
                  SizedBox(
                    child: Wrap(
                      children: leadingActions!
                          .map(
                            (action) => action,
                          )
                          .toList(),
                    ),
                  )
                else
                  const SizedBox.shrink(),
                if (trailingActions != null && trailingActions!.isNotEmpty)
                  SizedBox(
                    child: Wrap(
                      children: trailingActions!
                          .map(
                            (action) => action,
                          )
                          .toList(),
                    ),
                  )
                else
                  const SizedBox.shrink(),
              ],
            ),
          ),
          if (meta != null)
            AppWindowBottomStatusBar(
              meta: meta!,
              isEntityDeleted: isEntityDeleted,
            ),
        ],
      ),
    );
  }
}

// class CardFooterTemplate extends StatelessWidget {
//   const CardFooterTemplate({
//     this.meta,
//     this.leadingActions,
//     this.trailingActions,
//     this.collapsibleActions,
//     this.isEntityDeleted = false,
//     this.padding,
//     this.contentPadding,
//     super.key,
//   });

//   final DataMeta? meta;
//   final List<Widget>? leadingActions;
//   final List<Widget>? trailingActions;
//   final List<Widget>? collapsibleActions;
//   final bool isEntityDeleted;
//   final EdgeInsets? padding;
//   final EdgeInsets? contentPadding;

//   @override
//   Widget build(BuildContext context) {
//     const spacing = UiConstants.defaultPadding / 2;
//     return Padding(
//       padding: padding ??
//           EdgeInsets.only(
//             top: 16,
//             bottom: meta != null ? 2 : 16,
//           ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Padding(
//             padding: contentPadding ??
//                 const EdgeInsets.only(
//                   left: 16,
//                   right: 16,
//                   bottom: 0,
//                 ),
//             child: Row(
//               children: [
//                 if (leadingActions != null && leadingActions!.isNotEmpty)
//                   ...leadingActions!.map(
//                     (action) => Padding(
//                       padding: const EdgeInsets.only(right: spacing),
//                       child: action,
//                     ),
//                   ),
//                 if (collapsibleActions != null &&
//                     collapsibleActions!.isNotEmpty) ...[
//                   Flexible(
//                     child: AppCollapsibleBar(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       menuButtonPosition: MenuButtonPosition.start,
//                       spacing: spacing,
//                       leadingSpacing: spacing,
//                       children: collapsibleActions!,
//                     ),
//                   ),
//                 ],
//                 // If no collapsible actions are provided, display a spacer.

//                 const Spacer(),
//                 // Add spacing between the collapsible actions and the save
//                 // button.
//                 const SizedBox(width: spacing),
//                 if (trailingActions != null && trailingActions!.isNotEmpty)
//                   ...trailingActions!.map(
//                     (action) => Padding(
//                       padding: const EdgeInsets.only(left: spacing),
//                       child: action,
//                     ),
//                   ),
//                 // Display the segmented save button.
//               ],
//             ),
//           ),
//           if (meta != null)
//             AppWindowBottomStatusBar(
//               meta: meta!,
//               isEntityDeleted: isEntityDeleted,
//             ),
//         ],
//       ),
//     );
//   }
// }
