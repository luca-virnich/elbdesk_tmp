import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

/// A custom image button widget with a label and selection state.
///
/// The [AppImageButton] widget is a stateless widget that displays an image
/// with a label below it. The button can be in a selected or unselected state,
/// which affects its appearance. When the button is tapped, the [onTap]
/// callback is triggered.
///
/// {@tool snippet}
/// This example shows how to use [AppImageButton] in a Flutter application:
///
/// ```dart
/// AppImageButton(
///   assetPath: 'assets/images/sample.png',
///   label: 'Sample Image',
///   isSelected: true,
///   onTap: () {
///     print('Image button tapped');
///   },
/// )
/// ```
/// {@end-tool}
///
/// See also:
///
///  * [GestureDetector], which is used to detect tap gestures.
///  * [Image.asset], which is used to display the image.
///  * [ElbIcon], which is used to display the selection icon.
///  * [AppText], which is used to display the label text.
class AppImageButton extends StatelessWidget {
  /// Creates an [AppImageButton] widget.
  ///
  /// The [assetPath], [label], [isSelected], and [onTap] parameters must not
  /// be null.
  const AppImageButton({
    required this.assetPath,
    required this.label,
    required this.isSelected,
    required this.onTap,
    super.key,
    this.imageWidth,
  });

  /// The path to the image asset.
  final String assetPath;

  /// The label text displayed below the image.
  final String label;

  /// Whether the button is in the selected state.
  final bool isSelected;

  /// The width of the image.
  final double? imageWidth;

  /// The callback function that is called when the button is tapped.
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textStyles = context.appTheme.textStyles;
    final generalColors = context.appTheme.generalColors;
    final borderRadiuses = context.appTheme.borderRadiuses;
    final statusColors = context.appTheme.statusColors;

    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isSelected
                        ? statusColors.pending
                        : generalColors.transparent,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(
                    borderRadiuses.l,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    borderRadiuses.l,
                  ),
                  child: Image.asset(
                    assetPath,
                    width: imageWidth ?? 160,
                  ),
                ),
              ),
              if (isSelected)
                Positioned(
                  bottom: AppSpace.s,
                  left: AppSpace.s,
                  child: ElbIcon(
                    Icons.check_circle,
                    color: statusColors.pending,
                    size: AppIconSize.xs,
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpace.s,
              vertical: AppSpace.xs,
            ),
            child: AppText(
              textAlign: TextAlign.start,
              label,
              style: isSelected
                  ? textStyles.imageButtonSelectedStyle
                  : textStyles.imageButtonStyle,
            ),
          ),
        ],
      ),
    );
  }
}
