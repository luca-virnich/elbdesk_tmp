import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:elbdesk_ui/src/ui/base/buttons/elb_base_button.dart';
import 'package:flutter/material.dart';

// Constants
const double _kButtonIconSize = 20;
const double _kButtonIconSpacing = 8;
const double _kOverlayOpacityPressed = 0.2;
const double _kOverlayOpacityHover = 0.08;
const double _kLabelBottomPadding = 2;
const double _kDefaultHorizontalPadding = 12;
const double _kCheckboxLeftPadding = 8;
const double _kCheckboxRightPadding = 16;

/// Represents the visual state of a button.

/// Defines the visual style variants for CustomButton.
enum ElbButtonType {
  primary,
  secondary,
  text,
  outline,
  danger,
  dangerText,
  blank,
  checkbox,
}

/// A customizable button widget that provides a clean API without Material
/// widget dependencies.
///
/// This button supports multiple style variants (primary, secondary, text,
/// etc.) and features like icons, loading states, and custom styling while
/// maintaining full accessibility.
///
/// Example:
/// ```dart
/// CustomButton.primary(
///   onPressed: () => print('Clicked'),
///   label: 'Click me',
///   iconData: Icons.add,
/// )
/// ```
class ElbButton extends StatelessWidget {
  const ElbButton._({
    required this.type,
    this.onPressed,
    this.onSelected,
    this.label,
    this.child,
    this.icon,
    this.iconData,
    this.iconPosition = AppButtonIconPosition.leftInside,
    this.isLoading = false,
    this.focusNode,
    this.tooltip,
    this.padding = const EdgeInsets.symmetric(
      horizontal: _kDefaultHorizontalPadding,
    ),
    this.borderRadius,
    this.foregroundColor,
    this.borderColor,
    this.borderColorOnHover,
    this.overlayColor,
    this.expand = false,
    this.showLeftBorder = true,
    this.showRightBorder = true,
    this.buttonHeight,
    this.isSelected,
    super.key,
  })  : assert(
          icon == null || iconData == null,
          'Cannot provide both icon and iconData',
        ),
        assert(
          label != null || tooltip != null || child != null,
          'Either label, tooltip, or child must be provided',
        );

  /// Creates a primary style button with prominent styling.
  factory ElbButton.primary({
    required VoidCallback? onPressed,
    String? label,
    Widget? child,
    Widget? icon,
    IconData? iconData,
    AppButtonIconPosition iconPosition = AppButtonIconPosition.leftInside,
    bool isLoading = false,
    FocusNode? focusNode,
    String? tooltip,
    EdgeInsetsGeometry? padding,
    double? borderRadius,
    bool expand = false,
    bool showLeftBorder = true,
    bool showRightBorder = true,
    double? buttonHeight,
    Key? key,
  }) =>
      ElbButton._(
        key: key,
        onPressed: onPressed,
        label: label,
        type: ElbButtonType.primary,
        icon: icon,
        iconData: iconData,
        iconPosition: iconPosition,
        isLoading: isLoading,
        focusNode: focusNode,
        tooltip: tooltip,
        padding: padding ??
            const EdgeInsets.symmetric(horizontal: _kDefaultHorizontalPadding),
        borderRadius: borderRadius,
        expand: expand,
        showLeftBorder: showLeftBorder,
        showRightBorder: showRightBorder,
        buttonHeight: buttonHeight,
        child: child,
      );

  /// Creates a secondary style button with subtle styling.
  factory ElbButton.secondary({
    required VoidCallback? onPressed,
    String? label,
    Widget? child,
    Widget? icon,
    IconData? iconData,
    AppButtonIconPosition iconPosition = AppButtonIconPosition.leftInside,
    bool isLoading = false,
    FocusNode? focusNode,
    String? tooltip,
    EdgeInsetsGeometry? padding,
    double? borderRadius,
    bool expand = false,
    bool showLeftBorder = true,
    bool showRightBorder = true,
    double? buttonHeight,
    Key? key,
  }) =>
      ElbButton._(
        key: key,
        onPressed: onPressed,
        label: label,
        type: ElbButtonType.secondary,
        icon: icon,
        iconData: iconData,
        iconPosition: iconPosition,
        isLoading: isLoading,
        focusNode: focusNode,
        tooltip: tooltip,
        padding: padding ??
            const EdgeInsets.symmetric(horizontal: _kDefaultHorizontalPadding),
        borderRadius: borderRadius,
        expand: expand,
        showLeftBorder: showLeftBorder,
        showRightBorder: showRightBorder,
        buttonHeight: buttonHeight,
        child: child,
      );

