import 'package:elbdesk_core/l10n/l10n_extension.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// A custom delete icon button widget that shows a confirmation dialog before
/// deleting.
///
/// The [AppDeleteIconButton] widget is a stateless widget that displays a
/// delete icon button. When the button is pressed, it shows a confirmation
/// dialog. If the user confirms, the [onDelete] callback is triggered.
///
/// {@tool snippet}
/// This example shows how to use [AppDeleteIconButton] in a Flutter
/// application:
///
/// ```dart
/// AppDeleteIconButton(
///   onDelete: () {
///     print('Delete confirmed');
///   },
/// )
/// ```
/// {@end-tool}
///
/// See also:
///
///  * [AppIconButton], which is the underlying button widget used.
///  * [VoidCallback], which is the type of the callback function.

// class AppDeleteIconButton extends StatelessWidget {
//   /// Creates an [AppDeleteIconButton] widget.
//   ///
//   /// The [onDelete] parameter must not be null.
//   const AppDeleteIconButton({
//     required this.onDelete,
//     this.navigatorKey,
//     super.key,
//   });

//   /// The callback function that is called when the delete action is confirmed.
//   final Future<void> Function()? onDelete;

//   final GlobalKey<NavigatorState>? navigatorKey;

//   @override
//   Widget build(BuildContext context) {
//     final l10n = context.l10n;

//     return AppIconButton.danger(
//       tooltip: l10n.gen_delete,
//       skipTraversal: true,
//       iconData: AppIcons.delete_outline,
//       onPressed: onDelete == null
//           ? null
//           : () async {
//               await AppDialog.show<void>(
//                 context: context,
//                 isDismissible: true,
//                 navigatorKey: navigatorKey,
//                 child: OnDeleteDataDialog(
//                   onDelete: () async {
//                     await onDelete!.call();
//                   },
//                 ),
//               );
//             },
//     );
//   }
// }

class CardFooterDeleteButton extends HookWidget {
  /// Creates an [AppDeleteIconButton] widget.
  ///
  /// The [onDelete] parameter must not be null.
  const CardFooterDeleteButton({
    required this.onDelete,
    required this.isSaving,
    this.navigatorKey,
    super.key,
  });

  /// The callback function that is called when the delete action is confirmed.
  final Future<void> Function()? onDelete;

  final GlobalKey<NavigatorState>? navigatorKey;

  final ValueNotifier<bool> isSaving;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return AppIconButton.danger(
      tooltip: l10n.gen_delete,
      skipTraversal: true,
      iconData: AppIcons.delete_outline,
      onPressed: onDelete == null
          ? null
          : () async {
              isSaving.value = true;
              await showElbDialog<void>(
                context: context,
                isDismissible: true,
                navigatorKey: navigatorKey,
                child: OnDeleteDataDialog(
                  onDelete: () async {
                    await onDelete!.call();
                  },
                ),
              );
              if (context.mounted) {
                isSaving.value = false;
              }
            },
    );
  }
}
