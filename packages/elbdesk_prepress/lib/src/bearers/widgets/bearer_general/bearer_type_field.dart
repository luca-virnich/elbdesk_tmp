// part of 'bearer_general_view.dart';

// class _BearerTypeField extends HookConsumerWidget {
//   const _BearerTypeField({
//     required this.readOnly,
//     required this.bearerId,
//     required this.sessionId,
//   });
//   final bool readOnly;
//   final int bearerId;
//   final String sessionId;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final l10n = context.l10n;
//     final focus = useFocusNode();
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         final width = constraints.maxWidth;

//         final currentBearerType = ref.watch(
//           bearerStateProvider(bearerId, sessionId).select(
//             (value) => value.requireValue.general.type,
//           ),
//         );

//         return IgnorePointer(
//           ignoring: readOnly,
//           child: AppCardDropDownMenu(
//             label: l10n.bearer_type,
//             width: width,
//             focusNode: focus,
//             initialSelection: currentBearerType,
//             enableFilter: false,
//             onSelected: (value) {
//               if (value != null) {
//                 ref
//                     .read(bearerStateProvider(bearerId, sessionId).notifier)
//                     .updateType(
//                       value,
//                     );
//               }
//             },
//             dropdownMenuEntries:
//                 BearerType.values.map<AppDropdownMenuEntry<BearerType>>(
//               (BearerType bearerType) {
//                 final field = BearerTypeWrapper(bearerType);
//                 return AppDropdownMenuEntry<BearerType>(
//                   label: field.readable(l10n),
//                   value: bearerType,
//                 );
//               },
//             ).toList(),
//           ),
//         );
//       },
//     );
//   }
// }
