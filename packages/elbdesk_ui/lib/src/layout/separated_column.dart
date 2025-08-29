import 'package:flutter/widgets.dart';

/// A widget that arranges its children in a vertical column with a separator
/// widget between them.
///
/// The [SeparatedColumn] widget is used to create a vertical layout where the
/// children are arranged in a column with a specified separator widget
/// between them. The separator is added only if there are multiple children.
///
/// There are two ways to construct a [SeparatedColumn]:
///
/// 1. Using a list of children and a single separator widget:
/// ```dart
/// SeparatedColumn(
///   separator: Divider(),
///   children: [
///     Text('Child 1'),
///     Text('Child 2'),
///     Text('Child 3'),
///   ],
/// )
/// ```
///
/// 2. Using builders to dynamically generate children and separators:
/// ```dart
/// SeparatedColumn.builder(
///   itemCount: 3,
///   itemBuilder: (context, index) => Text('Child ${index + 1}'),
///   separatorBuilder: (context, index) => Divider(),
/// )
/// ```
///
/// See also:
///
///  * [Column], which arranges its children in a vertical layout without
/// separators.
///  * [ListView.separated], which creates a scrollable list with separators.
class SeparatedColumn extends StatelessWidget {
  /// Creates a [SeparatedColumn].
  ///
  /// The [children], [separator], [mainAxisSize], and [crossAxisAlignment]
  /// parameters must not be null.
  const SeparatedColumn({
    required this.separator,
    super.key,
    this.children = const <Widget>[],
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  })  : itemBuilder = null,
        itemCount = null,
        separatorBuilder = null;

  /// Creates a [SeparatedColumn] with an item builder.
  ///
  /// The [itemBuilder], [itemCount], [separatorBuilder], [mainAxisSize],
  /// and [crossAxisAlignment] parameters must not be null.
  const SeparatedColumn.builder({
    required Widget Function(BuildContext, int) this.itemBuilder,
    required int this.itemCount,
    required Widget Function(BuildContext, int) this.separatorBuilder,
    super.key,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  })  : separator = null,
        children = const <Widget>[];

  /// The list of widgets to display as children in the column.
  final List<Widget> children;

  /// The builder that creates child widgets.
  final Widget Function(BuildContext, int)? itemBuilder;

  /// The number of children when using builder constructor.
  final int? itemCount;

  /// The widget to display between children.
  final Widget? separator;

  /// The builder that creates separator widgets.
  final Widget Function(BuildContext, int)? separatorBuilder;

  /// How the children should be aligned along the cross axis.
  final CrossAxisAlignment crossAxisAlignment;

  /// How much space should be occupied in the main axis.
  final MainAxisSize mainAxisSize;

  @override
  Widget build(BuildContext context) {
    final int length;
    if (itemBuilder != null) {
      length = itemCount!;
    } else {
      length = children.length;
    }

    return Column(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: mainAxisSize,
      children: length == 0
          ? const <Widget>[]
          : List<Widget>.generate(
              length * 2 - 1,
              (index) {
                if (index.isEven) {
                  final childIndex = index ~/ 2;
                  return itemBuilder != null
                      ? itemBuilder!(context, childIndex)
                      : children[childIndex];
                } else {
                  final separatorIndex = index ~/ 2;
                  return separatorBuilder != null
                      ? separatorBuilder!(context, separatorIndex)
                      : separator!;
                }
              },
            ),
    );
  }
}
