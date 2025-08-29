import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:elbdesk_ui/src/components/buttons/_export_buttons.dart';
import 'package:elbdesk_ui/src/components/buttons/app_button.dart';
import 'package:elbdesk_ui/src/components/buttons/widgets/app_button_contents.dart';

/// Defines the possible positions for an icon relative to the label or child
/// widget in a button.
///
/// The [AppButtonIconPosition] enum is used to specify the position of an icon
/// in a button. It provides several options for positioning the icon inside or
/// outside the button, as well as with space between the icon and the label or
/// child widget.
///
/// {@tool snippet}
/// This example shows how to use [AppButtonIconPosition] in a Flutter
/// application:
///
/// ```dart
/// AppButton(
///   iconData: Icons.add,
///   iconPosition: AppButtonIconPosition.leftInside,
///   label: 'Add',
///   onPressed: () {},
/// )
/// ```
/// {@end-tool}
///
/// See also:
///
///  * [AppButton], which uses this enum to position the icon in the button.
///  * [AppIconButtonContent], which uses this enum to position the icon
/// relative to the label or child widget.
enum AppButtonIconPosition {
  /// Positions the icon to the left of the label or child widget, inside the
  /// button.
  leftInside,

  /// Positions the icon to the right of the label or child widget, inside the
  /// button.
  rightInside,

  /// Positions the icon to the left of the label or child widget, outside the
  /// button.
  leftOutside,

  /// Positions the icon to the right of the label or child widget, outside the
  /// button.
  rightOutside,

  /// Positions the icon to the left of the label or child widget, with space
  /// between them.
  leftSpaceBetween,

  /// Positions the icon to the right of the label or child widget, with space
  /// between them.
  rightSpaceBetween,
}