  /// Creates a text-only button with minimal styling.
  factory ElbButton.text({
    required VoidCallback? onPressed,
    String? label,
    Widget? child,
    Widget? icon,
    IconData? iconData,
    AppButtonIconPosition iconPosition = AppButtonIconPosition.leftInside,
    bool isLoading = false,
    FocusNode? focusNode,
    String? tooltip,
    EdgeInsetsGeometry? padding,
    double? borderRadius,
    Color? color,
    bool expand = false,
    bool showLeftBorder = true,
    bool showRightBorder = true,
    double? buttonHeight,
    Key? key,
  }) =>
      ElbButton._(
        key: key,
        onPressed: onPressed,
        label: label,
        type: ElbButtonType.text,
        icon: icon,
        iconData: iconData,
        iconPosition: iconPosition,
        isLoading: isLoading,
        focusNode: focusNode,
        tooltip: tooltip,
        padding: padding ??
            const EdgeInsets.symmetric(horizontal: _kDefaultHorizontalPadding),
        borderRadius: borderRadius,
        foregroundColor: color,
        expand: expand,
        showLeftBorder: showLeftBorder,
        showRightBorder: showRightBorder,
        buttonHeight: buttonHeight,
        child: child,
      );

  /// Creates an outlined button with customizable border.
  factory ElbButton.outline({
    required VoidCallback? onPressed,
    String? label,
    Widget? child,
    Widget? icon,
    IconData? iconData,
    AppButtonIconPosition iconPosition = AppButtonIconPosition.leftInside,
    bool isLoading = false,
    FocusNode? focusNode,
    String? tooltip,
    EdgeInsetsGeometry? padding,
    double? borderRadius,
    Color? color,
    Color? borderColor,
    Color? borderColorOnHover,
    Color? overlayColor,
    bool expand = false,
    bool showLeftBorder = true,
    bool showRightBorder = true,
    double? buttonHeight,
    Key? key,
  }) =>
      ElbButton._(
        key: key,
        onPressed: onPressed,
        label: label,
        type: ElbButtonType.outline,
        icon: icon,
        iconData: iconData,
        iconPosition: iconPosition,
        isLoading: isLoading,
        focusNode: focusNode,
        tooltip: tooltip,
        padding: padding ??
            const EdgeInsets.symmetric(horizontal: _kDefaultHorizontalPadding),
        borderRadius: borderRadius,
        foregroundColor: color,
        borderColor: borderColor,
        borderColorOnHover: borderColorOnHover,
        overlayColor: overlayColor,
        expand: expand,
        showLeftBorder: showLeftBorder,
        showRightBorder: showRightBorder,
        buttonHeight: buttonHeight,
        child: child,
      );

  /// Creates a danger/destructive action button.
  factory ElbButton.danger({
    required VoidCallback? onPressed,
    String? label,
    Widget? child,
    Widget? icon,
    IconData? iconData,
    AppButtonIconPosition iconPosition = AppButtonIconPosition.leftInside,
    bool isLoading = false,
    FocusNode? focusNode,
    String? tooltip,
    EdgeInsetsGeometry? padding,
    double? borderRadius,
    bool expand = false,
    bool showLeftBorder = true,
    bool showRightBorder = true,
    double? buttonHeight,
    Key? key,
  }) =>
      ElbButton._(
        key: key,
        onPressed: onPressed,
        label: label,
        type: ElbButtonType.danger,
        icon: icon,
        iconData: iconData,
        iconPosition: iconPosition,
        isLoading: isLoading,
        focusNode: focusNode,
        tooltip: tooltip,
        padding: padding ??
            const EdgeInsets.symmetric(horizontal: _kDefaultHorizontalPadding),
        borderRadius: borderRadius,
        expand: expand,
        showLeftBorder: showLeftBorder,
        showRightBorder: showRightBorder,
        buttonHeight: buttonHeight,
        child: child,
      );

  /// Creates a danger text button for destructive actions.
  factory ElbButton.dangerText({
    required VoidCallback? onPressed,
    String? label,
    Widget? child,
    Widget? icon,
    IconData? iconData,
    AppButtonIconPosition iconPosition = AppButtonIconPosition.leftInside,
    bool isLoading = false,
    FocusNode? focusNode,
    String? tooltip,
    EdgeInsetsGeometry? padding,
    double? borderRadius,
    bool expand = false,
    bool showLeftBorder = true,
    bool showRightBorder = true,
    double? buttonHeight,
    Key? key,
  }) =>
      ElbButton._(
        key: key,
        onPressed: onPressed,
        label: label,
        type: ElbButtonType.dangerText,
        icon: icon,
        iconData: iconData,
        iconPosition: iconPosition,
        isLoading: isLoading,
        focusNode: focusNode,
        tooltip: tooltip,
        padding: padding ??
            const EdgeInsets.symmetric(horizontal: _kDefaultHorizontalPadding),
        borderRadius: borderRadius,
        expand: expand,
        showLeftBorder: showLeftBorder,
        showRightBorder: showRightBorder,
        buttonHeight: buttonHeight,
        child: child,
      );

