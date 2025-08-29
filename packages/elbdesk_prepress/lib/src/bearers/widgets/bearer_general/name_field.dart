// part of 'bearer_general_view.dart';

// class _NameField extends HookConsumerWidget {
//   const _NameField({
//     required this.id,
//     required this.sessionId,
//     required this.readOnly,
//   });

//   final int id;
//   final String sessionId;
//   final bool readOnly;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final controller = useTextEditingController(
//       text: ref
//           .read(bearerStateProvider(id, sessionId))
//           .requireValue
//           .general
//           .name,
//     );

//     final focusNode = useFocusNode();
//     final l10n = context.l10n;

//     return Row(
//       children: [
//         Expanded(
//           child: AppCardTextInputField(
//             readOnly: readOnly,
//             onClear: controller.clear,
//             // ignorePointers: isNameLinked || readOnly,
//             labelText: l10n.crm_contact_name,
//             focusNode: focusNode,
//             controller: controller,
//             onChanged: (p0) {
//               ref
//                   .read(bearerStateProvider(id, sessionId).notifier)
//                   .updateName(p0);
//             },
//           ),
//         ),
//         // ElbTextFieldOutsideSuffixButton(
//         //   child: ElbIconButton(
//         //     tooltip: 'Name synchronisieren?',
//         //     iconData: isNameLinked ? Icons.link : Icons.link_off,
//         //     // color: Colors.red,
//         //     onPressed: () {
//         //       ref
//         //           .read(bearerStateProvider(id).notifier)
//         //           .updateNameIsLinked(!isNameLinked);
//         //     },
//         //   ),
//         // ),
//       ],
//     );
//   }
// }
