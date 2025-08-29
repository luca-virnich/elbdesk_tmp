// import 'package:elbrp/features/bearers/logic/bearer_state.dart';
// import 'package:elbrp/features/bearers/screens/bearer_card.dart';
// import 'package:elbdesk_client/elbdesk_client.dart';
// import 'package:elbdesk_core/elbdesk_core.dart';
// import 'package:elbdesk_ui/elbdesk_ui.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:elbdesk_prepress/src/bearers/config/floating_bearer_window_data.dart';

// /// Floating Bearer Card
// ///
// /// This widget is used to display the bearer information in a floating window
// /// It is e.g. called from a button in the BearerTable
// /// The definition of the FloatingCard is done in the DashboardScreen
// class FloatingBearerCard extends HookConsumerWidget {
//   /// Constructor for the FloatingBearerCard
//   const FloatingBearerCard({
//     required this.data,
//     required this.floatingWindowId,
//     this.onClose,
//     this.onSave,
//     super.key,
//   });

//   /// The data for the floating window
//   final FloatingBearerWindowData data;

//   /// The id of the floating window, used to identify the window
//   final String floatingWindowId;

//   /// Callback when the user closes the card
//   final VoidCallback? onClose;

//   /// Callback when the user saves the bearer
//   final VoidCallback? onSave;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final l10n = context.l10n;

//     // Create a new sessionId
//     final sessionId = useUuid()

//     // Fetch the bearer Name if an id is provided
//     // Otherwise "New Bearer" is used
//     // This is string is displayed in the title of the floating window
//     final bearerName = data.bearerId != null
//         ? ref.watch(
//             bearerStateProvider(data.bearerId, sessionId)
//                 .select((value) => value.value?.general.name),
//           )
//         : null;

//     // Updates the title and leading icon of the floating window top bar
//     useEffect(
//       () {
//         WidgetsBinding.instance.addPostFrameCallback((_) {
//           final titleData = FloatingWindowTitlebarData(
//             title: bearerName,
//             icon: TableTypeWrapper(TableType.bearer).tableIcon,
//             baseTitle: bearerName == null ? l10n.bearer_new : l10n.bearer,
//           );
//           ref
//               .read(
//                 floatingWindowTitleStateProvider(floatingWindowId).notifier,
//               )
//               .updateData(titleData);
//         });

//         return null;
//       },
//       [bearerName, l10n],
//     );

//     // Callback that is used when the window is closed. This removes the
//     // floating window from the stack
//     final closeWindowCallback = useMemoized(
//       () => () {
//         return ref
//             .read(
//               floatingWindowDataStateProvider.notifier,
//             )
//             .removeWindow(floatingWindowId);
//       },
//       [floatingWindowId],
//     );

//     // The actual Floating Window Widget
//     // The preferedInitialHeight and Width are clamped with the contextSize to
//     // ensure that the window doesn't extend over the size of the actual app
//     // window
//     return FloatingWindow(
//       minimumWidth: 300,
//       preferredInitialHeight: 900,

//       windowId: floatingWindowId,

//       // This defines the onClose behavior of the floating window and is rather
//       // complex because there are different states in which a window can be
//       // tried to be closed
//       //
//       // - The bearer is new and was not saved previously
//       // - The bearer was saved previously
//       //    -> In these states the window can be closed with and without saving
//       //
//       // - The bearer is blocked and cant be saved
//       //
//       onClose: () async {
//         // The saving is handled in the save button inside of the
//         // CardFooter

//         // * If the bearerId is null the Bearer is new and was not saved
//         // * previously
//         // -> There are changes that need to be saved
//         if (data.bearerId == null) {
//           if (context.mounted) {
//             final closeWindow = await showAppDialog<bool>(
//               context: context,
//               child: const OnCloseDialog(),
//             );

//             // If the user wants to close the window without saving
//             if (closeWindow ?? false) {
//               closeWindowCallback();
//             }
//           }
//           return;
//         }

//         // * If there is a bearerId -> The Bearer was saved previously

//       final bearer = ref.read(bearerStateProvider(data.bearerId, sessionId));

//         // If the state is still in loading state, this means initial bearer
//         // is still fetching from the server.
//         // We can safely close the window without any handling because we don't
//         // have any current changes.
//         if (!bearer.hasValue || bearer.isLoading) {
//           closeWindowCallback();
//           return;
//         }

//         // Checks if the current session is allowed to edit the Serverpod object
//         // e.g. a Serverpod object like bearer, product, sales_order etc.
//         // Reminder
//         // sessionId - The session ID of the currently opened floating card.
//         // editSessionId - The session ID of the current session editing the
//         //                 Serverpod object.
//         final currentSessionId = sessionId;
//         final editSessionId = bearer.requireValue.meta.editSessionId;

//         // If the sessions are not the same, we can't save the changes
//         // therefore we can safely close the window without any handling
//         if (currentSessionId != editSessionId) {
//           closeWindowCallback();
//           return;
//         }

//         // If the bearer was already blocked when opening this window then
//         // the bearer is uneditable even if it isn't blocked.

//         // It could be possible that the bearer and the session is null but the
//         // bearer is blocked.

//         // if (!bearer.requireValue.meta.hasLocalChanges) {
//         //   closeWindowCallback();
//         //   return;
//         // }

//         // If we came to this point, we can safely save the changes
//         if (context.mounted) {
//           final shouldCloseWindow = await showAppDialog<bool>(
//             context: context,
//             child: const OnCloseDialog(),
//           );

//           // If the user wants to close the window without saving
//           if (shouldCloseWindow ?? false) {
//             closeWindowCallback();
//             return;
//           }
//         }
//         return;
//       },

//       // The actual content of the floating window
//       child: BearerCard(
//         sessionId: sessionId,
//         onSave: onSave,
//         bearerId: data.bearerId,
//         onClose: () {
//           ref.read(floatingWindowDataStateProvider.notifier).removeWindow(
//                 floatingWindowId,
//               );

//           onClose?.call();
//         },
//       ),

//       // The actual content of the floating window
//       // child: BearerCard(
//       //   sessionId: sessionId,
//       //   onSave: onSave,
//       //   bearerId: bearerId,
//       //   onClose: onClose,
//       // ),
//     );
//   }
// }
