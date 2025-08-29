// import 'package:elbdesk_core/elbdesk_core.dart';
// import 'package:elbdesk_ui/elbdesk_ui.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// // TODO(all): Check if possible to split into smaller widgets

// class AppCardAssignUsers extends HookConsumerWidget {
//   const AppCardAssignUsers({
//     required this.labelPosition,
//     required this.width,
//     required this.selectedUsers,
//     required this.onSelected,
//     this.isMandatory = false,
//     this.label,
//     super.key,
//   });

//   final NextCardFormFieldLabelPosition labelPosition;
//   final double width;
//   final String? label;

//   final List<AppUser> selectedUsers;
//   final void Function(AppUser) onSelected;
//   final bool isMandatory;
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final focusNode = useFocusNode();
//     final sessionId = useUuid();
//     final controller = useTextEditingController();
//     final asyncAllAppUsers = ref.watch(
//       fetchAllAppUsersProvider(
//         sessionId,
//       ),
//     );

//     useListenable(controller);

//     return asyncAllAppUsers.fastWhen(
//       data: (users) {
//         final sortedUnselectedUsers =
//             users.where((user) => !selectedUsers.contains(user)).toList()
//               ..sort(
//                 (a, b) => (a.userInfo.fullName ?? '')
//                     .compareTo(b.userInfo.fullName ?? ''),
//               );

//         final sortedSelectedUsers =
//             selectedUsers.where((user) => users.contains(user)).toList()
//               ..sort(
//                 (a, b) => (a.userInfo.fullName ?? '')
//                     .compareTo(b.userInfo.fullName ?? ''),
//               );

//         final sortedUsers = [
//           ...sortedSelectedUsers,
//           ...sortedUnselectedUsers,
//         ];

//         final l10n = context.l10n;
//         final temporaryProperties = context.appTheme.temporaryProperties;
//         return Padding(
//           padding: UiConstants.cardFieldPadding,
//           child: FormField(
//             initialValue: selectedUsers.length,
//             autovalidateMode: AutovalidateMode.always,
//             validator: (value) {
//               if (isMandatory && value == 0) {
//                 return l10n.validation_required;
//               }
//               return null;
//             },
//             builder: (fieldState) {
//               return SizedBox(
//                 height: UiConstants.buttonHeight,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Row(
//                       children: [
//                         if (labelPosition ==
//                                 NextCardFormFieldLabelPosition.left &&
//                             label != null)
//                           SizedBox(
//                             width: UiConstants.leftLabelWidth,
//                             child: Padding(
//                               padding: const EdgeInsets.only(right: 2),
//                               child: AppTooltip(
//                                 message: label,
//                                 waitDuration: const Duration(milliseconds: 500),
//                                 preferBelow: false,
//                                 child: AppText(
//                                   label!,
//                                   autoSize: false,
//                                   height: 1.2,
//                                   maxLines: 1,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         Expanded(
//                           child: LayoutBuilder(
//                             builder: (context, constraints) {
//                               return MenuAnchor(
//                                 alignmentOffset: const Offset(
//                                   0,
//                                   5,
//                                 ),
//                                 style: MenuStyle(
//                                   backgroundColor:
//                                       WidgetStatePropertyAll<Color>(
//                                     temporaryProperties
//                                         .appNextDropdownMenuBackgroundColor,
//                                   ),
//                                   side: WidgetStatePropertyAll<BorderSide>(
//                                     BorderSide(
//                                       color: temporaryProperties
//                                           .appNextDropdownMenuBorderColor,
//                                     ),
//                                   ),
//                                   shape: WidgetStatePropertyAll<OutlinedBorder>(
//                                     RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(
//                                         temporaryProperties
//                                             .appNextDropdownMenuBorderRadius,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 builder: (context, controller, child) {
//                                   return InkWell(
//                                     onTap: () {
//                                       if (controller.isOpen) {
//                                         controller.close();
//                                       } else {
//                                         controller.open();
//                                         focusNode.requestFocus();
//                                       }
//                                     },
//                                     child: Builder(
//                                       builder: (context) {
//                                         if (selectedUsers.isEmpty) {
//                                           return AbsorbPointer(
//                                             absorbing: true,
//                                             child: SizedBox(
//                                               height: 28,
//                                               child: Align(
//                                                 alignment: Alignment.centerLeft,
//                                                 child: Row(
//                                                   children: [
//                                                     if (labelPosition ==
//                                                         NextCardFormFieldLabelPosition
//                                                             .left)
//                                                       const SizedBox(
//                                                         width: 4,
//                                                       ),
//                                                     AppButton.blank(
//                                                       onPressed: () {},
//                                                       label:
//                                                           l10n.gen_add_entity(
//                                                         l10n.crm_employee,
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                             ),
//                                           );
//                                         }
//                                         return Padding(
//                                           padding: EdgeInsets.only(
//                                             top: labelPosition ==
//                                                     NextCardFormFieldLabelPosition
//                                                         .left
//                                                 ? 0
//                                                 : 4,
//                                           ),
//                                           child: Wrap(
//                                             spacing: -2,
//                                             runSpacing: -2,
//                                             children: [
//                                               ...selectedUsers.map(
//                                                 (user) => AppUserAvatar(
//                                                   user: user,
//                                                   size: 26,
//                                                   isActive: false,
//                                                   isInRow: true,
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         );
//                                       },
//                                     ),
//                                   );
//                                 },
//                                 menuChildren: [
//                                   SizedBox(
//                                     width: constraints.maxWidth,
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(8),
//                                       child: AppRawTextField(
//                                         hintText: l10n.gen_search,
//                                         focusNode: focusNode,
//                                         controller: controller,
//                                       ),
//                                     ),
//                                   ),
//                                   ...sortedUsers
//                                       .where(
//                                         (user) => (user.userInfo.fullName ?? '')
//                                             .toLowerCase()
//                                             .contains(
//                                               controller.text.toLowerCase(),
//                                             ),
//                                       )
//                                       .map(
//                                         (user) => MenuItemButton(
//                                           onPressed: () {
//                                             final currentUsers = selectedUsers;
//                                             final isNewUser = !currentUsers.any(
//                                               (u) =>
//                                                   u.userInfo.id ==
//                                                   user.userInfo.id,
//                                             );
//                                             final newLength = isNewUser
//                                                 ? selectedUsers.length + 1
//                                                 : selectedUsers.length - 1;

//                                             onSelected(user);

//                                             controller.clear();
//                                             fieldState.didChange(newLength);
//                                           },
//                                           child: Row(
//                                             children: [
//                                               AppUserAvatar(
//                                                 user: user,
//                                                 isActive: selectedUsers.any(
//                                                   (u) =>
//                                                       u.userInfo.id ==
//                                                       user.userInfo.id,
//                                                 ),
//                                               ),
//                                               const SizedBox(width: 8),
//                                               Expanded(
//                                                 child: AppText(
//                                                   user.userInfo.fullName ?? '',
//                                                   autoSize: false,
//                                                 ),
//                                               ),
//                                               const SizedBox(width: 8),
//                                               if (selectedUsers.any(
//                                                 (u) =>
//                                                     u.userInfo.id ==
//                                                     user.userInfo.id,
//                                               ))
//                                                 AppIcon(
//                                                   Icons.close,
//                                                   color: context
//                                                       .appTheme
//                                                       .textFieldProperties
//                                                       .borderColor,
//                                                 ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                 ],
//                               );
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }
