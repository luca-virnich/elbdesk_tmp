// import 'package:elbrp/features/bearers/logic/bearer_state.dart';
// import 'package:elbrp/features/bearers/widgets/bearer_card_footer.dart';
// import 'package:elbrp/features/bearers/widgets/bearer_general/bearer_general_view.dart';
// import 'package:elbrp/features/bearers/widgets/types/bearer_type1_view.dart';
// import 'package:elbrp/features/bearers/widgets/types/bearer_type2_view.dart';
// import 'package:elbrp/widgets/card_body.dart';
// import 'package:elbdesk_client/elbdesk_client.dart';
// import 'package:elbdesk_core/elbdesk_core.dart';
// import 'package:elbdesk_ui/elbdesk_ui.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:elbdesk_prepress/src/bearers/models/bearer.dart';

// /// Displays a editable [Bearer], typically used in  a [FloatingWindow].
// class BearerCard extends HookConsumerWidget {
//   /// Displays a editable [Bearer], typically used in  a [FloatingWindow].
//   ///
//   ///  __Performance Note:__
//   /// For better performance it's best to provide the [size].
//   /// If the [size] is not provided, the widget will fall back to using a
//   /// [LayoutBuilder] to calculate the constraints on its own.
//   const BearerCard({
//     this.size,
//     this.bearerId,
//     super.key,
//     this.onClose,
//     this.onSave,
//     this.sessionId,
//     this.showFooter = true,
//     this.showToolbar = true,
//     this.showBottomStatusBar = true,
//   });

//   /// The size of the card.
//   ///
//   /// __Performance Note:__
//   /// For better performance it's best to provide the [size].
//   /// If the [size] is not provided, the widget will fall back to using a
//   /// [LayoutBuilder] to calculate the constraints on its own.
//   final Size? size;

//   /// The id of the bearer to display/fetch, if null a new bearer is created
//   final int? bearerId;

//   /// Callback when the user closes the card
//   final VoidCallback? onClose;

//   /// Callback when the user saves the bearer
//   final VoidCallback? onSave;

//   /// The sessionId for _this_ card, if null a new sessionId is created
//   final String? sessionId;

//   /// Decides if the  should be displayed
//   final bool showToolbar;

//   /// Decides if the [AppWindowFooter] footer should be displayed,
//   final bool showFooter;

//   /// Decides if the [AppWindowBottomStatusBar] should be displayed
//   final bool showBottomStatusBar;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // Create new sessionId if not provided
//     final sessionId =
//         useMemoized(() => this.sessionId ?? const Uuid().v4(), []);

//     // BearerId State
//     // If the bearerId is null, a new bearer is created and the id has to be
//     // stored in the state
//     final bearerIdState = useState<int?>(bearerId ?? 0);

//     final hasValue = ref.watch(
//       bearerStateProvider(bearerIdState.value, sessionId)
//           .select((value) => value.hasValue && !value.isLoading),
//     );

//     // If the bearer is not loaded yet, show a loading indicator
//     if (!hasValue) {
//       return const AppLoadingIndicator();
//     }

//     // Get the editSessionId. This is used to determine if the bearer is
//     // currently edited by another user
//     final editSessionId = ref
//         .watch(bearerStateProvider(bearerIdState.value, sessionId))
//         .requireValue
//         .meta
//         .editSessionId;

//     // Get the editSessionUserName. This is used to display the name of the user
//     // who is currently editing the bearer
//     final editSessionUserName = ref
//         .watch(bearerStateProvider(bearerIdState.value, sessionId))
//         .requireValue
//         .meta
//         .editorName;

//     // Get the meta information of the bearer
//     final meta = ref
//         .watch(bearerStateProvider(bearerIdState.value, sessionId))
//         .requireValue
//         .meta;

//     final bearerType = ref
//         .watch(bearerStateProvider(bearerIdState.value, sessionId))
//         .requireValue
//         .general
//         .type;

//     // Using AppResponsiveLayoutBuilder to determine the size of the card
//     // because the parent this.size is not always provided and can be null
//     // in this case the widget will fall back to its internal size calculation
//     return AppResponsiveLayoutBuilder(
//       size: size,
//       builder: (context, size) {
//         if (bearerIdState.value == null) {
//           // Wait one frame
//           WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//             bearerIdState.value = ref
//                 .read(
//                   bearerStateProvider(bearerIdState.value, sessionId),
//                 )
//                 .requireValue
//                 .meta
//                 .id;
//           });

//           return const AppLoadingIndicator();
//         }
//         return SizedBox(
//           height: size.height,
//           child: CardBody(
//             readOnly: editSessionId != sessionId,
//             readOnlyUserName: editSessionUserName,

//             // This method is called when the user clicks the refresh button
//             // which is displayed when the widget is blocked.
//             // Can be used to "unblock" the widget in case the previous editor
//             // has closed the window
//             // onRefresh: () async {
//             //   await ref
//             //       .read(
//             //         bearerStateProvider(bearerIdState.value, sessionId)
//             //             .notifier,
//             //       )
//             //       .refresh();
//             // },

//             // * Card Footer
//             // The Footer is used to display buttons like save, close and delete
//             footer: !showFooter
//                 ? null
//                 : AppWindowFooter(
//                     child: BearerCardFooter(
//                       sessionId: sessionId,
//                       bearerId: bearerIdState.value,
//                       editSessionId: editSessionId,
//                       onSave: onSave,
//                       onClose: onClose,
//                       isReadOnly: editSessionId != sessionId,
//                       width: size.width,
//                     ),
//                   ),

//             // * Bottom Status Bar
//             //
//             // The Bottom Status Bar is used to display information about the
//             // creation and last modification of the bearer
//             // createdBy, createdAt, editedBy, editedAt
//             bottomStatusBar: !showBottomStatusBar
//                 ? null
//                 : AppWindowBottomStatusBar(
//                     createdBy: meta.creatorName,
//                     createdAt: meta.formattedCreatedAt,
//                     editedBy: meta.editorName,
//                     lastModifiedAt: meta.formattedLastModifiedAt,
//                   ),

//             // * Children
//             //
//             // The children of the card display the actual content of the card.
//             // They should be extracted to separate widgets to keep the card
//             // widget clean and readable
//             children: [
//               // * General View
//               // This widget displays the general and defining informations of
//               // the bearer and holds fields like type and name
//               BearerGeneralView(
//                 width: size.width,
//                 bearerId: bearerIdState.value!,
//                 readOnly: editSessionId != sessionId,
//                 sessionId: sessionId,
//               ),
//               const SizedBox(
//                 height: AppSpace.m,
//               ),

//               switch (bearerType) {
//                 BearerType.none => const SizedBox(),
//                 BearerType.type1 => BearerType1View(
//                     readOnly: false,
//                     width: size.width,
//                     bearerId: bearerIdState.value!,
//                     sessionId: sessionId,
//                   ),
//                 BearerType.type2 => BearerType2View(
//                     readOnly: false,
//                     width: size.width,
//                     bearerId: bearerIdState.value!,
//                     sessionId: sessionId,
//                   ),
//                 _ => const SizedBox(),
//               },
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
