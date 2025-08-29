// import 'package:elbdesk_ui/elbdesk_ui.dart';
// import 'package:flutter/material.dart';

// /// A custom suffix button for text fields that can be placed outside the text
// /// field.
// ///
// /// This widget allows you to provide a custom child widget or use an icon
// /// button with the specified icon data and callback function.
// class AppTextFieldOutsideSuffixButton extends StatelessWidget {
//   /// Creates an [AppTextFieldOutsideSuffixButton].
//   ///
//   /// The [onPressed] and [iconData] parameters are optional. If [child] is
//   /// provided, it will be used instead of the default icon button.
//   const AppTextFieldOutsideSuffixButton({
//     this.onPressed,
//     this.iconData,
//     this.tooltip,
//     this.child,
//     super.key,
//   });

//   /// The icon data to display inside the button.
//   final IconData? iconData;

//   /// The callback function that is called when the button is pressed.
//   final VoidCallback? onPressed;

//   /// The custom child widget to display inside the button.
//   final Widget? child;

//   /// The tooltip to display when hovering over the button.
//   final String? tooltip;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       /// Adds padding to the left and top of the button.
//       padding: const EdgeInsets.only(left: 8, top: 16),
//       child: child ??
//           AppIconButton.primary(
//             // overlayColor: Colors.transparent,
//             tooltip: tooltip,
//             skipTraversal: true,
//             iconData: iconData,
//             onPressed: onPressed,
//           ),
//     );
//   }
// }
