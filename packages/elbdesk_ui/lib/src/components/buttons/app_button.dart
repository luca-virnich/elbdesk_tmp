import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:elbdesk_ui/src/ui/base/buttons/elb_button.dart';
import 'package:flutter/material.dart';

part 'segmented_app_button.dart';

/// Defines the types of buttons available in the application.
enum AppButtonType {
  primary,
  secondary,
  text,
  danger,
  blank,
  outline,
  dangerText,
  checkbox
}

/// A customizable button widget that supports various styles and
/// configurations.
class AppButton extends StatelessWidget {
  /// Creates a button with the specified properties.
  const AppButton._({
    required this.onPressed,
    required AppButtonType type,
    required this.focusNode,
    super.key,
    this.tooltip,
    this.child,
    this.iconPosition = AppButtonIconPosition.leftInside,
    this.isLoading = false,
    this.label,
    this.icon,
    this.buttonHeight,
    this.iconData,
    this.foregroundColor,
    this.foregroundColorOnHover,
    this.expand = false,
    this.borderRadius,
    this.showLeftBorder = true,
    this.showRightBorder = true,
    this.borderColor,
    this.borderColorOnHover,
    this.overlayColor,
    this.isSelected,
  })  : _type = type,
        assert(
          tooltip != null || label != null,
          'Either tooltip or label must be provided. Both cannot be null.',
        );

  /// Creates a primary style button.
  const AppButton.primary({
    required VoidCallback? onPressed,
    Key? key,
    IconData? iconData,
    AppButtonIconPosition iconPosition = AppButtonIconPosition.leftInside,
    Widget? child,
    String? label,
    Widget? icon,
    FocusNode? focusNode,
    // bool autoSize = false,
    bool isLoading = false,
    String? tooltip,
    BorderRadius? borderRadius,
    bool showLeftBorder = true,
    bool showRightBorder = true,
    bool expand = false,
  }) : this._(
          key: key,
          onPressed: onPressed,
          focusNode: focusNode,
          icon: icon,
          type: AppButtonType.primary,
          iconData: iconData,
          expand: expand,
          iconPosition: iconPosition,
          child: child,
          label: label,
          isLoading: isLoading,
          tooltip: tooltip,
          borderRadius: borderRadius,
          showLeftBorder: showLeftBorder,
          showRightBorder: showRightBorder,
          isSelected: null,
        );

  /// Creates a secondary style button.
  const AppButton.secondary({
    required VoidCallback? onPressed,
    Key? key,
    IconData? iconData,
    AppButtonIconPosition iconPosition = AppButtonIconPosition.leftInside,
    Widget? child,
    FocusNode? focusNode,
    Widget? icon,
    String? label,
    // bool autoSize = false,
    bool expand = false,
    bool isLoading = false,
    String? tooltip,
    BorderRadius? borderRadius,
    bool showLeftBorder = true,
    bool showRightBorder = true,
  }) : this._(
          key: key,
          onPressed: onPressed,
          focusNode: focusNode,
          expand: expand,
          icon: icon,
          type: AppButtonType.secondary,
          iconData: iconData,
          iconPosition: iconPosition,
          child: child,
          label: label,
          isLoading: isLoading,
          tooltip: tooltip,
          borderRadius: borderRadius,
          showLeftBorder: showLeftBorder,
          showRightBorder: showRightBorder,
          isSelected: null,
        );

  const AppButton.outline({
    required VoidCallback? onPressed,
    Key? key,
    IconData? iconData,
    AppButtonIconPosition iconPosition = AppButtonIconPosition.leftInside,
    Widget? child,
    Color? color,
    FocusNode? focusNode,
    Widget? icon,
    String? label,
    // bool autoSize = false,
    bool isLoading = false,
    String? tooltip,
    BorderRadius? borderRadius,
    bool showLeftBorder = true,
    bool showRightBorder = true,
    Color? foregroundColorOnHover,
    Color? borderColor,
    Color? borderColorOnHover,
    Color? overlayColor,
    bool expand = false,
  }) : this._(
          key: key,
          onPressed: onPressed,
          focusNode: focusNode,
          expand: expand,
          icon: icon,
          foregroundColor: color,
          foregroundColorOnHover: foregroundColorOnHover,
          borderColor: borderColor,
          borderColorOnHover: borderColorOnHover,
          overlayColor: overlayColor,
          type: AppButtonType.outline,
          iconData: iconData,
          iconPosition: iconPosition,
          child: child,
          label: label,
          isLoading: isLoading,
          tooltip: tooltip,
          borderRadius: borderRadius,
          showLeftBorder: showLeftBorder,
          showRightBorder: showRightBorder,
          isSelected: null,
        );

