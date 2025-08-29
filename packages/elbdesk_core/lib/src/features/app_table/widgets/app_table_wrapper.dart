import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
// ignore: no_flutter_material_import
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Table Wrapper
///
/// Creates a table wrapper that takes content and toolbar widgets as input and
/// constructs a view based on the specified [AppTableDensity].
///
/// This widget adapts its layout depending on the [tableDensity]:
/// - For [AppTableDensity.standard], it arranges the toolbar and content
///   vertically.
/// - For [AppTableDensity.compact], it arranges the content and toolbar
///   horizontally.
class AppTableWrapper extends ConsumerWidget {
  /// Creates an [AppTableWrapper].
  ///
  /// The [content], [toolbar], and [tableDensity] parameters are required.
  /// [tableBackgroundColor] and [tableBorderRadius] are optional and can be
  /// used to customize the table's appearance.
  const AppTableWrapper({
    required this.content,
    required this.toolbar,
    required this.tableDensity,
    required super.key,
    required this.showToolbarDivider,
    this.tableBackgroundColor,
    this.tableBorderRadius,
    this.toolbarPadding,
  });

  /// The main content of the table.
  final Widget content;

  /// The toolbar widget for the table.
  final Widget toolbar;

  /// Determines the layout and density of the table.
  final AppTableDensity tableDensity;

  /// The background color of the table. If null, the default background is used
  final Color? tableBackgroundColor;

  /// The border radius of the table. If null, no border radius is applied.
  final BorderRadius? tableBorderRadius;

  final EdgeInsets? toolbarPadding;

  final bool showToolbarDivider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    switch (tableDensity) {
      case AppTableDensity.standard:
      case AppTableDensity.compact:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding:
                  toolbarPadding ?? const EdgeInsets.only(bottom: 8, right: 0),
              child: toolbar,
            ),
            if (!showToolbarDivider)
              const SizedBox(
                height: UiConstants.defaultPadding,
              ),
            AppTableContentWrapper(
              content: content,
              tableDensity: tableDensity,
              tableBackgroundColor: tableBackgroundColor,
              tableBorderRadius: tableBorderRadius,
            ),
          ],
        );

      case AppTableDensity.minimal:
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTableContentWrapper(
              content: content,
              tableDensity: tableDensity,
              tableBackgroundColor: tableBackgroundColor,
              tableBorderRadius: tableBorderRadius,
            ),
            toolbar,
          ],
        );
    }
  }
}

/// A wrapper for the content of the table.
///
/// This widget applies appropriate styling and layout to the table content
/// based on the specified [tableDensity].
class AppTableContentWrapper extends ConsumerWidget {
  /// Creates an [AppTableContentWrapper].
  ///
  /// All parameters except [key] are required.
  const AppTableContentWrapper({
    required this.content,
    required this.tableDensity,
    required this.tableBackgroundColor,
    required this.tableBorderRadius,
    super.key,
  });

  /// The content to be wrapped.
  final Widget content;

  /// Determines the layout and density of the table content.
  final AppTableDensity tableDensity;

  /// The background color of the table content. If null, the default background
  /// is used.
  final Color? tableBackgroundColor;

  /// The border radius of the table content. If null, no border radius is
  /// applied.
  final BorderRadius? tableBorderRadius;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Flexible(
      fit: switch (tableDensity) {
        AppTableDensity.standard => FlexFit.loose,
        AppTableDensity.compact => FlexFit.loose,
        AppTableDensity.minimal => FlexFit.tight,
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: tableBackgroundColor,
          borderRadius: tableBorderRadius,
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 0, right: 0),
          child: content,
        ),
      ),
    );
  }
}
