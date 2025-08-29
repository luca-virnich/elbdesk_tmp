//import 'package:coe_dateneingang/features/select_file/widgets/dashed_border.dart';
import 'package:desktop_drop/desktop_drop.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:elbdesk_ui/src/components/dashed_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// File drop area
///
/// A widget that allows users to drop files onto it or click on it to
/// select a file from the file system
class AppFileDropArea extends HookWidget {
  const AppFileDropArea({
    required this.icon,
    required this.onDragDone,
    required this.onPressed,
    super.key,
    this.isEnabled = true,
    this.height = 160.0,
    this.backgroundColor,
    this.foregroundColor,
    this.addTopPadding = false,
    this.title1,
    this.title2,
    this.subTitle,
    this.showDashedBorder = true,
    this.isLoading = false,
    this.compact = false,
    this.content,
  });

  final IconData icon;
  final bool isEnabled;
  final void Function(DropDoneDetails)? onDragDone;
  final VoidCallback? onPressed;
  final double height;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final bool addTopPadding;
  final String? title1;
  final String? title2;
  final String? subTitle;
  final bool showDashedBorder;
  final bool isLoading;
  final bool compact;
  final Widget? content;

  @override
  Widget build(BuildContext context) {
    final isDragHovered = useState<bool>(false);
    final isMouseHovered = useState<bool>(false);
    final generalColors = context.appTheme.generalColors;
    final borderRadiuses = context.appTheme.borderRadiuses;
    final textShadow = isMouseHovered.value
        ? [
            Shadow(
              color: Colors.black.withAppOpacity(0.1),
              blurRadius: 3,
              offset: const Offset(0, 1),
            ),
          ]
        : const <Shadow>[];

    return DropTarget(
      onDragDone: isLoading ? null : onDragDone,
      onDragEntered: (_) {
        if (isEnabled && !isLoading) {
          isDragHovered.value = true;
        }
      },
      onDragExited: (_) => isDragHovered.value = false,
      child:

          /// Mouse region to change cursor when hovering over the widget
          MouseRegion(
        cursor: isEnabled ? SystemMouseCursors.click : SystemMouseCursors.basic,
        onEnter: (_) {
          if (isEnabled && !isLoading) {
            isMouseHovered.value = true;
          }
        },
        onExit: (_) => isMouseHovered.value = false,
        child: GestureDetector(
          onTap: (isEnabled && !isLoading)
              ? () async {
                  if (onPressed != null && !isLoading) {
                    try {
                      await Future.sync(() => onPressed?.call());
                    } finally {
                      if (context.mounted) {
                        // Assuming isLoading is managed by the parent widget
                      }
                    }
                  }
                }
              : null,
          child: AnimatedContainer(
            duration: AnimationConstants.defaultDuration,
            curve: AnimationConstants.defaultCurve,
            height: height,
            child: AppContainer(
              isActive: isEnabled,
              isHovered: isDragHovered.value,
              backgroundColor: backgroundColor ??
                  generalColors.primarySurface.withAppOpacity(0.3),
              showBorder: !showDashedBorder,
              child: Padding(
                padding: EdgeInsets.zero,
                child:
                    // Shows the dashed border
                    DecoratedBox(
                  decoration: BoxDecoration(
                    border: !showDashedBorder
                        ? null
                        : DashedBorder.fromBorderSide(
                            dashLength: 6,
                            gap: 0.01,
                            borderSide: BorderSide(
                              color: isDragHovered.value
                                  ? generalColors.primary
                                  : generalColors.onBackground
                                      .withAppOpacity(0.3),
                              width: 2,
                            ),
                            borderRadius:
                                BorderRadius.circular(borderRadiuses.s),
                          ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(AppSpace.s),
                    child: SizedBox.expand(
                      child: Center(
                        // Scales the content if hovered over
                        child: content ??
                            _DropAreaContent(
                              addTopPadding: addTopPadding,
                              icon: icon,
                              isEnabled: isEnabled,
                              isDragHovered: isDragHovered,
                              isMouseHovered: isMouseHovered,
                              foregroundColor: foregroundColor,
                              textShadow: textShadow,
                              title1: title1,
                              title2: title2,
                              subTitle: subTitle,
                              isLoading: isLoading,
                              compact: compact,
                            ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DropAreaContent extends StatelessWidget {
  const _DropAreaContent({
    required this.addTopPadding,
    required this.icon,
    required this.isEnabled,
    required this.isDragHovered,
    required this.isMouseHovered,
    required this.foregroundColor,
    required this.textShadow,
    required this.title1,
    required this.title2,
    required this.subTitle,
    required this.isLoading,
    required this.compact,
  });

  final bool addTopPadding;
  final IconData icon;
  final bool isEnabled;
  final ValueNotifier<bool> isDragHovered;
  final ValueNotifier<bool> isMouseHovered;
  final Color? foregroundColor;
  final List<Shadow> textShadow;
  final String? title1;
  final String? title2;
  final String? subTitle;
  final bool isLoading;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final generalColors = context.appTheme.generalColors;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (addTopPadding) const SizedBox(height: AppSpace.xs),

        // Show either loading indicator or icon
        if (isLoading)
          // Loading indicator with same size as icon
          const SizedBox(
            height: AppSpace.xl,
            width: AppSpace.xl,
            child: AppLoadingIndicator(),
          )
        else
          ElbIcon(
            icon,
            size: AppIconSize.xl,
            color: !isEnabled
                ? generalColors.onBackground
                : isDragHovered.value
                    ? generalColors.primary
                    : null,
          ),
        SizedBox(height: compact ? AppSpace.s : AppSpace.m),

        // Text
        AnimatedDefaultTextStyle(
          duration: AnimationConstants.defaultDuration,
          style: TextStyle(shadows: textShadow),
          child: AppRichText(
            textAlign: TextAlign.center,
            children: [
              // Click to upload (Bold text)
              TextSpan(
                text: title1 ?? l10n.file_drop_click_to_upload,
                style: (compact
                        ? context.appTheme.textStyles.defaultText
                        : context.appTheme.textStyles.h3)
                    .copyWith(
                  fontWeight: FontWeight.bold,
                  color: !isEnabled
                      ? generalColors.onBackground.withAppOpacity(0.7)
                      : isDragHovered.value
                          ? generalColors.primary
                          : isMouseHovered.value
                              ? generalColors.onBackground
                              : foregroundColor ??
                                  generalColors.onBackground
                                      .withAppOpacity(0.9),
                ),
              ),

              const TextSpan(
                text: ' ',
              ),

              // Or drag and drop
              TextSpan(
                text: title2 ?? l10n.file_drop_or_drag_and_drop,
                style: (compact
                        ? context.appTheme.textStyles.defaultText
                        : context.appTheme.textStyles.h3)
                    .copyWith(
                  color: !isEnabled
                      ? generalColors.onBackground.withAppOpacity(0.7)
                      : isDragHovered.value
                          ? generalColors.primary
                          : isMouseHovered.value
                              ? generalColors.onBackground
                              : foregroundColor ?? generalColors.onBackground,
                ),
              ),
            ],
          ),
        ),

        // Subtitle
        if (subTitle != null) ...[
          const SizedBox(height: AppSpace.xs),
          AnimatedDefaultTextStyle(
            duration: AnimationConstants.defaultDuration,
            style: TextStyle(shadows: textShadow),
            child: Text(
              subTitle!,
              style: context.appTheme.textStyles.defaultText.copyWith(
                color: !isEnabled
                    ? generalColors.onBackground.withAppOpacity(0.7)
                    : isDragHovered.value
                        ? generalColors.primary
                        : isMouseHovered.value
                            ? generalColors.onBackground
                            : foregroundColor ?? generalColors.onBackground,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ],
    );
  }
}
