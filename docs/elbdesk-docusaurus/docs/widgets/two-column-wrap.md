# Two Column Wrap

This Widget is mainly used in Cards with several TextFields. We want to ensure to have the same and consistent UI at all Components, so this Widget will help us to do so.

The TwoColumnWrap is typicly a child of a Builder with access to the constraints, as it needs the maximum available width:

```dart
class TwoColumnWrap extends StatelessWidget {
  /// Creates a [TwoColumnWrap].
  ///
  /// The [builder] function must not be null and returns the label position and
  /// the child width.
  const TwoColumnWrap({
    required this.builder,
    required this.width,
    super.key,
  });

  final List<Widget> Function(
    AppTextFieldLabelPosition labelPosition,
    double childWidth,
  ) builder;
  final double width;

  @override
  Widget build(BuildContext context) {
    final isTwoColumns = width > UiConstants.twoColumnWrapBreakpointWidth;
    final labelPosition = width > 300
        ? AppTextFieldLabelPosition.left
        : AppTextFieldLabelPosition.top;

    final childWidth = isTwoColumns
        ? (width - UiConstants.twoColumnWrapHorizontalSpacing) / 2
        : width;

    return Wrap(
      
      spacing: UiConstants.twoColumnWrapHorizontalSpacing,
      children: builder(labelPosition, childWidth).map((child) {
        return SizedBox(
          width: childWidth,
          child: child,
        );
      }).toList(),
    );
  }
}
```

The Widget gives us access threw its to the preferred label Position of a TextField and the width of the corresponending child.

