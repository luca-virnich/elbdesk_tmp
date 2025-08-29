import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

/// A widget that displays a row with a label and value, optionally with a
/// connecting line between them.
///
/// The widget is commonly used in form layouts or information displays where
/// you want to show a label-value pair with a visual connection between them.
class LabeledValueRow extends StatelessWidget {
  const LabeledValueRow({
    required this.title,
    required this.value,
    required this.width,
    super.key,
  });

  /// The label text to display on the left side
  final String title;

  /// The value text to display on the right side
  final String value;

  /// The total width available for the row
  final double width;

  static const _minWidth = 20.0;

  @override
  Widget build(BuildContext context) {
    final generalColors = context.appTheme.generalColors;

    return Row(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: _minWidth,
            maxWidth: (width * 0.3).clamp(_minWidth, double.infinity),
          ),
          child: AppText(title, maxLines: 1),
        ),

        // Connecting line
        if (value.isNotEmpty)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: AppSpace.s,
                right: AppSpace.s,
                top: 13,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 1,
                  color:
                      generalColors.primarySurfaceBorder.withAppOpacity(0.75),
                ),
              ),
            ),
          ),

        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: width * 0.6),
          child: AppText(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
