import 'package:cached_network_image/cached_network_image.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

// class AppUserAvatar extends StatelessWidget {
//   const AppUserAvatar({
//     required this.user,
//     required this.isActive,
//     this.isInRow = false,
//     this.size = 32,
//     this.cardBackgroundColor,
//     super.key,
//   });

//   final AppUser user;
//   final bool isActive;
//   final double size;
//   final bool isInRow;
//   final Color? cardBackgroundColor;

//   @override
//   Widget build(BuildContext context) {
//     final primaryColor = context.appTheme.generalColors.primary;
//     final activeColor = context.appTheme.statusColors.success;
//     final cardBackgroundColor =
//         this.cardBackgroundColor ?? context.appTheme.generalColors.background;

//     final showImage = user.userInfo.imageUrl != null &&
//         user.userInfo.imageUrl!.trim().isNotEmpty;

//     return AppTooltip(
//       message: user.userInfo.fullName,
//       child: Container(
//         width: size,
//         height: size,
//         decoration: BoxDecoration(
//           color: cardBackgroundColor,
//           shape: BoxShape.circle,
//           border: isActive
//               ? Border.all(
//                   color: activeColor,
//                   width: 2,
//                 )
//               : Border.all(
//                   color: primaryColor,
//                   width: 1,
//                 ),
//           boxShadow: !isInRow
//               ? []
//               : [
//                   BoxShadow(
//                     color: cardBackgroundColor,
//                     spreadRadius: 2,
//                   ),
//                 ],
//         ),
//         child: showImage
//             ? ClipOval(
//                 child: Center(
//                   child: CachedNetworkImage(
//                     imageUrl: user.userInfo.imageUrl ?? '',
//                     placeholder: (context, url) => const SizedBox.shrink(),
//                     errorWidget: (context, url, error) => Center(
//                       child: AppText(
//                         user.general.initials,
//                         fontSize: 12,
//                       ),
//                     ),
//                     fit: BoxFit.cover,
//                     width: size,
//                     height: size,
//                   ),
//                 ),
//               )
//             : Center(
//                 child: AppText(
//                   user.general.initials,
//                   fontSize: 12,
//                 ),
//               ),
//       ),
//     );
//   }
// }

class LightUserAvatar extends StatelessWidget {
  const LightUserAvatar({
    required this.user,
    required this.isActive,
    this.isInRow = false,
    this.size = 32,
    this.cardBackgroundColor,
    super.key,
  });

  final LightUser user;
  final bool isActive;
  final double size;
  final bool isInRow;
  final Color? cardBackgroundColor;

  @override
  Widget build(BuildContext context) {
    final primaryColor = context.appTheme.generalColors.primary;
    final activeColor = context.appTheme.statusColors.success;
    final cardBackgroundColor =
        this.cardBackgroundColor ?? context.appTheme.generalColors.background;

    final showImage = user.imageUrl.trim().isNotEmpty;

    return AppTooltip(
      message: user.fullName,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: cardBackgroundColor,
          shape: BoxShape.circle,
          border: isActive
              ? Border.all(
                  color: activeColor,
                  width: 2,
                )
              : Border.all(
                  color: primaryColor,
                  width: 1,
                ),
          boxShadow: !isInRow
              ? []
              : [
                  BoxShadow(
                    color: cardBackgroundColor,
                    spreadRadius: 2,
                  ),
                ],
        ),
        child: showImage
            ? ClipOval(
                child: Center(
                  child: CachedNetworkImage(
                    imageUrl: user.imageUrl,
                    placeholder: (context, url) => const SizedBox.shrink(),
                    errorWidget: (context, url, error) => Center(
                      child: AppText(
                        user.initials,
                        fontSize: 12,
                      ),
                    ),
                    fit: BoxFit.cover,
                    width: size,
                    height: size,
                  ),
                ),
              )
            : Center(
                child: AppText(
                  user.initials,
                  fontSize: 12,
                ),
              ),
      ),
    );
  }
}