  /// Creates a text style button.
  const AppButton.text({
    required VoidCallback? onPressed,
    Key? key,
    IconData? iconData,
    AppButtonIconPosition iconPosition = AppButtonIconPosition.leftInside,
    Widget? child,
    String? label,
    FocusNode? focusNode,
    // bool autoSize = false,
    Widget? icon,
    bool isLoading = false,
    String? tooltip,
    BorderRadius? borderRadius,
    Color? color,
    bool showLeftBorder = true,
    bool showRightBorder = true,
    bool expand = false,
  }) : this._(
          key: key,
          onPressed: onPressed,
          focusNode: focusNode,
          expand: expand,
          type: AppButtonType.text,
          foregroundColor: color,
          icon: icon,
          iconData: iconData,
          iconPosition: iconPosition,
          child: child,
          label: label,
          isLoading: isLoading,
          tooltip: tooltip,
          borderRadius: borderRadius,
          showLeftBorder: showLeftBorder,
          showRightBorder: showRightBorder,
          isSelected: null,
        );

  /// Creates a blank style button.
  const AppButton.blank({
    required VoidCallback? onPressed,
    Key? key,
    AppButtonIconPosition iconPosition = AppButtonIconPosition.leftInside,
    Widget? child,
    String? label,
    FocusNode? focusNode,
    double? buttonHeight,

    // bool autoSize = false,
    Color? color,
    String? tooltip,
    BorderRadius? borderRadius,
    bool showLeftBorder = false,
    IconData? iconData,
    bool showRightBorder = false,
    bool isLoading = false,
    bool expand = false,
  }) : this._(
          key: key,
          onPressed: onPressed,
          focusNode: focusNode,
          type: AppButtonType.blank,
          expand: expand,
          iconPosition: iconPosition,
          iconData: iconData,
          child: child,
          label: label,
          foregroundColor: color,
          buttonHeight: buttonHeight,
          tooltip: tooltip,
          borderRadius: borderRadius,
          showLeftBorder: showLeftBorder,
          showRightBorder: showRightBorder,
          isLoading: isLoading,
          isSelected: null,
        );

  /// Creates a danger style button.
  const AppButton.danger({
    required VoidCallback? onPressed,
    Key? key,
    IconData? iconData,
    AppButtonIconPosition iconPosition = AppButtonIconPosition.leftInside,
    Widget? child,
    String? label,
    Widget? icon,
    bool autoSize = false,
    FocusNode? focusNode,
    bool isLoading = false,
    String? tooltip,
    BorderRadius? borderRadius,
    bool showLeftBorder = true,
    bool showRightBorder = true,
    bool expand = false,
  }) : this._(
          key: key,
          onPressed: onPressed,
          focusNode: focusNode,
          expand: expand,
          type: AppButtonType.danger,
          icon: icon,
          iconData: iconData,
          iconPosition: iconPosition,
          child: child,
          label: label,
          isLoading: isLoading,
          tooltip: tooltip,
          borderRadius: borderRadius,
          showLeftBorder: showLeftBorder,
          showRightBorder: showRightBorder,
          isSelected: null,
        );

  const AppButton.dangerText({
    required VoidCallback? onPressed,
    Key? key,
    IconData? iconData,
    AppButtonIconPosition iconPosition = AppButtonIconPosition.leftInside,
    Widget? child,
    String? label,
    Widget? icon,
    // bool autoSize = false,
    FocusNode? focusNode,
    bool isLoading = false,
    String? tooltip,
    BorderRadius? borderRadius,
    bool showLeftBorder = true,
    bool showRightBorder = true,
    bool expand = false,
  }) : this._(
          key: key,
          onPressed: onPressed,
          focusNode: focusNode,
          expand: expand,
          type: AppButtonType.dangerText,
          icon: icon,
          iconData: iconData,
          iconPosition: iconPosition,
          child: child,
          label: label,
          isLoading: isLoading,
          tooltip: tooltip,
          borderRadius: borderRadius,
          showLeftBorder: showLeftBorder,
          showRightBorder: showRightBorder,
          isSelected: null,
        );

  AppButton.checkbox({
    required bool isSelected,
    required void Function(bool) onSelected,
    required String label,
    Key? key,
    Widget? child,
    Color? color,
    FocusNode? focusNode,
    // bool autoSize = false,
    bool isLoading = false,
    String? tooltip,
    BorderRadius? borderRadius,
    Color? foregroundColorOnHover,
    Color? borderColor,
    Color? borderColorOnHover,
    Color? overlayColor,
    bool expand = false,
  }) : this._(
          key: key,
          onPressed: () => onSelected(!isSelected),
          focusNode: focusNode,
          expand: expand,
          icon: ExcludeFocusTraversal(
            child: AppCheckbox(
              value: isSelected,
              onChanged: onSelected,
              disableSplash: true,
            ),
          ),
          foregroundColor: color,
          foregroundColorOnHover: foregroundColorOnHover,
          borderColor: borderColor,
          borderColorOnHover: borderColorOnHover,
          overlayColor: overlayColor,
          type: AppButtonType.checkbox,
          iconData: null,
          iconPosition: AppButtonIconPosition.leftInside,
          child: child,
          label: label,
          isLoading: isLoading,
          tooltip: tooltip,
          borderRadius: borderRadius,
          showLeftBorder: true,
          showRightBorder: true,
          isSelected: isSelected,
        );

