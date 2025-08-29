import 'package:flutter/material.dart';

@immutable
class AppStatusEntry<T> {
  const AppStatusEntry({
    required this.label,
    required this.color,
    required this.value,
  });
  final String label;
  final Color color;
  final T value;

  @override
  String toString() =>
      'AppStatusEntry(label: $label, color: $color, value: $value)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AppStatusEntry<T> &&
        other.label == label &&
        other.color == color &&
        other.value == value;
  }

  @override
  int get hashCode => Object.hash(label, color, value);
}

// class AppStatusButton<T> extends StatefulWidget {
//   const AppStatusButton({
//     required this.status,
//     required this.selectedStatus,
//     required this.onSelected,
//     super.key,
//   });

//   final List<AppStatusEntry<T>> status;
//   final AppStatusEntry<T> selectedStatus;
//   final void Function(AppStatusEntry<T>) onSelected;

//   @override
//   State<AppStatusButton<T>> createState() => _AppStatusButtonState<T>();
// }

// class _AppStatusButtonState<T> extends State<AppStatusButton<T>> {
//   final FocusNode _buttonFocusNode = FocusNode(debugLabel: 'Menu Button');

//   Size? buttonSize;

//   @override
//   void dispose() {
//     _buttonFocusNode.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final selectedColor = widget.selectedStatus.color;
//     final generalColors = context.appTheme.generalColors;
//     final borderRadiuses = context.appTheme.borderRadiuses;
//     // check the brighness and if it is dark, use a white text color
//     // otherwise use a black text color
//     final textColor = selectedColor.computeLuminance() > 0.5
//         ? generalColors.computeLuminanceLightColor
//         : generalColors.computeLuminanceDarkColor;

//     return Row(
//       children: [
//         Expanded(
//           child: NextMenuAnchor(
//             alignmentOffset: const Offset(0, 5),
//             childFocusNode: _buttonFocusNode,
//             onDismiss: () {},
//             menuChildren: widget.status
//                 .map(
//                   (e) => SizedBox(
//                     width: buttonSize?.width,
//                     child: NextMenuItemButton(
//                       leadingIcon: Container(
//                         height: 16,
//                         width: 16,
//                         decoration: BoxDecoration(
//                           color: e.color,
//                           shape: BoxShape.circle,
//                         ),
//                       ),
//                       child: Text(
//                         e.label,
//                         maxLines: 1,
//                       ),
//                       onPressed: () => widget.onSelected(e),
//                     ),
//                   ),
//                 )
//                 .toList(),
//             builder: (
//               BuildContext context,
//               NextMenuController controller,
//               Widget? child,
//             ) {
//               return MeasureSize(
//                 onChange: (size) {
//                   setState(() {
//                     buttonSize = size;
//                   });
//                 },
//                 child: OutlinedButton(
//                   onPressed: () {
//                     if (controller.isOpen) {
//                       controller.close();
//                     } else {
//                       controller.open();
//                     }
//                   },
//                   style: ButtonStyle(
//                     elevation: WidgetStateProperty.all(0),
//                     shadowColor: WidgetStateProperty.all(
//                       generalColors.transparent,
//                     ),
//                     backgroundColor: WidgetStateProperty.resolveWith<Color>(
//                       (states) {
//                         return widget.selectedStatus.color;
//                       },
//                     ),
//                     foregroundColor: WidgetStateProperty.resolveWith<Color>(
//                       (states) {
//                         return textColor;
//                       },
//                     ),
//                     surfaceTintColor:
//                         WidgetStateProperty.all(generalColors.transparent),
//                     overlayColor: WidgetStateProperty.all(
//                       generalColors.transparent,
//                     ),
//                     fixedSize: WidgetStateProperty.all(
//                       const Size.fromHeight(UiConstants.buttonHeight),
//                     ),
//                     minimumSize: WidgetStateProperty.all(
//                       Size.zero,
//                     ),
//                     padding: WidgetStateProperty.all(
//                       UiConstants.buttonPadding,
//                     ),
//                     shape: WidgetStateProperty.all(
//                       RoundedRectangleBorder(
//                         borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(borderRadiuses.s),
//                           bottomLeft: Radius.circular(borderRadiuses.s),
//                           topRight: Radius.zero,
//                           bottomRight: Radius.zero,
//                         ),
//                       ),
//                     ),
//                     side: WidgetStateProperty.resolveWith<BorderSide>(
//                       (states) {
//                         return BorderSide(
//                           color: widget.selectedStatus.color,
//                         );
//                       },
//                     ),
//                   ),
//                   child: Align(
//                     alignment: Alignment.centerLeft,
//                     child: AppText(
//                       widget.selectedStatus.label,
//                       maxLines: 1,
//                       textAlign: TextAlign.left,
//                       // color: textColor,
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//         SizedBox(
//           height: UiConstants.buttonHeight,
//           width: 0.7,
//           // child: VerticalDivider(
//           //   color: textColor,
//           //   width: 0.7,
//           //   indent: 0,
//           //   endIndent: 0,
//           //   thickness: 1,
//           // ),
//           child: ColoredBox(
//             color: textColor,
//           ),
//         ),
//         OutlinedButton(
//           onPressed: () {
//             // Find current status and get next one in list if not at end
//             final currentIndex = widget.status.indexWhere(
//               (status) => status.value == widget.selectedStatus.value,
//             );
//             if (currentIndex < widget.status.length - 1) {
//               widget.onSelected(widget.status[currentIndex + 1]);
//             }
//           },
//           style: ButtonStyle(
//             elevation: WidgetStateProperty.all(0),
//             shadowColor: WidgetStateProperty.all(generalColors.transparent),
//             backgroundColor: WidgetStateProperty.resolveWith<Color>(
//               (states) {
//                 // if (states.contains(WidgetState.disabled)) {
//                 //   return backgroundColorDisabled;
//                 // }
//                 return widget.selectedStatus.color;
//               },
//             ),
//             foregroundColor: WidgetStateProperty.resolveWith<Color>(
//               (states) {
//                 // if (states.contains(WidgetState.disabled)) {
//                 //   return foregroundColorDisabled;
//                 // }
//                 // if (states.contains(WidgetState.hovered)) {
//                 //   return foregroundColorOnHover;
//                 // }
//                 // if (states.contains(WidgetState.focused)) {
//                 //   return foregroundColorOnHover;
//                 // }

//                 return textColor;
//               },
//             ),
//             surfaceTintColor:
//                 WidgetStateProperty.all(generalColors.transparent),
//             overlayColor: WidgetStateProperty.all(generalColors.transparent),
//             fixedSize: WidgetStateProperty.all(
//               const Size.fromHeight(UiConstants.buttonHeight),
//             ),
//             minimumSize: WidgetStateProperty.all(
//               Size.zero,
//             ),
//             padding: WidgetStateProperty.all(
//               UiConstants.buttonPadding,
//             ),
//             shape: WidgetStateProperty.all(
//               RoundedRectangleBorder(
//                 borderRadius: BorderRadius.only(
//                   topRight: Radius.circular(borderRadiuses.s),
//                   bottomRight: Radius.circular(borderRadiuses.s),
//                   topLeft: Radius.zero,
//                   bottomLeft: Radius.zero,
//                 ),
//               ),
//             ),
//             side: WidgetStateProperty.resolveWith<BorderSide>(
//               (states) {
//                 return BorderSide(
//                   color: widget.selectedStatus.color,
//                 );
//               },
//             ),
//           ),
//           child: Icon(Icons.chevron_right, color: textColor),
//         ),
//       ],
//     );
//   }
// }