  /// Creates a minimal button with no background.
  factory ElbButton.blank({
    required VoidCallback? onPressed,
    String? label,
    Widget? child,
    Widget? icon,
    IconData? iconData,
    AppButtonIconPosition iconPosition = AppButtonIconPosition.leftInside,
    bool isLoading = false,
    FocusNode? focusNode,
    String? tooltip,
    EdgeInsetsGeometry? padding,
    double? borderRadius,
    Color? color,
    bool expand = false,
    bool showLeftBorder = false,
    bool showRightBorder = false,
    double? buttonHeight,
    Key? key,
  }) =>
      ElbButton._(
        key: key,
        onPressed: onPressed,
        label: label,
        type: ElbButtonType.blank,
        icon: icon,
        iconData: iconData,
        iconPosition: iconPosition,
        isLoading: isLoading,
        focusNode: focusNode,
        tooltip: tooltip,
        padding: padding ?? EdgeInsets.zero,
        borderRadius: borderRadius,
        foregroundColor: color,
        expand: expand,
        showLeftBorder: showLeftBorder,
        showRightBorder: showRightBorder,
        buttonHeight: buttonHeight,
        child: child,
      );

  /// Creates a checkbox-style button.
  factory ElbButton.checkbox({
    required bool isSelected,
    required void Function(bool) onSelected,
    required String label,
    Widget? child,
    Color? color,
    FocusNode? focusNode,
    bool isLoading = false,
    String? tooltip,
    double? borderRadius,
    Color? borderColor,
    Color? borderColorOnHover,
    Color? overlayColor,
    bool expand = false,
    double? buttonHeight,
    Key? key,
  }) =>
      ElbButton._(
        key: key,
        onPressed: () => onSelected(!isSelected),
        onSelected: onSelected,
        label: label,
        type: ElbButtonType.checkbox,
        icon: ExcludeFocusTraversal(
          child: AppCheckbox(
            value: isSelected,
            onChanged: onSelected,
            disableSplash: true,
          ),
        ),
        iconPosition: AppButtonIconPosition.leftInside,
        isLoading: isLoading,
        focusNode: focusNode,
        tooltip: tooltip,
        padding: const EdgeInsets.only(
          left: _kCheckboxLeftPadding,
          right: _kCheckboxRightPadding,
        ),
        borderRadius: borderRadius,
        foregroundColor: color,
        borderColor: borderColor,
        borderColorOnHover: borderColorOnHover,
        overlayColor: overlayColor,
        expand: expand,
        showLeftBorder: true,
        showRightBorder: true,
        buttonHeight: buttonHeight,
        isSelected: isSelected,
        child: child,
      );

  final VoidCallback? onPressed;
  final void Function(bool)? onSelected;
  final String? label;
  final Widget? child;
  final Widget? icon;
  final IconData? iconData;
  final AppButtonIconPosition iconPosition;
  final bool isLoading;
  final FocusNode? focusNode;
  final String? tooltip;
  final EdgeInsetsGeometry padding;
  final double? borderRadius;
  final ElbButtonType type;
  final Color? foregroundColor;
  final Color? borderColor;
  final Color? borderColorOnHover;
  final Color? overlayColor;
  final bool expand;
  final bool showLeftBorder;
  final bool showRightBorder;
  final double? buttonHeight;
  final bool? isSelected;

