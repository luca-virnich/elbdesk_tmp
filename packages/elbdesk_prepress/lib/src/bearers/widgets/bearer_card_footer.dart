// import 'package:elbrp/features/bearers/logic/bearer_state.dart';
// import 'package:elbdesk_core/elbdesk_core.dart';
// import 'package:elbdesk_ui/elbdesk_ui.dart';
// import 'package:flutter/widgets.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:elbdesk_prepress/src/bearers/repositories/bearer_repository.dart';

// /// Contains the buttons to delete, save and close the bearer card.

// class BearerCardFooter extends CardFooter {
//   /// @nodoc
//   const BearerCardFooter({
//     required this.sessionId,
//     required this.bearerId,
//     required this.editSessionId,
//     required this.onSave,
//     required this.isReadOnly,
//     required this.width,
//     super.key,
//     this.onClose,
//   });

//   /// The sessionId of the bearer card
//   final String sessionId;

//   /// The bearerId of the bearer card
//   final int? bearerId;

//   /// The editSessionId of the bearer card, can be null if no one is in
//   /// edit mode
//   final String? editSessionId;

//   /// Callback when the user saves the bearer
//   final VoidCallback? onSave;

//   /// Callback when the user closes the card
//   final VoidCallback? onClose;

//   /// If the card is in read only mode
//   final bool isReadOnly;

//   /// The width of the card
//   final double width;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return AppWindowMenuFooter(
//       width: width,
//       leadingActions: [
//         if (bearerId != null)
//           Consumer(
//             builder: (context, ref, child) {
//               return AppDeleteIconButton(
//                 onDelete: isReadOnly
//                     ? null
//                     : () async {
//                         final isDeleted = await ref
//                             .read(bearerRepositoryProvider)
//                             .deleteBearer(
//                               bearerId: bearerId!,
//                               sessionId: sessionId,
//                             );

//                         if (isDeleted) {
//                           onClose?.call();
//                         }
//                       },
//               );
//             },
//           ),
//       ],
//       trailingActions: [
//         Consumer(
//           builder: (context, ref, child) {
//             final isNewBearer = ref
//                     .read(
//                       bearerStateProvider(
//                         bearerId,
//                         sessionId,
//                       ),
//                     )
//                     .requireValue
//                     .meta
//                     .id ==
//                 0;

//             if (isNewBearer) {
//               return _AddBearerButton(
//                 onPressed: () async {
//                   // Get bearer from state
//                   final bearer = ref
//                       .read(
//                         bearerStateProvider(
//                           bearerId,
//                           sessionId,
//                         ),
//                       )
//                       .requireValue;
//                   await ref
//                       .read(bearerRepositoryProvider)
//                       .createBearer(sessionId, bearer);

//                   onSave?.call();
//                   onClose?.call();
//                 },
//               );
//             } else {
//               return AppSegmentedSaveButton(
//                 onSavePressed: isReadOnly
//                     ? null
//                     : () {
//                         // Get bearer from state
//                         final bearer = ref
//                             .read(
//                               bearerStateProvider(
//                                 bearerId,
//                                 sessionId,
//                               ),
//                             )
//                             .requireValue;

//                         // Save bearer to database
//                         ref
//                             .read(bearerRepositoryProvider)
//                             .updateBearer(bearer, sessionId);
//                         onSave?.call();
//                       },
//                 onSaveAndClosePressed: isReadOnly
//                     ? null
//                     : () {
//                         // Get bearer from state
//                         final bearer = ref
//                             .read(
//                               bearerStateProvider(
//                                 bearerId,
//                                 sessionId,
//                               ),
//                             )
//                             .requireValue;

//                         // Save bearer to database
//                         ref
//                             .read(bearerRepositoryProvider)
//                             .updateBearer(bearer, sessionId);
//                         onSave?.call();
//                         onClose?.call();
//                       },
//               );
//             }
//           },
//         ),
//       ],
//     );
//   }
// }

// class _AddBearerButton extends StatelessWidget {
//   const _AddBearerButton({required this.onPressed});
//   final VoidCallback? onPressed;

//   @override
//   Widget build(BuildContext context) {
//     final l10n = context.l10n;
//     return AppButton.primary(
//       tooltip: l10n.add_bearer,
//       onPressed: onPressed,
//       label: l10n.add_bearer,
//       iconData: AppIcons.check,
//     );
//   }
// }
