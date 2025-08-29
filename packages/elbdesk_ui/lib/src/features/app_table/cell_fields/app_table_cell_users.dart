// import 'package:elbdesk_core/elbdesk_core.dart';
// import 'package:elbdesk_ui/elbdesk_ui.dart';
// import 'package:elbdesk_ui/src/features/app_table/cell_fields/app_table_cell_wrapper.dart';
// import 'package:flutter/material.dart';

// class AppTableCellUsers extends StatelessWidget {
//   ///

//   const AppTableCellUsers(
//     this.users, {
//     this.alignment = Alignment.centerLeft,
//     super.key,
//   });

//   /// The text to display in the table cell.
//   final List<AppUser> users;

//   /// The alignment of the text within the widget.
//   final Alignment alignment;

//   /// Tooltip to display when hovering over the text

//   @override
//   Widget build(BuildContext context) {
//     return AppTableCellWrapper(
//       alignment: alignment,
//       child: LayoutBuilder(
//         builder: (context, constraints) {
//           final maxWidth = constraints.maxWidth;
//           const avatarSize = 24.0;
//           const overlap = 2.0;
//           final maxAvatars =
//               ((maxWidth + overlap) / (avatarSize - overlap)).floor();

//           return Stack(
//             alignment: Alignment.centerLeft,
//             children: [
//               for (int i = 0; i < users.length && i < maxAvatars; i++)
//                 Positioned(
//                   left: i * (avatarSize - overlap),
//                   child: AppUserAvatar(
//                     user: users[i],
//                     size: avatarSize,
//                     isActive: false,
//                     isInRow: true,
//                     cardBackgroundColor:
//                         context.appTheme.generalColors.background,
//                   ),
//                 ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }

// class AppTableCellLightUsers extends StatelessWidget {
//   ///

//   const AppTableCellLightUsers(
//     this.users, {
//     this.alignment = Alignment.centerLeft,
//     super.key,
//   });

//   /// The text to display in the table cell.
//   final List<LightUser> users;

//   /// The alignment of the text within the widget.
//   final Alignment alignment;

//   /// Tooltip to display when hovering over the text

//   @override
//   Widget build(BuildContext context) {
//     return AppTableCellWrapper(
//       alignment: alignment,
//       child: LayoutBuilder(
//         builder: (context, constraints) {
//           final maxWidth = constraints.maxWidth;
//           const avatarSize = 24.0;
//           const overlap = 2.0;
//           final maxAvatars =
//               ((maxWidth + overlap) / (avatarSize - overlap)).floor();

//           return Stack(
//             alignment: Alignment.centerLeft,
//             children: [
//               for (int i = 0; i < users.length && i < maxAvatars; i++)
//                 Positioned(
//                   left: i * (avatarSize - overlap),
//                   child: LightUserAvatar(
//                     user: users[i],
//                     size: avatarSize,
//                     isActive: false,
//                     isInRow: true,
//                     cardBackgroundColor:
//                         context.appTheme.generalColors.background,
//                   ),
//                 ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
