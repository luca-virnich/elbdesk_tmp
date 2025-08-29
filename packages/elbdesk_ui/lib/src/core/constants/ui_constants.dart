import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

/// A class that holds constant values for various UI elements used in the
/// application.
///
/// This class provides static constants for border radii, padding, margins,
/// and sizes for buttons, cards, windows, tables, text fields, and layout
/// elements.
class UiConstants {
  /// Private constructor to prevent instantiation.
  const UiConstants._();

  /// The border radius for buttons (6 pixels).
  // static const double buttonBorderRadius = 4;
  // static const double textFieldBorderRadius = 2;

  // /// The border radius for image buttons (12 pixels).
  // static const double imageButtonBorderRadius = 12;

  /// The padding for buttons.
  ///
  /// This padding is applied horizontally (12 pixels) and vertically
  /// (5 pixels).
  static const EdgeInsets buttonPadding = EdgeInsets.symmetric(
    horizontal: 12,
    vertical: 0,
  );

  static const cardFieldPadding = EdgeInsets.symmetric(
    vertical: 4,
  );

  static const double tableCardToolbarPadding = 16;

  /// The height of buttons (32 pixels).
  static const double buttonHeight = 32;

  // /// The border radius for cards (8 pixels).
  // static const double cardBorderRadiusS = 8;

  // /// The border radius for cards (12 pixels).
  // static const double cardBorderRadiusM = 12;

  // /// The border radius for cards (16 pixels).
  // static const double cardBorderRadiusL = 16;

  // /// The border radius for cards (24 pixels).
  // static const double cardBorderRadiusXL = 24;

  /// The default padding (16 pixels).
  static const double defaultPadding = 16;

  /// The margin for elements (8 pixels).
  static const double elementMargin = 8;

  /// The margin for window screens (8 pixels).
  static const double windowScreenMargin = 8;

  // * Window sizes

  /// The height of the window title bar (36 pixels).
  static const double windowTitleBarHeight = 36;

  /// The space to the right of the window title bar icon (8 pixels).
  static const double windowTitleBarIconRightSpace = 8;

  // * Table sizes

  /// The extension size for table row items (32 pixels).
  static const double tableRowItemExtend = 32;

  /// The padding for table scroll (16 pixels).
  static const double tableScrollPadding = 16;

  // * TEXT FIELD

  // static const double textFieldHeight = 24;

  /// The height of the text field cursor (14 pixels).
  static const double textFieldCursorHeight = 14;

  /// The opacity for disabled elements (0.4).
  static const double disabledOpacity = 0.4;

  // * LAYOUT

  /// The spacing for spaced columns (12 pixels).
  static const double spacedColumnSpacing = 12;
  static const double twoColumnWrapVerticalSpacing = 4;
  static const double twoColumnWrapHorizontalSpacing = 24;

  /// The breakpoint width for the ELB card menu footer (568 pixels).
  static const double elbCardMenuFooterBreakpointWidth = 568;

  static const double dashoardStatusBarHeight = 26;
  static const double floatingWindowTaskBarHeight = 55;

  static const double responsiveDialogBreakpointWidth = 800;

  static const double leftLabelWidth = 140;
  static const double twoColumnWrapBreakpointWidth = 600;

  /// The breakpoint width for the [AppWindowTile] (600 pixels).
  static const double appWindowTileBreakpointWidth = 600;

  static const double defaultFontSize = 15;

  static const Size defaultTableCardMinSize = Size(750, 550);
  static const Size defaultTableCardPreferredSize = Size(1050, 700);
}
