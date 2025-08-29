// TODO(all): Delete or refactor
// import 'package:elbdesk_ui/elbdesk_ui.dart';
// import 'package:flutter/material.dart';

// enum _SegmentedActionsButtonType { primary, secondary, danger, blank }

// /// A button widget that displays a row of actions.
// ///
// /// The [SegmentedActionsButton] widget is a customizable button that can
// /// display multiple actions. It supports different styles such as primary,
// /// secondary, danger, and blank. The button can also be configured with an
// /// icon size, color, and overlay color.
// ///
// /// If the size, width, or height is not provided, the widget will fall back to
// /// using a [LayoutBuilder] to calculate the constraints on its own.
// class SegmentedActionsButton extends StatelessWidget {
//   /// Creates a blank style [SegmentedActionsButton].
//   ///
//   /// The [actions] parameter must contain at least 2 elements.
//   const SegmentedActionsButton({
//     super.key,
//     this.actions = const [],
//     this.skipTraversal = false,
//     this.iconSize = 20,
//     this.color,
//     this.overlayColor,
//     this.isLoading = false,
//   })  : _type = _SegmentedActionsButtonType.blank,
//         assert(actions.length >= 2, 'Actions must have at least 2 elements');

//   const SegmentedActionsButton._({
//     required _SegmentedActionsButtonType type,
//     super.key,
//     this.actions = const [],
//     this.skipTraversal = false,
//     this.iconSize = 20,
//     this.color,
//     this.overlayColor,
//     this.isLoading = false,
//   })  : _type = type,
//         assert(actions.length >= 2, 'Actions must have at least 2 elements');

//   /// Creates a primary style [SegmentedActionsButton].
//   const SegmentedActionsButton.primary({
//     Key? key,
//     List<Widget> actions = const [],
//     double iconSize = 20,
//     bool skipTraversal = false,
//     Color? color,
//     Color? overlayColor,
//     bool isLoading = false,
//   }) : this._(
//           key: key,
//           type: _SegmentedActionsButtonType.primary,
//           actions: actions,
//           iconSize: iconSize,
//           skipTraversal: skipTraversal,
//           color: color,
//           overlayColor: overlayColor,
//           isLoading: isLoading,
//         );

//   /// Creates a secondary style [SegmentedActionsButton].
//   const SegmentedActionsButton.secondary({
//     Key? key,
//     List<Widget> actions = const [],
//     double iconSize = 20,
//     bool skipTraversal = false,
//     Color? color,
//     Color? overlayColor,
//     bool isLoading = false,
//   }) : this._(
//           key: key,
//           type: _SegmentedActionsButtonType.secondary,
//           actions: actions,
//           iconSize: iconSize,
//           skipTraversal: skipTraversal,
//           color: color,
//           overlayColor: overlayColor,
//           isLoading: isLoading,
//         );

//   /// Creates a danger style [SegmentedActionsButton].
//   const SegmentedActionsButton.danger({
//     Key? key,
//     List<Widget> actions = const [],
//     double iconSize = 20,
//     bool skipTraversal = false,
//     Color? color,
//     Color? overlayColor,
//     bool isLoading = false,
//   }) : this._(
//           key: key,
//           type: _SegmentedActionsButtonType.danger,
//           actions: actions,
//           iconSize: iconSize,
//           skipTraversal: skipTraversal,
//           color: color,
//           overlayColor: overlayColor,
//           isLoading: isLoading,
//         );

//   /// The type of the icon button.
//   final _SegmentedActionsButtonType _type;

//   /// The size of the icon inside the button.
//   final double iconSize;

//   /// Whether to skip traversal for the focus node.
//   final bool skipTraversal;

//   /// The color of the icon inside the button.
//   final Color? color;

//   /// The overlay color of the button.
//   final Color? overlayColor;

//   /// Whether the button is in a loading state.
//   final bool isLoading;

