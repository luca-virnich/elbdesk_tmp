import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

/// A widget that represents a customizable window with optional title bar,
/// border, and shadow.
///
/// The [AppWindow] widget is used to create a window-like container with
/// various customization options such as title bar, border, shadow, and
/// content padding. It can be used to display content in a card-like format
/// with optional decorations.
///
/// {@tool snippet}
/// This example shows how to create an [AppWindow] with a title bar and custom
/// content:
///
/// ```dart
/// AppWindow(
///   titlebar: AppWindowTitlebar(
///     titleText: 'Window Title',
///     onClose: () {
///       // Handle close action
///     },
///   ),
///   child: Center(child: Text('Window Content')),
/// )
/// ```
/// {@end-tool}
///
/// See also:
///
///  * [AppWindowTitlebar], which is used to display the title bar.
///  * [Container], which is used to create the window's decoration.
class AppWindow extends StatelessWidget {
  /// Creates an [AppWindow].
  ///
  /// The [child] parameter must not be null.
  const AppWindow._({
    required this.child,
    this.onClose,
    this.titlebar,
    this.absorb = false,
    this.contentPadding,
    this.showBorder = false,
    this.showShadow = false,
    this.width,
    this.isLoading = false,
    this.height,
    this.backgroundColor,
  });

  /// Creates a fixed [AppWindow] with specified width and optional title bar.
  factory AppWindow.fixed({
    required Widget child,
    double width = 400,
    double? height,
    AppWindowTitlebar? titlebar,
    EdgeInsets? contentPadding,
    bool showBorder = true,
    bool showShadow = true,
    bool isLoading = false,
    VoidCallback? onClose,
    Color? backgroundColor,
  }) {
    return AppWindow._(
      width: width,
      height: height,
      titlebar: titlebar,
      contentPadding: contentPadding,
      showBorder: showBorder,
      showShadow: showShadow,
      onClose: onClose,
      isLoading: isLoading,
      backgroundColor: backgroundColor,
      child: child,
    );
  }

  /// Creates a floating [AppWindow] with specified width and optional title
  /// bar.
  factory AppWindow.floating({
    required Widget child,
    required bool absorb,
    double width = 400,
    double? height,
    EdgeInsets? contentPadding,
    bool isLoading = false,
  }) {
    return AppWindow._(
      width: width,
      absorb: absorb,
      height: height,
      contentPadding: contentPadding,
      showShadow: true,
      isLoading: isLoading,
      child: child,
    );
  }

  /// The primary content of the window.
  final Widget child;

  /// The callback to invoke when the close button is pressed.
  final VoidCallback? onClose;

  /// The widget to display as the title bar.
  final Widget? titlebar;

  /// The padding to apply to the content of the window.
  final EdgeInsets? contentPadding;

  /// Whether to remove the border of the window.
  final bool showBorder;

  /// Whether to show a shadow around the window.
  final bool showShadow;

  /// The width of the window.
  final double? width;

  /// The height of the window.
  final double? height;

  /// The background color of the window.
  final Color? backgroundColor;

  final bool absorb;

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final borderRadiuses = context.appTheme.borderRadiuses;
        final shadowColors = context.appTheme.shadows;
        final generalColors = context.appTheme.generalColors;
        return Container(
          width: width,
          height: height,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: backgroundColor ?? generalColors.background,
            borderRadius: BorderRadius.circular(borderRadiuses.m),
            boxShadow: !showShadow ? null : shadowColors.windowShadow,
            border: !showBorder
                ? null
                : Border.all(
                    color: generalColors.primarySurfaceBorder,
                    strokeAlign: BorderSide.strokeAlignOutside,
                  ),
          ),
          child: AppLoadingOverlay(
            isLoading: isLoading,
            barrierColor: generalColors.barrierColor,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: width != null
                  ? CrossAxisAlignment.stretch
                  : CrossAxisAlignment.center,
              children: [
                if (titlebar != null) titlebar!,
                Flexible(
                  child: AbsorbPointer(
                    absorbing: absorb,
                    child: Padding(
                      padding: contentPadding ??
                          const EdgeInsets.all(UiConstants.defaultPadding),
                      child: child,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
