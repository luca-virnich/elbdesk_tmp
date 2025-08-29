// part of 'bearer_general_view.dart';

// /// Description Field
// ///
// /// The Description Field of the Product
// class _DescriptionField extends HookConsumerWidget {
//   const _DescriptionField({
//     required this.id,
//     required this.sessionId,
//     required this.readOnly,
//   });

//   final int id;
//   final String sessionId;
//   final bool readOnly;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final focusNode = useFocusNode();
//     final controller = useTextEditingController(
//       text: ref
//           .read(bearerStateProvider(id, sessionId))
//           .requireValue
//           .general
//           .description,
//     );

//     return AppCardTextInputField(
//       readOnly: readOnly,
//       onClear: () {
//         controller.clear();
//         ref
//             .read(bearerStateProvider(id, sessionId).notifier)
//             .updateDescription('');
//       },
//       maxLines: 3,
//       labelText: context.l10n.bearer_description,
//       focusNode: focusNode,
//       controller: controller,
//       onChanged: (p0) => ref
//           .read(bearerStateProvider(id, sessionId).notifier)
//           .updateDescription(p0),
//     );
//   }
// }
