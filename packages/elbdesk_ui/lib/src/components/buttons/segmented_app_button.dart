part of 'app_button.dart';

/// Segmented App Button
///
/// Used to create segmented app buttons
///
/// Can be used to create primary, secondary, danger, and blank buttons in
/// a line. They are lined up as segments next to each other.
class SegmentedAppButton extends StatelessWidget {
  const SegmentedAppButton._({
    required this.segments,
    required this.type,
    super.key,
  });

  /// Creates segmented button in the style of a primary app button
  factory SegmentedAppButton.primary({
    required List<SegmentedAppButtonSegment> segments,
    Key? key,
  }) =>
      SegmentedAppButton._(
        segments: segments,
        type: AppButtonType.primary,
        key: key,
      );

  /// Creates segmented button in the style of a secondary app button
  factory SegmentedAppButton.secondary({
    required List<SegmentedAppButtonSegment> segments,
    Key? key,
  }) =>
      SegmentedAppButton._(
        segments: segments,
        type: AppButtonType.secondary,
        key: key,
      );

  /// Creates segmented button in the style of a danger app button
  factory SegmentedAppButton.danger({
    required List<SegmentedAppButtonSegment> segments,
    Key? key,
  }) =>
      SegmentedAppButton._(
        segments: segments,
        type: AppButtonType.danger,
        key: key,
      );

  /// The Segments of the button
  final List<SegmentedAppButtonSegment> segments;

  /// The type of the button
  final AppButtonType type;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final (index, segment) in segments.indexed)
          SegmentedActionButton(
            segment: segment,
            index: index,
            segmentCount: segments.length,
            type: type,
            isLoading: segment.isLoading,
          ),
      ],
    );
  }
}

/// Segmented App Button Segment
///
/// A segment of an [SegmentedAppButton] that displays an icon, label, or both.
class SegmentedActionButton extends StatelessWidget {
  /// Constructor
  const SegmentedActionButton({
    required this.segment,
    required this.index,
    required this.segmentCount,
    required this.type,
    required this.isLoading,
    super.key,
  });

  /// The Segment of the button
  final SegmentedAppButtonSegment segment;

  /// IsLoading
  final bool isLoading;

  /// The index of the button
  final int index;

  /// The count of the segments
  final int segmentCount;

  /// The AppButtonType of the button
  final AppButtonType type;

  @override
  Widget build(BuildContext context) {
    final borderRadiuses = context.appTheme.borderRadiuses;
    BorderRadius? getBorderRadius() {
      if (index == 0 && segmentCount == 1) {
        return null;
      } else if (index == 0 && segmentCount > 1) {
        return BorderRadius.only(
          bottomLeft: Radius.circular(borderRadiuses.s),
          topLeft: Radius.circular(borderRadiuses.s),
        );
      } else if (index == segmentCount - 1 && segmentCount > 1) {
        return BorderRadius.only(
          bottomRight: Radius.circular(borderRadiuses.s),
          topRight: Radius.circular(borderRadiuses.s),
        );
      } else {
        return BorderRadius.zero;
      }
    }

    final borderRadius = getBorderRadius();
    final showRightBorder = index == segmentCount - 1;
    final showLeftBorder = index == 0;

    return switch (type) {
      AppButtonType.primary => AppButton.primary(
          borderRadius: borderRadius,
          onPressed: segment.onPressed,
          iconData: segment.icon,
          showRightBorder: showRightBorder,
          showLeftBorder: showLeftBorder,
          label: segment.label,
          tooltip: segment.tooltip,
          iconPosition: segment.iconPosition,
          isLoading: isLoading,
        ),
      AppButtonType.secondary => AppButton.secondary(
          borderRadius: borderRadius,
          onPressed: segment.onPressed,
          iconData: segment.icon,
          showRightBorder: showRightBorder,
          showLeftBorder: showLeftBorder,
          label: segment.label,
          tooltip: segment.tooltip,
          iconPosition: segment.iconPosition,
          isLoading: isLoading,
        ),
      AppButtonType.text => AppButton.text(
          borderRadius: borderRadius,
          onPressed: segment.onPressed,
          iconData: segment.icon,
          showRightBorder: showRightBorder,
          showLeftBorder: showLeftBorder,
          label: segment.label,
          tooltip: segment.tooltip,
          iconPosition: segment.iconPosition,
          isLoading: isLoading,
        ),
      AppButtonType.danger => AppButton.danger(
          borderRadius: borderRadius,
          onPressed: segment.onPressed,
          showRightBorder: showRightBorder,
          showLeftBorder: showLeftBorder,
          iconData: segment.icon,
          label: segment.label,
          tooltip: segment.tooltip,
          iconPosition: segment.iconPosition,
          isLoading: isLoading,
        ),
      AppButtonType.blank => AppButton.blank(
          borderRadius: borderRadius,
          onPressed: segment.onPressed,
          showRightBorder: showRightBorder,
          showLeftBorder: showLeftBorder,
          label: segment.label,
          tooltip: segment.tooltip,
          iconPosition: segment.iconPosition,
        ),
      AppButtonType.outline => AppButton.blank(
          borderRadius: borderRadius,
          onPressed: segment.onPressed,
          showRightBorder: showRightBorder,
          showLeftBorder: showLeftBorder,
          label: segment.label,
          tooltip: segment.tooltip,
          iconPosition: segment.iconPosition,
        ),
      _ => throw UnimplementedError('Unknown AppButtonType: $type'),
    };
  }
}

/// Segmented App Button Segment
///
/// A segment of an [SegmentedAppButton] that displays an icon, label, or both.
///
/// The [SegmentedActionButton] widget is a customizable button segment that can
/// display an icon, a label, or both. It supports different styles and states
/// such as hover, focus, and disabled. The button segment can also be
/// configured with a tooltip and icon alignment.
class SegmentedAppButtonSegment {
  /// Constructor
  SegmentedAppButtonSegment({
    required this.onPressed,
    this.tooltip,
    this.icon,
    this.isLoading = false,
    this.label,
    this.iconPosition = AppButtonIconPosition.rightInside,
  });

  /// Label
  final String? label;

  /// Tooltip
  final String? tooltip;

  /// IsLoading
  final bool isLoading;

  /// Icon
  final IconData? icon;

  /// OnPressed Callback
  final VoidCallback? onPressed;

  /// Icon Position
  final AppButtonIconPosition iconPosition;
}
