// import 'package:elbdesk_client/elbdesk_client.dart';
// import 'package:elbdesk_ui/elbdesk_ui.dart';
// import 'package:flutter/material.dart';

// class DashboardListTile extends StatelessWidget {
//   const DashboardListTile({
//     required this.title,
//     required this.subtitle,
//     required this.onPressed,
//     required this.icon,
//     super.key,
//     this.iconColor,
//   });

//   final String title;
//   final String subtitle;
//   final VoidCallback onPressed;
//   final IconData icon;
//   final Color? iconColor;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         AppListTile(
//           leading: Padding(
//             padding: const EdgeInsets.only(
//               right: UiConstants.defaultPadding,
//             ),
//             child: AppIcon(
//               icon,
//               color: iconColor,
//             ),
//           ),
//           onPressed: onPressed,
//           child: Expanded(
//             child: Row(
//               children: [
//                 AppText(title),
//                 const SizedBox(
//                   width: UiConstants.defaultPadding,
//                 ),
//                 Expanded(
//                   child: AppText(
//                     subtitle,
//                     maxLines: 1,
//                     style: context.appTheme.textStyles.defaultTextLight,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         const AppDivider(),
//       ],
//     );
//   }
// }
