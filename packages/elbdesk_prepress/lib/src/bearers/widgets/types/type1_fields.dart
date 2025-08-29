// part of 'bearer_type1_view.dart';

// /// Margin Left Field
// class _MarginLeftField extends HookConsumerWidget {
//   const _MarginLeftField({
//     required this.bearerId,
//     required this.sessionId,
//     required this.readOnly,
//   });

//   final int bearerId;
//   final String sessionId;
//   final bool readOnly;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final controller = useTextEditingController(
//       text: ref
//               .read(bearerStateProvider(bearerId, sessionId))
//               .requireValue
//               .general
//               .type1
//               ?.marginLeft
//               .toString() ??
//           '',
//     );

//     final focusNode = useFocusNode();
//     final l10n = context.l10n;

//     return Row(
//       children: [
//         Expanded(
//           child: AppCardTextInputField(
//             readOnly: readOnly,
//             inputFormatters: const [
//               // FilteringTextInputFormatter.digitsOnly,
//             ],
//             onClear: controller.clear,
//             labelText: l10n.bearer_margin_left,
//             focusNode: focusNode,
//             controller: controller,
//             onChanged: (p0) {
//               final doubleValue = double.tryParse(p0);
//               if (doubleValue == null) {
//                 return;
//               }

//               ref
//                   .read(bearerStateProvider(bearerId, sessionId).notifier)
//                   .updateMarginLeft(doubleValue);
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }

// /// Margin Right Field
// class _MarginRightField extends HookConsumerWidget {
//   const _MarginRightField({
//     required this.bearerId,
//     required this.sessionId,
//     required this.readOnly,
//   });

//   final int bearerId;
//   final String sessionId;
//   final bool readOnly;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final controller = useTextEditingController(
//       text: ref
//               .read(bearerStateProvider(bearerId, sessionId))
//               .requireValue
//               .general
//               .type1
//               ?.marginRight
//               .toString() ??
//           '',
//     );

//     final focusNode = useFocusNode();
//     final l10n = context.l10n;

//     return Row(
//       children: [
//         Expanded(
//           child: AppCardTextInputField(
//             readOnly: readOnly,
//             inputFormatters: const [
//               // FilteringTextInputFormatter.digitsOnly,
//             ],
//             onClear: controller.clear,
//             labelText: l10n.bearer_margin_right,
//             focusNode: focusNode,
//             controller: controller,
//             onChanged: (p0) {
//               final doubleValue = double.tryParse(p0);
//               if (doubleValue == null) {
//                 return;
//               }

//               ref
//                   .read(bearerStateProvider(bearerId, sessionId).notifier)
//                   .updateMarginRight(doubleValue);
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
