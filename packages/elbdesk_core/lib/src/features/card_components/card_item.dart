import 'package:elbdesk_ui/elbdesk_ui.dart';
// ignore: no_flutter_material_import
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

enum _Type {
  constrained,
  unconstrained,
}

class ScrollableCardItem extends HookWidget {
  const ScrollableCardItem.constrained({
    required this.builder,
    this.mainAxisSize = MainAxisSize.min,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.crossAxisAlignment = CrossAxisAlignment.stretch,
    this.bottomPadding,
    this.contentPadding,
    super.key,
  })  : _type = _Type.constrained,
        child = null;

  const ScrollableCardItem.unconstrained({
    required this.child,
    this.mainAxisSize = MainAxisSize.min,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.crossAxisAlignment = CrossAxisAlignment.stretch,
    this.bottomPadding,
    this.contentPadding,
    super.key,
  })  : _type = _Type.unconstrained,
        builder = null;

  final Widget Function(BuildContext context, BoxConstraints constraints)?
      builder;
  final Widget? child;
  final MainAxisSize mainAxisSize;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final _Type _type;
  final double? bottomPadding;
  final EdgeInsets? contentPadding;

  @override
  Widget build(BuildContext context) {
    final effectiveBottomPadding = bottomPadding ?? UiConstants.defaultPadding;

    return FocusTraversalGroup(
      policy: OrderedTraversalPolicy(),
      child: SingleChildScrollView(
        padding: contentPadding ??
            const EdgeInsets.only(
              right: UiConstants.defaultPadding,
              left: UiConstants.defaultPadding,
            ),
        child: _type == _Type.constrained
            ? LayoutBuilder(
                builder: (context, constraints) {
                  return Column(
                    mainAxisSize: mainAxisSize,
                    mainAxisAlignment: mainAxisAlignment,
                    crossAxisAlignment: crossAxisAlignment,
                    children: [
                      const SizedBox(
                        height: UiConstants.defaultPadding,
                      ),
                      builder!(context, constraints),
                      SizedBox(height: effectiveBottomPadding),
                    ],
                  );
                },
              )
            : Column(
                mainAxisSize: mainAxisSize,
                mainAxisAlignment: mainAxisAlignment,
                crossAxisAlignment: crossAxisAlignment,
                children: [
                  const SizedBox(height: UiConstants.defaultPadding),
                  child!,
                  SizedBox(height: effectiveBottomPadding),
                ],
              ),
      ),
    );
  }
}

class SelfScrollableCardItem extends StatelessWidget {
  const SelfScrollableCardItem({
    required this.child,
    this.showRightPadding = false,
    this.bottomPadding,
    this.padding,
    super.key,
  });
  final Widget child;
  final bool showRightPadding;
  final double? bottomPadding;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final effectiveBottomPadding = bottomPadding ?? UiConstants.defaultPadding;

    return Padding(
      padding: padding == null
          ? EdgeInsets.only(
              left: UiConstants.defaultPadding,
              right: showRightPadding ? UiConstants.defaultPadding : 0,
            )
          : padding!,
      child: Column(
        children: [
          const SizedBox(height: UiConstants.defaultPadding),
          Expanded(child: child),
          SizedBox(height: effectiveBottomPadding),
        ],
      ),
    );
  }
}

class TableCardItem extends StatelessWidget {
  const TableCardItem({required this.table, super.key});
  final Widget table;

  @override
  Widget build(BuildContext context) {
    return SelfScrollableCardItem(
      bottomPadding: 0,
      padding: const EdgeInsets.only(
        left: UiConstants.defaultPadding,
      ),
      child: table,
    );
  }
}
