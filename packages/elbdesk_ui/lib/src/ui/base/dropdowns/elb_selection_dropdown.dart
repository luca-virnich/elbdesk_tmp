import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

class ElbSelectionDropdownItem {
  const ElbSelectionDropdownItem({
    required this.label,
    required this.onPressed,
    required this.color,
  });
  final String label;
  final VoidCallback onPressed;
  final Color color;
}

class ElbSelectionDropdown extends StatefulWidget {
  const ElbSelectionDropdown({
    required this.items,
    required this.buttonLabel,
    required this.buttonStatusColor,
    required this.readOnly,
    required this.errorMessageNotifier,
    this.focusOrderId,
    super.key,
  });

  final List<ElbSelectionDropdownItem> items;
  final String buttonLabel;
  final Color buttonStatusColor;
  final bool readOnly;
  final ValueNotifier<String?> errorMessageNotifier;
  final double? focusOrderId;
  @override
  State<ElbSelectionDropdown> createState() => _ElbSelectionDropdownState();
}

class _ElbSelectionDropdownState extends State<ElbSelectionDropdown> {
  late final NextMenuController controller;
  late final FocusNode focusNode;
  Size? buttonSize;
  @override
  void initState() {
    super.initState();
    controller = NextMenuController();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  // const AppStatusButton.light({super.key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final generalColors = context.appTheme.generalColors;
    final borderRadiuses = context.appTheme.borderRadiuses;
    final secondaryButtonStyles = context.appTheme.buttonStyles.secondary;

    final dangerColor = context.appTheme.generalColors.danger;
    return NextMenuAnchor(
      alignmentOffset: const Offset(0, 5),
      controller: controller,
      childFocusNode: focusNode,
      onDismiss: () {},
      menuChildren: [
        ...widget.items.map(
          (e) => SizedBox(
            width: buttonSize?.width ?? 200,
            child: NextMenuItemButton(
              onPressed: widget.readOnly
                  ? null
                  : () {
                      e.onPressed();
                      widget.errorMessageNotifier.value = null;
                    },
              leadingIcon: Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Container(
                  height: 16,
                  width: 16,
                  decoration: BoxDecoration(
                    color: e.color,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              child: Text(
                e.label,
              ),
            ),
          ),
        ),
      ],
      child: ElbMeasureSize(
        onChange: (size) {
          setState(() {
            buttonSize = size;
          });
        },
        child: ElbFocusOrderWrapper(
          focusOrderId: widget.focusOrderId,
          child: OutlinedButton(
            focusNode: focusNode,
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
                    return secondaryButtonStyles.backgroundColorDisabled;
                  }
                  return widget.buttonStatusColor.withAppOpacity(0.05);
                },
              ),
              foregroundColor: WidgetStateProperty.resolveWith<Color>(
                (states) {
                  if (states.contains(WidgetState.disabled)) {
                    return secondaryButtonStyles.foregroundColorDisabled;
                  }
                  return widget.errorMessageNotifier.value != null
                      ? dangerColor
                      : secondaryButtonStyles.foregroundColor;
                },
              ),
              surfaceTintColor:
                  WidgetStateProperty.all(generalColors.transparent),
              overlayColor: WidgetStateProperty.all(
                widget.buttonStatusColor.withAppOpacity(0.1),
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
                    color: widget.errorMessageNotifier.value != null
                        ? dangerColor
                        : widget.buttonStatusColor.withAppOpacity(0.6),
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
                      color: widget.buttonStatusColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      widget.buttonLabel,
                      maxLines: 1,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (widget.errorMessageNotifier.value != null)
                    NextTextFormFieldErrorTooltip(
                      errorText: widget.errorMessageNotifier.value,
                      onClearFn: () {},
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
