import 'package:auto_size_text/auto_size_text.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

/// A widget that displays the content of a button, which can include an icon,
/// a label, or a custom child widget.
///
/// The [AppButtonContent] widget is a stateless widget that displays the
/// content of a button. It can display an icon, a label, or a custom child
/// widget. The icon can be positioned in various ways relative to the label or
/// child widget.
///
/// {@tool snippet}
/// This example shows how to use [AppButtonContent] in a Flutter application:
///
/// ```dart
/// AppButtonContent(
///   autoSize: true,
///   isLoading: false,
///   color: Colors.blue,
///   iconData: Icons.save,
///   label: 'Save',
/// )
/// ```
/// {@end-tool}
///
/// See also:
///
///  * [AppIconButtonContent], which is used to display the icon and label.
///  * [AppText], which is used to display the label text.
class AppButtonContent extends StatelessWidget {
  /// Creates an [AppButtonContent] widget.
  ///
  /// The [autoSize], [isLoading], and [loadingIndicatorColor] parameters must
  /// not be null.
  const AppButtonContent({
    required this.autoSize,
    required this.isLoading,
    required this.foregroundColor,
    required this.foregroundColorDisabled,
    required this.foregroundColorOnHover,
    required this.loadingIndicatorColor,
    super.key,
    this.iconData,
    this.child,
    this.label,
    this.icon,
    this.iconPosition = AppButtonIconPosition.leftInside,
  });

  /// The icon data to display.
  final IconData? iconData;

  /// A custom child widget to display.
  final Widget? child;

  /// A custom icon widget to display.
  final Widget? icon;

  /// The label text to display.
  final String? label;

  /// The position of the icon relative to the label or child widget.
  final AppButtonIconPosition iconPosition;

  /// Whether the button content should auto-size.
  final bool autoSize;

  /// Whether the button is in a loading state.
  final bool isLoading;

  /// The color of the loading indicator.
  final Color loadingIndicatorColor;

  /// The foreground color of the button.
  final Color foregroundColor;
  final Color foregroundColorDisabled;
  final Color foregroundColorOnHover;

  @override
  Widget build(BuildContext context) {
    if (child != null) return child!;
    if (icon != null) {
      return AppIconButtonContent(
        // foregroundColor: foregroundColor,
        icon: icon!,
        iconPosition: iconPosition,
        label: label,
        autoSize: autoSize,
      );
    }
    if (iconData != null) {
      return AppIconButtonContent(
        // foregroundColor: foregroundColor,
        icon: isLoading
            ? const AppLoadingIndicator()
            : Icon(
                iconData,
                size: 20,
                color: null,
                // color: Colors.amber,
                // color: foregroundColor,
              ),
        iconPosition: iconPosition,
        label: label,
        autoSize: autoSize,
      );
    }

    return Stack(
      alignment: Alignment.center,
      children: [
        Opacity(
          opacity: isLoading ? 1 : 0,
          child: const AppLoadingIndicator(),
        ),
        // Opacity(
        //   opacity: isLoading ? 0 : 1,
        //   child: AppText(
        //     // label ?? '',
        //     'cool1',

        //     // color: foregroundColor,
        //     autoSize: autoSize,
        //     fontWeight: FontWeight.w500,
        //     maxLines: 1,
        //   ),
        // ),
        Opacity(
          opacity: isLoading ? 0 : 1,
          child: _AppButtonText(
            label: label ?? '',
            autoSize: autoSize,
          ),
        ),
      ],
    );
  }
}

/// A widget that displays an icon with an optional label or custom child
/// widget.
///
/// The [AppIconButtonContent] widget is a stateless widget that displays an
/// icon with an optional label or custom child widget. The icon can be
/// positioned in various ways relative to the label or child widget.
///
/// {@tool snippet}
/// This example shows how to use [AppIconButtonContent] in a Flutter
/// application:
///
/// ```dart
/// AppIconButtonContent(
///   icon: Icon(Icons.save),
///   iconPosition: AppButtonIconPosition.leftInside,
///   label: 'Save',
///   autoSize: true,
/// )
/// ```
/// {@end-tool}
///
/// See also:
///
///  * [AppButtonIconPosition], which defines the possible positions for the
/// icon.
///  * [AppText], which is used to display the label text.
class AppIconButtonContent extends StatelessWidget {
  /// Creates an [AppIconButtonContent] widget.
  ///
  /// The [icon], [iconPosition], and [autoSize] parameters must not be null.
  const AppIconButtonContent({
    required this.icon,
    required this.iconPosition,
    required this.autoSize,
    this.foregroundColor,
    super.key,
    this.child,
    this.label,
  });

  /// The icon widget to display.
  final Widget icon;

  /// A custom child widget to display.
  final Widget? child;

  /// The label text to display.
  final String? label;

  /// Whether the button content should auto-size.
  final bool autoSize;

  /// The position of the icon relative to the label or child widget.
  final AppButtonIconPosition iconPosition;

  /// The foreground color of the button.
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    switch (iconPosition) {
      case AppButtonIconPosition.leftInside:
        return (child == null && label == null)
            ? icon
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  icon,
                  const SizedBox(
                    width: AppSpace.s,
                  ),
                  Flexible(
                    flex: autoSize ? 1 : 0,
                    child: child ??
                        _AppButtonText(
                          label: label ?? '',
                          autoSize: autoSize,
                        ),
                  ),
                ],
              );
      case AppButtonIconPosition.rightInside:
        return (child == null && label == null)
            ? icon
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  child ??
                      _AppButtonText(
                        label: label ?? '',
                        autoSize: autoSize,
                      ),
                  const SizedBox(
                    width: AppSpace.s,
                  ),
                  icon,
                ],
              );
      case AppButtonIconPosition.leftOutside:
        return (child == null && label == null)
            ? icon
            : AppTripleRail(
                leading: icon,
                middle: child ??
                    _AppButtonText(
                      label: label ?? '',
                      autoSize: autoSize,
                    ),
              );
      case AppButtonIconPosition.rightOutside:
        return (child == null && label == null)
            ? icon
            : AppTripleRail(
                trailing: icon,
                middle: child ??
                    _AppButtonText(
                      label: label ?? '',
                      autoSize: autoSize,
                    ),
              );
      case AppButtonIconPosition.leftSpaceBetween:
        return (child == null && label == null)
            ? icon
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  icon,
                  child ??
                      _AppButtonText(
                        label: label ?? '',
                        autoSize: autoSize,
                      ),
                ],
              );
      case AppButtonIconPosition.rightSpaceBetween:
        return (child == null && label == null)
            ? icon
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  child ??
                      _AppButtonText(
                        label: label ?? '',
                        autoSize: autoSize,
                      ),
                  icon,
                ],
              );
    }
  }
}

class _AppButtonText extends StatelessWidget {
  const _AppButtonText({
    required this.label,
    required this.autoSize,
  });
  final String label;
  final bool autoSize;

  @override
  Widget build(BuildContext context) {
    if (autoSize) {
      return AutoSizeText(
        label,
        maxLines: 1,
        minFontSize: 15,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontWeight: FontWeight.w500),
      );
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: Text(
        label,
        maxLines: 1,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
