// import 'package:elbdesk_ui/elbdesk_ui.dart';
// import 'package:elbrp_ui/src/buttons/elb_icon_button_content.dart';
// import 'package:elbrp_ui/src/theme/ui_constants.dart';
// import 'package:flutter/material.dart';

// class AppTextButton extends StatelessWidget {
//   const AppTextButton({
//     required this.onPressed,
//     super.key,
//     this.child,
//     this.isLoading = false,
//     this.label,
//     this.color,
//   });

//   factory AppTextButton.icon({
//     required VoidCallback onPressed,
//     required Widget icon,
//     AppButtonIconPosition iconPosition = AppButtonIconPosition.leftInside,
//     Widget? child,
//     String? label,
//     bool isLoading = false,
//   }) {
//     return AppTextButton(
//       onPressed: onPressed,
//       isLoading: isLoading,
//       child: AppIconButtonContent(
//         icon: icon,
//         label: label,
//         iconPosition: iconPosition,
//         child: child,
//       ),
//     );
//   }
//   final VoidCallback? onPressed;
//   final bool isLoading;
//   final Color? color;
//   final Widget? child;
//   final String? label;

//   @override
//   Widget build(BuildContext context) {
//     return _Button(
//       onPressed: onPressed,
//       label: label,
//       isLoading: isLoading,
//       color: color,
//       child: child,
//     );
//   }
// }

// class _Button extends StatelessWidget {
//   const _Button({
//     required this.onPressed,
//     required this.child,
//     required this.label,
//     required this.isLoading,
//     required this.color,
//   });

//   final VoidCallback? onPressed;
//   final Widget? child;
//   final String? label;
//   final bool isLoading;
//   final Color? color;

//   @override
//   Widget build(BuildContext context) {
//     return TextButton(
//       onPressed: onPressed,
//       style: ButtonStyle(
//         foregroundColor:
//             WidgetStateProperty.all(color ?? context.elbColors.primary),
//         fixedSize: WidgetStateProperty.all(
//           const Size.fromHeight(UiConstants.buttonHeight),
//         ),
//         padding: WidgetStateProperty.all(
//           UiConstants.buttonPadding,
//         ),
//         shape: WidgetStateProperty.all(
//           RoundedRectangleBorder(
//          borderRadius: BorderRadius.circular(UiConstants.buttonBorderRadius),
//           ),
//         ),
//         overlayColor:
//          WidgetStateProperty.all(context.elbColors.primary.withOpacity(0.1)),
//       ),
//       child: Stack(
//         alignment: Alignment.center,
//         children: [
//           child ??
//               AppText(
//                 label ?? '',
//               ),
//           Opacity(
//             opacity: isLoading ? 1 : 0,
//             child: AppLoadingIndicator(
//               color: context.elbColors.onPrimary,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
