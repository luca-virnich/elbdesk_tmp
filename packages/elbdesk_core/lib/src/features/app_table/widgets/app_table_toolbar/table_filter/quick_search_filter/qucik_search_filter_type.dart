// part of 'quick_search_filter.dart';

// class _Type<T> extends HookConsumerWidget {
//   const _Type({
//     // required this.fieldFocus,
//     // required this.typeFocus,
//     required this.typeController,
//     // required this.valueFocus,
//     required this.availableFilterFields,
//     required this.valueController,
//     required this.tableType,
//     required this.sessionId,
//     required this.firstFilterField,
//     required this.width,
//     super.key,
//   });
//   // final FocusNode fieldFocus;
//   final FilterField firstFilterField;

//   // final FocusNode typeFocus;
//   final TextEditingController typeController;

//   // final FocusNode valueFocus;

//   final Map<T, TableFieldData> availableFilterFields;
//   final TextEditingController valueController;
//   final TableType tableType;
//   final String sessionId;
//   final double width;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final currentField = availableFilterFields.entries.firstWhere(
//       (entry) => entry.key.toString() == firstFilterField.fieldKey,
//     );

//     final currentType = firstFilterField.type;
//     final filterTypes = availableFilterFields[currentField.key]!.filterTypes;

//     final showCapitalizeButton = currentType.toString().contains('ike');
//     final filterCapitalized =
//         currentType == FilterType.notLike || currentType == FilterType.like;

//     final l10n = context.l10n;

//     const capitalizeButtonWidth = 32.0;
//     final iconButtonProperties = context.appTheme.iconButtonProperties;

//     final dropdownWidth = !showCapitalizeButton
//         ? width
//         : width - capitalizeButtonWidth - UiConstants.elementMargin;
//     final focusNode = useFocusNode();
//     return Row(
//       children: [
//         ConstrainedBox(
//           constraints: BoxConstraints(
//             maxWidth: width,
//           ),
//           child: Row(
//             children: [
//               Flexible(
//                 child: ElbFocusOrderWrapper(
//                   focusOrderId: 2,
//                   child: NextDropdownMenu<FilterType>(
//                     readOnly: false,
//                     // width: showCapitalizeButton ? dropdownWidth : width,
//                     width: dropdownWidth,

//                     focusNode: focusNode,
//                     initialValue: currentType.readable(l10n),
//                     // enableFilter: true,
//                     // showCopyButton: false,
//                     // width: showCapitalizeButton ? dropdownWidth : width,
//                     controller: typeController,
//                     hintText: l10n.table_filter_condition,
//                     isMandatory: true,
//                     // menuHeight: 30,
//                     dropdownMenuEntries:
//                         filterTypes.map<NextDropdownMenuEntry<FilterType>>(
//                       (FilterType filterType) {
//                         return NextDropdownMenuEntry<FilterType>(
//                           // labelWidget: AppText(
//                           //   filterType.readable(l10n),
//                           //   autoSize: false,
//                           //   style: context.appStyles.textFieldStyle,
//                           // ),
//                           // label: filterType.readable(l10n),
//                           label: filterType.readable(l10n),
//                           value: filterType,
//                         );
//                       },
//                     ).toList(),

//                     onSelected: (value) {
//                       if (value == null) return;

//                       // filterFieldNotifier.value =
//                       //     filterFieldNotifier.value.copyWith(type: value);

//                       // Automatically selects all text
//                       // I implemented this instead of deleting the full text
//                       // That way the user has the option to keep it
//                       valueController.selection = TextSelection(
//                         baseOffset: 0,
//                         extentOffset: valueController.text.length,
//                       );
//                     },
//                   ),
//                 ),
//               ),
//               if (showCapitalizeButton) ...[
//                 const SizedBox(width: UiConstants.elementMargin),
//                 SizedBox(
//                   width: capitalizeButtonWidth,
//                   child: Padding(
//                     padding: EdgeInsets.zero,
//                     child: AppIconButton.secondary(
//                       icon: const Icon(AppIcons.spellcheck_outlined),
//                       color: !filterCapitalized
//                           ? iconButtonProperties.foregroundColorInactive
//                           : iconButtonProperties.foregroundColorActive,
//                       tooltip: filterCapitalized
//                           ? l10n.table_filter_disable_capitalize
//                           : l10n.table_filter_enable_capitalize,
//                       onPressed: () {
//                         // // filterCapitalized.value = !filterCapitalized.value;
//                         // final currentType = firstFilterField.type;
//                         // // iLike when its like
//                         // if (currentType == FilterType.iLike) {
//                         //   firstFilterField = firstFilterField.copyWith(
//                         //       type: FilterType.like);
//                         // }
//                         // // like when its iLike
//                         // if (currentType == FilterType.like) {
//                         //   firstFilterField = firstFilterField.copyWith(
//                         //       type: FilterType.iLike);
//                         // }
//                         // // notILike when its notLike
//                         // if (currentType == FilterType.notILike) {
//                         //   firstFilterField = firstFilterField.copyWith(
//                         //       type: FilterType.notLike);
//                         // }
//                         // // notLike when its notILike
//                         // if (currentType == FilterType.notLike) {
//                         //   firstFilterField = firstFilterField.copyWith(
//                         //       type: FilterType.notILike);
//                         // }
//                       },
//                     ),
//                   ),
//                 ),
//               ],
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