  Widget _buildButtonContent(BuildContext context, Color foregroundColor) {
    // Handle custom child
    if (child != null) {
      return child!;
    }

    final iconWidget = isLoading
        ? const AppLoadingIndicator()
        : (icon != null || iconData != null)
            ? IconTheme.merge(
                data: IconThemeData(
                  color: foregroundColor,
                  size: _kButtonIconSize,
                ),
                child: icon ??
                    Icon(
                      iconData,
                      size: _kButtonIconSize,
                    ),
              )
            : null;

    final labelWidget = label != null
        ? Padding(
            padding: const EdgeInsets.only(bottom: _kLabelBottomPadding),
            child: Text(
              label!,
              style: context.appTheme.textStyles.defaultText.copyWith(
                color: foregroundColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        : null;

    // If no label, just show icon
    if (labelWidget == null) {
      return iconWidget ?? const SizedBox.shrink();
    }

    // If no icon, just show label
    if (iconWidget == null) {
      return labelWidget;
    }

    // Handle different icon positions
    switch (iconPosition) {
      case AppButtonIconPosition.leftInside:
        return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            iconWidget,
            const SizedBox(width: _kButtonIconSpacing),
            if (expand) Expanded(child: labelWidget) else labelWidget,
          ],
        );
      case AppButtonIconPosition.rightInside:
        return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (expand) Expanded(child: labelWidget) else labelWidget,
            const SizedBox(width: _kButtonIconSpacing),
            iconWidget,
          ],
        );
      case AppButtonIconPosition.leftSpaceBetween:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            iconWidget,
            labelWidget,
          ],
        );
      case AppButtonIconPosition.rightSpaceBetween:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            labelWidget,
            iconWidget,
          ],
        );
      case AppButtonIconPosition.leftOutside:
        return AppTripleRail(
          leading: iconWidget,
          middle: labelWidget,
        );
      case AppButtonIconPosition.rightOutside:
        return AppTripleRail(
          trailing: iconWidget,
          middle: labelWidget,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final buttonStyle = switch (type) {
      ElbButtonType.primary => theme.buttonStyles.primary,
      ElbButtonType.secondary => theme.buttonStyles.secondary,
      ElbButtonType.text => theme.buttonStyles.text,
      ElbButtonType.outline => theme.buttonStyles.outline,
      ElbButtonType.danger => theme.buttonStyles.danger,
      ElbButtonType.dangerText => theme.buttonStyles.dangerText,
      ElbButtonType.blank => theme.buttonStyles.blank,
      ElbButtonType.checkbox => theme.buttonStyles.checkbox,
    };

    final effectiveBorderRadius = borderRadius ?? buttonStyle.borderRadius;

    // Calculate effective height
    final effectiveHeight = buttonHeight ?? UiConstants.buttonHeight;

    // Calculate overlay colors with proper opacity
    final overlayColorHover = type == ElbButtonType.blank
        ? buttonStyle.overlayColor
        : Color.alphaBlend(
            (overlayColor ?? buttonStyle.overlayColor)
                .withValues(alpha: _kOverlayOpacityHover),
            buttonStyle.backgroundColor,
          );

    final overlayColorPressed = Color.alphaBlend(
      (overlayColor ?? buttonStyle.overlayColor)
          .withValues(alpha: _kOverlayOpacityPressed),
      buttonStyle.backgroundColor,
    );

    // Handle checkbox selected state border color
    final effectiveBorderColor =
        (type == ElbButtonType.checkbox && (isSelected ?? false))
            ? buttonStyle.borderColorOnHover
            : borderColor ?? buttonStyle.borderColor;

    // Determine the effective foreground color based on disabled state
    final isDisabled = onPressed == null || isLoading;
    final effectiveForegroundColor = isDisabled
        ? buttonStyle.foregroundColorDisabled
        : foregroundColor ?? buttonStyle.foregroundColor;

    // Build the child content with proper styling
    final buttonChild = expand
        ? Align(
            alignment: type == ElbButtonType.checkbox
                ? Alignment.centerLeft
                : Alignment.center,
            child: isLoading && label == null
                ? const Center(
                    child: AppLoadingIndicator(),
                  )
                : _buildButtonContent(
                    context,
                    effectiveForegroundColor,
                  ),
          )
        : Center(
            child: isLoading && label == null
                ? const AppLoadingIndicator()
                : _buildButtonContent(
                    context,
                    effectiveForegroundColor,
                  ),
          );
    final effectiveExpand = switch (iconPosition) {
      AppButtonIconPosition.leftOutside ||
      AppButtonIconPosition.leftSpaceBetween ||
      AppButtonIconPosition.rightOutside ||
      AppButtonIconPosition.rightSpaceBetween =>
        true,
      _ => expand,
    };
    // Use ElbBaseButton with resolved colors
    return ElbBaseButton(
      onPressed: onPressed,
      isLoading: isLoading,
      focusNode: focusNode,
      tooltip: tooltip ?? label,
      padding: padding,
      borderRadius: effectiveBorderRadius,
      showLeftBorder: showLeftBorder,
      showRightBorder: showRightBorder,
      buttonHeight: effectiveHeight,
      backgroundColor: buttonStyle.backgroundColor,
      backgroundColorDisabled: buttonStyle.backgroundColorDisabled,
      backgroundColorOnHover: overlayColorHover,
      foregroundColor: foregroundColor ?? buttonStyle.foregroundColor,
      foregroundColorDisabled: buttonStyle.foregroundColorDisabled,
      foregroundColorOnHover: buttonStyle.foregroundColorOnHover,
      borderColor: effectiveBorderColor,
      borderColorDisabled: buttonStyle.borderColorDisabled,
      borderColorOnHover: borderColorOnHover ?? buttonStyle.borderColorOnHover,
      overlayColor: overlayColorHover,
      overlayColorPressed: overlayColorPressed,
      expand: effectiveExpand,
      child: buttonChild,
    );
  }
}
