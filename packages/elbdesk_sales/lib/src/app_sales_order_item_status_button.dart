import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_sales/elbdesk_sales.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

class AppSalesOrderItemStatusButton extends StatefulWidget {
  const AppSalesOrderItemStatusButton({
    required this.selectedStatus,
    required this.onSelected,
    required this.readOnly,
    this.focusOrderId,
    super.key,
  });

  final SalesOrderItemStatus selectedStatus;
  final void Function(SalesOrderItemStatus) onSelected;
  final bool readOnly;
  final double? focusOrderId;
  @override
  State<AppSalesOrderItemStatusButton> createState() =>
      _AppSalesOrderItemStatusButtonState();
}

class _AppSalesOrderItemStatusButtonState
    extends State<AppSalesOrderItemStatusButton> {
  final FocusNode _buttonFocusNode = FocusNode(debugLabel: 'Menu Button');

  Size? buttonSize;

  @override
  void dispose() {
    _buttonFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final generalColors = context.appTheme.generalColors;
    final borderRadiuses = context.appTheme.borderRadiuses;
    // check the brighness and if it is dark, use a white text color
    // otherwise use a black text color
    // final textColor = selectedColor.computeLuminance() > 0.5
    //     ? generalColors.computeLuminanceLightColor
    //     : generalColors.computeLuminanceDarkColor;
    final l10n = context.l10n;
    final secondaryButtonStyles = context.appTheme.buttonStyles.secondary;
    // final nextStatus = SalesOrderItemStatus.values[
    //     (SalesOrderItemStatus.values.indexOf(widget.selectedStatus) + 1) %
    //         SalesOrderItemStatus.values.length];

    return Row(
      children: [
        Expanded(
          child: NextMenuAnchor(
            alignmentOffset: const Offset(0, 5),
            childFocusNode: _buttonFocusNode,
            onDismiss: () {},
            menuChildren: SalesOrderItemStatus.values
                .map(
                  (e) => SizedBox(
                    width: buttonSize?.width,
                    child: NextMenuItemButton(
                      leadingIcon: Container(
                        height: 16,
                        width: 16,
                        decoration: BoxDecoration(
                          color: e.color,
                          shape: BoxShape.circle,
                        ),
                      ),
                      onPressed:
                          widget.readOnly ? null : () => widget.onSelected(e),
                      child: Text(
                        e.readable(context.l10n),
                        maxLines: 1,
                      ),
                    ),
                  ),
                )
                .toList(),
            builder: (
              BuildContext context,
              NextMenuController controller,
              Widget? child,
            ) {
              return ElbMeasureSize(
                onChange: (size) {
                  setState(() {
                    buttonSize = size;
                  });
                },
                child: ElbFocusOrderWrapper(
                  focusOrderId: widget.focusOrderId,
                  child: OutlinedButton(
                    focusNode: _buttonFocusNode,
                    onPressed: widget.readOnly
                        ? null
                        : () {
                            if (controller.isOpen) {
                              controller.close();
                            } else {
                              controller.open();
                            }
                          },
                    style: ButtonStyle(
                      elevation: WidgetStateProperty.all(0),
                      shadowColor: WidgetStateProperty.all(
                        generalColors.transparent,
                      ),
                      backgroundColor: WidgetStateProperty.resolveWith<Color>(
                        (states) {
                          if (states.contains(WidgetState.disabled)) {
                            return secondaryButtonStyles
                                .backgroundColorDisabled;
                          }
                          return widget.selectedStatus.color
                              .withAppOpacity(0.05);
                        },
                      ),
                      foregroundColor: WidgetStateProperty.resolveWith<Color>(
                        (states) {
                          if (states.contains(WidgetState.disabled)) {
                            return secondaryButtonStyles
                                .foregroundColorDisabled;
                          }
                          return secondaryButtonStyles.foregroundColor;
                        },
                      ),
                      surfaceTintColor:
                          WidgetStateProperty.all(generalColors.transparent),
                      overlayColor: WidgetStateProperty.all(
                        widget.selectedStatus.color.withAppOpacity(0.1),
                      ),
                      fixedSize: WidgetStateProperty.all(
                        const Size.fromHeight(UiConstants.buttonHeight),
                      ),
                      minimumSize: WidgetStateProperty.all(
                        Size.zero,
                      ),
                      padding: WidgetStateProperty.all(
                        UiConstants.buttonPadding,
                      ),
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(borderRadiuses.s),
                        ),
                      ),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      side: WidgetStateProperty.resolveWith<BorderSide>(
                        (states) {
                          return BorderSide(
                            color:
                                widget.selectedStatus.color.withAppOpacity(0.6),
                          );
                        },
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Container(
                            height: 16,
                            width: 16,
                            decoration: BoxDecoration(
                              color: widget.selectedStatus.color,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            widget.selectedStatus.readable(l10n),
                            maxLines: 1,
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        // SizedBox(
        //   height: UiConstants.buttonHeight,
        //   width: 0.7,
        //   child: ColoredBox(
        //     color: textColor,
        //   ),
        // ),
        // OutlinedButton(
        //   onPressed: () {
        //     // Find current status and get next one in list if not at end
        //     final currentIndex = SalesOrderItemStatus.values.indexWhere(
        //       (status) => status == widget.selectedStatus,
        //     );
        //     if (currentIndex < SalesOrderItemStatus.values.length - 1) {
        //       widget.onSelected(
        //         SalesOrderItemStatus.values[currentIndex + 1],
        //       );
        //     }
        //   },
        //   style: ButtonStyle(
        //     elevation: WidgetStateProperty.all(0),
        //     shadowColor: WidgetStateProperty.all(generalColors.transparent),
        //     backgroundColor: WidgetStateProperty.resolveWith<Color>(
        //       (states) {
        //         return nextStatus.color(statusColors);
        //       },
        //     ),
        //     foregroundColor: WidgetStateProperty.resolveWith<Color>(
        //       (states) {
        //         return textColor;
        //       },
        //     ),
        //     surfaceTintColor:
        //         WidgetStateProperty.all(generalColors.transparent),
        //     overlayColor: WidgetStateProperty.all(generalColors.transparent),
        //     fixedSize: WidgetStateProperty.all(
        //       const Size.fromHeight(UiConstants.buttonHeight),
        //     ),
        //     minimumSize: WidgetStateProperty.all(
        //       Size.zero,
        //     ),
        //     padding: WidgetStateProperty.all(
        //       UiConstants.buttonPadding,
        //     ),
        //     shape: WidgetStateProperty.all(
        //       RoundedRectangleBorder(
        //         borderRadius: BorderRadius.only(
        //           topRight: Radius.circular(borderRadiuses.s),
        //           bottomRight: Radius.circular(borderRadiuses.s),
        //           topLeft: Radius.zero,
        //           bottomLeft: Radius.zero,
        //         ),
        //       ),
        //     ),
        //     side: WidgetStateProperty.resolveWith<BorderSide>(
        //       (states) {
        //         return BorderSide(
        //           color: nextStatus.color(statusColors),
        //         );
        //       },
        //     ),
        //   ),
        //   child: Icon(Icons.chevron_right, color: textColor),
        // ),
      ],
    );
  }
}
