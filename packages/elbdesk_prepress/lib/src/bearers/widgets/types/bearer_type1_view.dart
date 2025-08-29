// import 'package:elbrp/features/bearers/logic/bearer_state.dart';
// import 'package:elbdesk_core/elbdesk_core.dart';
// import 'package:elbdesk_ui/elbdesk_ui.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:elbdesk_prepress/src/bearers/models/bearer.dart';

// part 'type1_fields.dart';

// /// Displays the type1 information of a [Bearer]
// ///
// /// __Performance Note:__
// /// For better performance it's best to provide the [width].
// /// If the [width] is not provided, the widget will fall back to using a
// /// [LayoutBuilder] to calculate the constraints on its own.
// class BearerType1View extends ConsumerWidget {
//   /// @nodoc
//   const BearerType1View({
//     required this.bearerId,
//     required this.readOnly,
//     required this.sessionId,
//     this.width,
//     super.key,
//   });

//   /// The id of the bearer, used to reference the correct bearer
//   /// state provider
//   final int bearerId;

//   /// If the fields are read only
//   final bool readOnly;

//   /// The sessionId of the bearer card
//   final String sessionId;

//   /// The width of the widget.
//   ///
//   /// __Performance Note:__
//   /// For better performance it's best to provide the [width].
//   /// If the [width] is not provided, the widget will fall back to using a
//   /// [LayoutBuilder] to calculate the constraints on its own.
//   final double? width;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final l10n = context.l10n;
//     return AppCardExpansionTile(
//       initialIsExpanded: true,
//       titleText: l10n.crm_general,
//       child: FocusTraversalGroup(
//         policy: OrderedTraversalPolicy(),
//         child: Column(
//           children: [
//             TwoColumnWrap(
//               width: width,
//               spacing: UiConstants.spacedColumnSpacing,
//               children: [
//                 FocusTraversalOrder(
//                   order: const NumericFocusOrder(0),
//                   child: _MarginLeftField(
//                     readOnly: readOnly,
//                     bearerId: bearerId,
//                     sessionId: sessionId,
//                   ),
//                 ),
//                 FocusTraversalOrder(
//                   order: const NumericFocusOrder(1),
//                   child: _MarginRightField(
//                     readOnly: readOnly,
//                     bearerId: bearerId,
//                     sessionId: sessionId,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(
//               height: UiConstants.defaultPadding / 2,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
