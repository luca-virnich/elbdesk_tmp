// import 'package:elbrp/features/bearers/logic/bearer_state.dart';
// import 'package:elbrp/features/bearers/screens/bearer_card.dart';
// import 'package:elbdesk_client/elbdesk_client.dart';
// import 'package:elbdesk_core/elbdesk_core.dart';
// import 'package:elbdesk_ui/elbdesk_ui.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:elbdesk_prepress/src/bearers/models/bearer.dart';
// import 'package:prepress_module/prepress_module.dart';

// part 'bearer_type_field.dart';
// part 'description_field.dart';
// part 'name_field.dart';

// /// Displays the general information of a [Bearer] in a [BearerCard].
// ///
// /// __Performance Note:__
// /// For better performance it's best to provide the [width].
// /// If the [width] is not provided, the widget will fall back to using a
// /// [LayoutBuilder] to calculate the constraints on its own.
// class BearerGeneralView extends ConsumerWidget {
//   /// @nodoc
//   const BearerGeneralView({
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
//     // final bearerType = ref.watch(
//     //   bearerStateProvider(bearerId, sessionId).select(
//     //     (value) => value.requireValue.general.type,
//     //   ),
//     // );

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
//                   child: _BearerTypeField(
//                     readOnly: readOnly,
//                     bearerId: bearerId,
//                     sessionId: sessionId,
//                   ),
//                 ),
//                 FocusTraversalOrder(
//                   order: const NumericFocusOrder(1),
//                   child: _NameField(
//                     id: bearerId,
//                     readOnly: readOnly,
//                     sessionId: sessionId,
//                   ),
//                 ),
//                 FocusTraversalOrder(
//                   order: const NumericFocusOrder(2),
//                   child: _DescriptionField(
//                     id: bearerId,
//                     readOnly: readOnly,
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