//   /// The list of actions to display in the button.
//   ///
//   /// Must contain at least 2 elements.
//   final List<Widget> actions;

//   @override
//   Widget build(BuildContext context) {
//     final buttonColors = context.appColors.buttons;

//     final backgroundColor = switch (_type) {
//       _SegmentedActionsButtonType.primary => buttonColors.primaryBackground,
//    _SegmentedActionsButtonType.secondary => buttonColors.secondaryBackground,
//       _SegmentedActionsButtonType.danger => buttonColors.dangerBackground,
//       _SegmentedActionsButtonType.blank => buttonColors.blankBackground,
//     };

//     final foregroundColor = switch (_type) {
//       _SegmentedActionsButtonType.primary => buttonColors.primaryForeground,
//   _SegmentedActionsButtonType.secondary => buttonColors.secondaryForeground,
//       _SegmentedActionsButtonType.danger => buttonColors.dangerForeground,
//       _SegmentedActionsButtonType.blank => buttonColors.blankForeground,
//     };

//     final borderColor = switch (_type) {
//       _SegmentedActionsButtonType.primary => buttonColors.primaryBorder,
//       _SegmentedActionsButtonType.secondary => buttonColors.secondaryBorder,
//       _SegmentedActionsButtonType.danger => buttonColors.dangerBorder,
//       _SegmentedActionsButtonType.blank => buttonColors.blankBorder,
//     };

//     final overlayColor = switch (_type) {
//       _SegmentedActionsButtonType.primary => buttonColors.primaryHover,
//       _SegmentedActionsButtonType.secondary => buttonColors.secondaryHover,
//       _SegmentedActionsButtonType.danger => buttonColors.dangerHover,
//       _SegmentedActionsButtonType.blank => buttonColors.blankHover,
//     };

//     final foregroundColorHover = switch (_type) {
//       _SegmentedActionsButtonType.primary =>
//         buttonColors.primaryForegroundHover,
//       _SegmentedActionsButtonType.secondary =>
//         buttonColors.secondaryForegroundHover,
//    _SegmentedActionsButtonType.danger => buttonColors.dangerForegroundHover,
//       _SegmentedActionsButtonType.blank => buttonColors.blankForegroundHover,
//     };

//     final borderColorHover = switch (_type) {
//       _SegmentedActionsButtonType.primary => buttonColors.primaryBorderHover,
//       _SegmentedActionsButtonType.secondary =>
//         buttonColors.secondaryBorderHover,
//       _SegmentedActionsButtonType.danger => buttonColors.dangerBorderHover,
//       _SegmentedActionsButtonType.blank => buttonColors.blankBorderHover,
//     };

//     final backgroundColorDisabled = switch (_type) {
//       _SegmentedActionsButtonType.primary =>
//         buttonColors.primaryBackgroundDisabled,
//       _SegmentedActionsButtonType.secondary =>
//         buttonColors.secondaryBackgroundDisabled,
//       _SegmentedActionsButtonType.danger =>
//         buttonColors.dangerBackgroundDisabled,
//  _SegmentedActionsButtonType.blank => buttonColors.blankBackgroundDisabled,
//     };

//     final foregroundColorDisabled = switch (_type) {
//       _SegmentedActionsButtonType.primary =>
//         buttonColors.primaryForegroundDisabled,
//       _SegmentedActionsButtonType.secondary =>
//         buttonColors.secondaryForegroundDisabled,
//       _SegmentedActionsButtonType.danger =>
//         buttonColors.dangerForegroundDisabled,
//  _SegmentedActionsButtonType.blank => buttonColors.blankForegroundDisabled,
//     };

//     final borderDisabled = switch (_type) {
//   _SegmentedActionsButtonType.primary => buttonColors.primaryBorderDisabled,
//       _SegmentedActionsButtonType.secondary =>
//         buttonColors.secondaryBorderDisabled,
//    _SegmentedActionsButtonType.danger => buttonColors.dangerBorderDisabled,
//       _SegmentedActionsButtonType.blank => buttonColors.blankBorderDisabled,
//     };

