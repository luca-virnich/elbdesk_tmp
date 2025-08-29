import 'dart:math' as math;

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/elbdesk_prepress.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

class NutzenlayoutLaufrichtungButton extends StatefulWidget {
  const NutzenlayoutLaufrichtungButton({
    required this.readOnly,
    required this.selectedLaufrichtung,
    required this.onSelected,
    this.focusOrderId,
    this.rotationFocus,
    super.key,
  });

  final bool readOnly;

  final double? focusOrderId;
  final NutzenlayoutLaufrichtung selectedLaufrichtung;
  final void Function(NutzenlayoutLaufrichtung) onSelected;
  final FocusNode? rotationFocus;
  @override
  State<NutzenlayoutLaufrichtungButton> createState() =>
      _NutzenlayoutLaufrichtungButtonState();
}

class _NutzenlayoutLaufrichtungButtonState
    extends State<NutzenlayoutLaufrichtungButton> {
  late final NextMenuController controller;
  late final FocusNode focusNode;
  Size? buttonSize;
  @override
  void initState() {
    super.initState();
    controller = NextMenuController();
    focusNode = widget.rotationFocus ?? FocusNode();
  }

  @override
  void dispose() {
    if (widget.rotationFocus == null) {
      focusNode.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final generalColors = context.appTheme.generalColors;
    final secondaryButtonStyles = context.appTheme.buttonStyles.secondary;

    final textFieldBorderColor =
        context.appTheme.textFieldProperties.borderColor;
    final primaryColor = context.appTheme.generalColors.primary;
    return NextMenuAnchor(
      alignmentOffset: const Offset(0, 5),
      controller: controller,
      childFocusNode: focusNode,
      onDismiss: () {},
      menuChildren: [
        SizedBox(
          width: buttonSize?.width ?? 200,
          child: _ButtonTile(
            laufrichtung: NutzenlayoutLaufrichtung.footForward,
            onSelected: widget.onSelected,
          ),
        ),
        SizedBox(
          width: buttonSize?.width ?? 200,
          child: _ButtonTile(
            laufrichtung: NutzenlayoutLaufrichtung.headForward,
            onSelected: widget.onSelected,
          ),
        ),
        SizedBox(
          width: buttonSize?.width ?? 200,
          child: _ButtonTile(
            laufrichtung: NutzenlayoutLaufrichtung.wordStartForward,
            onSelected: widget.onSelected,
          ),
        ),
        SizedBox(
          width: buttonSize?.width ?? 200,
          child: _ButtonTile(
            laufrichtung: NutzenlayoutLaufrichtung.wordEndForward,
            onSelected: widget.onSelected,
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
                  return Colors.transparent;
                },
              ),
              foregroundColor: WidgetStateProperty.resolveWith<Color>(
                (states) {
                  if (states.contains(WidgetState.disabled)) {
                    return secondaryButtonStyles.foregroundColorDisabled;
                  }
                  return secondaryButtonStyles.foregroundColor;
                },
              ),
              surfaceTintColor:
                  WidgetStateProperty.all(generalColors.transparent),
              overlayColor: WidgetStateProperty.all(
                primaryColor.withAppOpacity(0.1),
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
                  borderRadius: BorderRadius.circular(
                    context.appTheme.borderRadiuses.s,
                  ),
                ),
              ),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              side: WidgetStateProperty.resolveWith<BorderSide>(
                (states) {
                  return BorderSide(
                    color: textFieldBorderColor,
                  );
                },
              ),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Transform.rotate(
                    angle: widget.selectedLaufrichtung.angle * (math.pi / 180),
                    child: const ElbIcon(Icons.man),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      widget.selectedLaufrichtung.readable(l10n),
                      maxLines: 1,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                    ),
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

class _ButtonTile extends StatelessWidget {
  const _ButtonTile({
    required this.laufrichtung,
    required this.onSelected,
  });
  final NutzenlayoutLaufrichtung laufrichtung;
  final void Function(NutzenlayoutLaufrichtung) onSelected;

  @override
  Widget build(BuildContext context) {
    return NextMenuItemButton(
      onPressed: () {
        onSelected(laufrichtung);
      },
      leadingIcon: Padding(
        padding: const EdgeInsets.only(left: 4),
        child: Transform.rotate(
          angle: laufrichtung.angle * (math.pi / 180),
          child: const ElbIcon(Icons.man),
        ),
      ),
      child: Text(
        laufrichtung.readable(context.l10n),
      ),
    );
  }
}
