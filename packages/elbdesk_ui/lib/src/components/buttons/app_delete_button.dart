/// A custom delete button widget that shows a confirmation dialog before
/// deleting.
///
/// The [AppDeleteButton] widget is a stateless widget that displays a delete
/// button with an icon and a label. When the button is pressed, it shows a
/// confirmation dialog. If the user confirms, the [onDelete] callback is
/// triggered.
///
/// {@tool snippet}
/// This example shows how to use [AppDeleteButton] in a Flutter application:
///
/// ```dart
/// AppDeleteButton(
///   onDelete: () {
///     print('Delete confirmed');
///   },
/// )
/// ```
/// {@end-tool}
///
/// See also:
///
///  * [AppButton], which is the underlying button widget used.
///  * [VoidCallback], which is the type of the callback function.
///  * [AppDialog.show], which is used to show the confirmation dialog.
// class AppDeleteButton extends StatelessWidget {
//   /// Creates an [AppDeleteButton] widget.
//   ///
//   /// The [onDelete] parameter must not be null.
//   const AppDeleteButton({
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

//     return AppButton.danger(
//       iconData: AppIcons.delete_outline,
//       onPressed: () async {
//         await AppDialog.show<void>(
//           context: context,
//           isDismissible: true,
//           navigatorKey: navigatorKey,
//           child: OnDeleteDataDialog(
//             onDelete: () async {
//               await onDelete?.call();
//             },
//           ),
//         );
//         // await showAppDialog<bool>(
//       },
//       label: l10n.gen_delete,
//     );
//   }
// }