//     final buttonPadding = switch (_type) {
//       _SegmentedActionsButtonType.blank => EdgeInsets.zero,
//       _ => UiConstants.buttonPadding
//     };

//     BorderRadius getBorderRadius(int index, int length) {
//       if (index == 0) {
//         return const BorderRadius.only(
//           topLeft: Radius.circular(
//             UiConstants.buttonBorderRadius,
//           ), // Top-left corner radius
//           bottomLeft: Radius.circular(
//             UiConstants.buttonBorderRadius,
//           ), // Bottom-left corner radius
//         );
//       }

//       if (index == length) {
//         return const BorderRadius.only(
//           topRight: Radius.circular(
//             UiConstants.buttonBorderRadius,
//           ), // Top-right corner radius
//           bottomRight: Radius.circular(
//             UiConstants.buttonBorderRadius,
//           ), // Bottom-right corner radius
//         );
//       }

//       return BorderRadius.zero;
//     }

//     return Material(
//       color: isLoading ? overlayColor : backgroundColor,
//       // borderRadius: BorderRadius.circular(UiConstants.buttonBorderRadius),
//       clipBehavior: Clip.hardEdge,
//       shape: !isLoading
//           ? RoundedRectangleBorder(
//               borderRadius:
//                   BorderRadius.circular(UiConstants.buttonBorderRadius),
//             )
//           : RoundedRectangleBorder(
//               borderRadius:
//                   BorderRadius.circular(UiConstants.buttonBorderRadius),
//               side: BorderSide(color: borderColor),
//             ),
//       child: Stack(
//         alignment: Alignment.center,
//         children: [
//           Visibility(
//             visible: !isLoading,
//             maintainState: true,
//             maintainAnimation: true,
//             maintainSize: true,
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 if (actions.isNotEmpty) ...[
//                   for (int i = 0; i < actions.length; i++) ...[
//                     _ActionSegmentInfo(
//                       index: i,
//                       totalNumberOfActions: actions.length,
//                       backgroundColor: backgroundColor,
//                       foregroundColor: foregroundColor,
//                       borderColor: borderColor,
//                       overlayColor: overlayColor,
//                       foregroundColorHover: foregroundColorHover,
//                       borderColorHover: borderColorHover,
//                       backgroundColorDisabled: backgroundColorDisabled,
//                       foregroundColorDisabled: foregroundColorDisabled,
//                       borderDisabled: borderDisabled,
//                       buttonPadding: buttonPadding,
//                       borderRadius: getBorderRadius(i, actions.length - 1),
//                       // overlayColor: WidgetStateProperty.all(overlayColor),
//                       // onTap: _handleTap(i),
//                       child: actions[i],
//                     ),
//                     // if (i < actions.length - 1) ...[
//                     //   SizedBox(
//                     //     height: UiConstants.buttonHeight,
//                     //     child: AppDivider.vertical(
//                     //       color: foregroundColor,
//                     //     ),
//                     //   ),
//                     // ],
//                   ],
//                 ],
//               ],
//             ),
//           ),
//           Opacity(
//             opacity: isLoading ? 1 : 0,
//             child: AppLoadingIndicator(
//               color: foregroundColor,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// /// A segment of an [SegmentedActionsButton] that displays an icon, label, or
// /// both.
// ///
// /// The [ActionSegment] widget is a customizable button segment that can
// /// display an icon, a label, or both. It supports different styles and states
// /// such as hover, focus, and disabled. The button segment can also be
// /// configured with a tooltip and icon alignment.
// class ActionSegment extends StatelessWidget {
//   /// Creates an [ActionSegment] with the specified properties.
//   ///
//   /// The [iconData] and [onPressed] parameters are required.
//   const ActionSegment({
//     required this.iconData,
//     required this.onPressed,
//     this.isLoading = false,
//     super.key,
//     this.icon,
//     this.foregroundColor,
//     this.label,
//     this.tooltip,
//     this.iconAlignment = IconAlignment.start,
//   });

//   /// Whether the button segment is in a loading state.
//   final bool isLoading;

//   /// The icon data to display inside the button segment.
//   final IconData? iconData;

//   /// The icon widget to display inside the button segment.
//   final Icon? icon;

//   /// The foreground color of the button segment.
//   final Color? foregroundColor;

//   /// The label text to display inside the button segment.
//   final String? label;

//   /// The tooltip text to display when the button segment is long-pressed.
//   final String? tooltip;

//   /// The callback function that is called when the button segment is pressed.
//   final VoidCallback? onPressed;

//   /// The alignment of the icon inside the button segment.
//   final IconAlignment iconAlignment;

//   @override
//   Widget build(BuildContext context) {
//     // Retrieve the button segment information from the context.
//     final info = _ActionSegmentInfo.of(context);

//     // Define the button style based on the current states.
//     final buttonStyle = ButtonStyle(
//       side: WidgetStateProperty.resolveWith<BorderSide>(
//         (states) {
//           if (states.contains(WidgetState.disabled)) {
//             return BorderSide(color: info.borderDisabled);
//           }
//           if (states.contains(WidgetState.hovered) ||
//               states.contains(WidgetState.focused)) {
//             return BorderSide(
//               color: info.borderColorHover,
//             );
//           }
//           return BorderSide(
//             color: info.borderColor,
//           );
//         },
//       ),
//       backgroundColor: WidgetStateProperty.resolveWith<Color>(
//         (states) {
//           if (states.contains(WidgetState.disabled)) {
//             return info.backgroundColorDisabled;
//           }
//           return info.backgroundColor;
//         },
//       ),
//       foregroundColor: WidgetStateProperty.resolveWith<Color>(
//         (states) {
//           if (states.contains(WidgetState.disabled)) {
//             return info.foregroundColorDisabled;
//           }
//           if (states.contains(WidgetState.hovered)) {
//             return info.foregroundColorHover;
//           }
//           if (states.contains(WidgetState.focused)) {
//             return info.foregroundColorHover;
//           }
//           return info.foregroundColor;
//         },
//       ),
//       overlayColor: WidgetStateProperty.all(info.overlayColor),
//       fixedSize: WidgetStateProperty.all(
//         const Size.fromHeight(UiConstants.buttonHeight),
//       ),
//       minimumSize: WidgetStateProperty.all(
//         Size.zero,
//       ),
//       padding: WidgetStateProperty.all(
//         info.buttonPadding,
//       ),
//       shape: WidgetStateProperty.all(
//         RoundedRectangleBorder(
//           borderRadius: info.borderRadius,
//         ),
//       ),
//     );

//     return Stack(
//       alignment: Alignment.center,
//       children: [
//         Visibility(
//           visible: !isLoading,
//           maintainState: true,
//           maintainAnimation: true,
//           maintainSize: true,
//           child: [
//             // Return a button segment with a label only.
//             if (label != null && iconData == null)
//               _ActionSegmentTooltip(
//                 message: tooltip ?? label ?? '',
//                 child: OutlinedButton(
//                   onPressed: onPressed,
//                   style: buttonStyle,
//                   child: AppText(label!),
//                 ),
//               ),

//             // Return a button segment with an icon only.
//             if (label == null && iconData != null)
//               _ActionSegmentTooltip(
//                 message: tooltip ?? label ?? '',
//                 child: OutlinedButton(
//                   onPressed: onPressed,
//                   style: buttonStyle,
//                   child: icon ??
//                       Icon(
//                         iconData,
//                         size: 20,
//                       ),
//                 ),
//               ),

//             // Return a button segment with both an icon and a label.
//             if (label != null && iconData != null)
//               _ActionSegmentTooltip(
//                 message: tooltip ?? label ?? '',
//                 child: OutlinedButton.icon(
//                   onPressed: onPressed,
//                   style: buttonStyle,
//                   iconAlignment: iconAlignment,
//                   label: AppText(label!),
//                   icon: icon ??
//                       Icon(
//                         iconData,
//                         size: 20,
//                       ),
//                 ),
//               ),
//           ][0],
//         ),
//         Positioned.fill(
//           child: IgnorePointer(
//             child: Opacity(
//               opacity: isLoading ? 1 : 0,
//               child: DecoratedBox(
//                 decoration: BoxDecoration(
//                   color: info.overlayColor,
//                 ),
//                 child: Center(
//                   child: AppLoadingIndicator(
//                     color: info.foregroundColor,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// /// Inherited widget for passing data from the [SegmentedActionsButton] to the
// /// [SegmentedActionsButton.actions] children widgets.
// ///
// /// Useful for building action buttons using:
// /// `_ActionsButtonSegmentInfo.of(context)`.
// class _ActionSegmentInfo extends InheritedWidget {
//   /// Adds the information needed to build an action button to the
//   /// [child] and descendants.
//   const _ActionSegmentInfo({
//     required this.index,
//     required this.totalNumberOfActions,
//     required super.child,
//     required this.backgroundColor,
//     required this.foregroundColor,
//     required this.borderColor,
//     required this.overlayColor,
//     required this.foregroundColorHover,
//     required this.borderColorHover,
//     required this.backgroundColorDisabled,
//     required this.foregroundColorDisabled,
//     required this.borderDisabled,
//     required this.buttonPadding,
//     required this.borderRadius,
//   });

//   final BorderRadius borderRadius;

//   /// Which action index is this in the AppActionsButton.
//   final int index;

//   /// How many total destinations are in this ActionButton.
//   ///
//   /// This is required for semantics, so that each button can have a label
//   /// "Tab 1 of 4", for example.
//   final int totalNumberOfActions;
//   final Color backgroundColor;
//   final Color foregroundColor;
//   final Color borderColor;
//   final Color overlayColor;
//   final Color foregroundColorHover;
//   final Color borderColorHover;
//   final Color backgroundColorDisabled;
//   final Color foregroundColorDisabled;
//   final Color borderDisabled;
//   final EdgeInsets buttonPadding;

//   /// Returns a non null [_ActionSegmentInfo].
//   ///
//   /// This will return an error if called with no [_ActionSegmentInfo]
//   /// ancestor.
//   ///
//   /// Used by widgets that are implementing a actions button segment info to
//   /// get information like the action number.
//   static _ActionSegmentInfo of(BuildContext context) {
//     final result =
//         context.dependOnInheritedWidgetOfExactType<_ActionSegmentInfo>();
//     assert(
//       result != null,
//       'ActionsButton segments need a _ActionsButtonSegmentInfo parent, '
//       'which is usually provided by ActionsButton.',
//     );
//     return result!;
//   }

//   @override
//   bool updateShouldNotify(_ActionSegmentInfo oldWidget) {
//     return index != oldWidget.index ||
//         totalNumberOfActions != oldWidget.totalNumberOfActions;
//   }
// }

// /// Tooltip widget for use in an [SegmentedActionsButton].
// ///
// /// It appears just above the [SegmentedActionsButton] when one of the actions
// /// is long pressed.
// class _ActionSegmentTooltip extends StatelessWidget {
//   /// Adds a tooltip to the [child] widget.
//   const _ActionSegmentTooltip({
//     required this.message,
//     required this.child,
//   });

//   /// The text that is rendered in the tooltip when it appears.
//   final String message;

//   /// The widget that, when pressed, will show a tooltip.
//   final Widget child;

//   @override
//   Widget build(BuildContext context) {
//     return Tooltip(
//       message: message,
//       verticalOffset: 20,
//       excludeFromSemantics: true,
//       preferBelow: false,
//       child: child,
//     );
//   }
// }