  /// The tooltip text to display when the button is long-pressed.
  final String? tooltip;

  /// The callback function that is called when the button is pressed.
  final VoidCallback? onPressed;

  /// Whether the button is in a loading state.
  final bool isLoading;

  /// The child widget to display inside the button.
  final Widget? child;

  /// The label text to display inside the button.
  final String? label;

  /// The position of the icon inside the button.
  final AppButtonIconPosition iconPosition;

  /// The icon data to display inside the button.
  final IconData? iconData;

  /// The icon widget to display inside the button.
  final Widget? icon;

  /// The type of the button.
  final AppButtonType _type;

  /// The focus node for the button.
  final FocusNode? focusNode;

  /// The foreground color of the button.
  final Color? foregroundColor;

  /// The foreground color of the button when hovered.
  final Color? foregroundColorOnHover;

  /// The height of the button.
  final double? buttonHeight;

  /// Whether the button should auto-size.
  final bool expand;

  /// The border radius of the button.
  final BorderRadius? borderRadius;

  /// Whether to show the left border of the button.
  final bool showLeftBorder;

  /// Whether to show the right border of the button.
  final bool showRightBorder;

  final Color? borderColor;

  final Color? borderColorOnHover;

  final Color? overlayColor;

  final bool? isSelected;

  @override
  Widget build(BuildContext context) {
    return switch (_type) {
      AppButtonType.checkbox => ElbButton.checkbox(
          isSelected: isSelected ?? false,
          onSelected: (v) => onPressed?.call(),
          label: label!,
          tooltip: tooltip,
          // foregroundColorOnHover: foregroundColorOnHover,
          borderColor: borderColor,
          borderColorOnHover: borderColorOnHover,
          overlayColor: overlayColor,
          child: child,
        ),
      AppButtonType.primary => ElbButton.primary(
          isLoading: isLoading,
          onPressed: onPressed,
          label: label,
          tooltip: tooltip,
          icon: icon,
          iconData: iconData,
          iconPosition: iconPosition,
          buttonHeight: buttonHeight,
          expand: expand,
          showLeftBorder: showLeftBorder,
          showRightBorder: showRightBorder,
          child: child,
        ),
      AppButtonType.secondary => ElbButton.secondary(
          isLoading: isLoading,
          onPressed: onPressed,
          label: label,
          tooltip: tooltip,
          icon: icon,
          iconData: iconData,
          iconPosition: iconPosition,
          buttonHeight: buttonHeight,
          expand: expand,
          showLeftBorder: showLeftBorder,
          showRightBorder: showRightBorder,
          child: child,
        ),
      AppButtonType.text => ElbButton.text(
          isLoading: isLoading,
          onPressed: onPressed,
          label: label,
          tooltip: tooltip,
          icon: icon,
          iconData: iconData,
          iconPosition: iconPosition,
          buttonHeight: buttonHeight,
          expand: expand,
          showLeftBorder: showLeftBorder,
          showRightBorder: showRightBorder,
          child: child,
        ),
      AppButtonType.danger => ElbButton.danger(
          isLoading: isLoading,
          onPressed: onPressed,
          label: label,
          tooltip: tooltip,
          icon: icon,
          iconData: iconData,
          iconPosition: iconPosition,
          buttonHeight: buttonHeight,
          expand: expand,
          showLeftBorder: showLeftBorder,
          showRightBorder: showRightBorder,
          child: child,
        ),
      AppButtonType.dangerText => ElbButton.dangerText(
          isLoading: isLoading,
          onPressed: onPressed,
          label: label,
          tooltip: tooltip,
          icon: icon,
          iconData: iconData,
          iconPosition: iconPosition,
          buttonHeight: buttonHeight,
          expand: expand,
          showLeftBorder: showLeftBorder,
          showRightBorder: showRightBorder,
          child: child,
        ),
      AppButtonType.blank => ElbButton.blank(
          isLoading: isLoading,
          onPressed: onPressed,
          label: label,
          tooltip: tooltip,
          icon: icon,
          iconData: iconData,
          iconPosition: iconPosition,
          buttonHeight: buttonHeight,
          expand: expand,
          showLeftBorder: showLeftBorder,
          showRightBorder: showRightBorder,
          child: child,
        ),
      AppButtonType.outline => ElbButton.outline(
          isLoading: isLoading,
          onPressed: onPressed,
          label: label,
          tooltip: tooltip,
          icon: icon,
          iconData: iconData,
          iconPosition: iconPosition,
          buttonHeight: buttonHeight,
          expand: expand,
          showLeftBorder: showLeftBorder,
          showRightBorder: showRightBorder,
          child: child,
        ),
    };
  }
}

/// A button widget with customizable properties.

/// A custom border that adds a left and right border.

/// A widget that displays an icon inside a button.
class AppButtonIconData extends StatelessWidget {
  /// Creates an icon widget with the specified icon data.
  const AppButtonIconData({required this.iconData, super.key});

  /// The icon data to display inside the button.
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Icon(
      iconData,
      size: 20,
    );
  }
}
