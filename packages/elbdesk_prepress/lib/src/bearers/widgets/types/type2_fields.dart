// part of 'bearer_type2_view.dart';

// /// Min Height Field
// class _MinHeightField extends HookConsumerWidget {
//   const _MinHeightField({
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
//               .type2
//               ?.minHeight
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
//             labelText: l10n.bearer_min_height,
//             focusNode: focusNode,
//             controller: controller,
//             onChanged: (p0) {
//               final doubleValue = double.tryParse(p0);
//               if (doubleValue == null) {
//                 return;
//               }

//               ref
//                   .read(bearerStateProvider(bearerId, sessionId).notifier)
//                   .updateMinHeight(doubleValue);
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }

// /// Min Width Field
// class _MinWidthField extends HookConsumerWidget {
//   const _MinWidthField({
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
//               .type2
//               ?.minWidth
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
//               //   FilteringTextInputFormatter.digitsOnly,
//               // FilteringTextInputFormatter.allow(RegExp('[0-9.]')),
//               //FilteringTextInputFormatter.singleLineFormatter,
//             ],
//             onClear: controller.clear,
//             labelText: l10n.bearer_min_width,
//             focusNode: focusNode,
//             controller: controller,
//             onChanged: (p0) {
//               final doubleValue = double.tryParse(p0);
//               if (doubleValue == null) {
//                 return;
//               }

//               ref
//                   .read(bearerStateProvider(bearerId, sessionId).notifier)
//                   .updateMinWidth(doubleValue);
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
