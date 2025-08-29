import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/elbdesk_prepress.dart';
import 'package:elbdesk_prepress/src/artwork_color/service/prepress_color_import/logic/color_import_state.dart';
import 'package:elbdesk_prepress/src/artwork_color/widgets/color_table/edit_color_table.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Specialized table for importing colors with edit/delete capabilities
class ImportColorTable extends HookConsumerWidget {
  const ImportColorTable({
    required this.colors,
    required this.maxWidth,
    required this.tableViewPage,
    required this.isLoading,
    required this.isImporting,
    required this.navigatorKey,
    required this.floatingWindowId,
    required this.floatingWindowFocus,
    this.bottomLeadingWidget,
    this.bottomTrailingWidget,
    this.onColorsChanged,
    super.key,
  });

  final List<ArtworkColor> colors;
  final double maxWidth;
  final ValueNotifier<int> tableViewPage;
  final bool isLoading;
  final ValueNotifier<bool> isImporting;
  final GlobalKey<NavigatorState> navigatorKey;
  final String floatingWindowId;
  final FocusNode floatingWindowFocus;
  final Widget? bottomLeadingWidget;
  final Widget? bottomTrailingWidget;
  final void Function(List<ArtworkColor>)? onColorsChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return EditColorTable(
      colors: colors,
      maxWidth: maxWidth,
      tableViewPage: tableViewPage,
      isLoading: isLoading,
      isImporting: isImporting.value,
      onColorDeleted: (deletedColor) {
        final index = colors.indexOf(deletedColor);
        if (index != -1) {
          final updatedList = List<ArtworkColor>.from(colors)..removeAt(index);
          ref
              .read(
                colorImportStateProvider(floatingWindowId).notifier,
              )
              .update(updatedList);
          onColorsChanged?.call(updatedList);
        }
      },
      onShortNameChanged: (color, newShortName) {
        final index = colors.indexOf(color);
        if (index != -1) {
          final updatedList = List<ArtworkColor>.from(colors);
          updatedList[index] = ArtworkColor(
            runtimeId: color.runtimeId,
            colorName: color.colorName,
            l: color.l,
            a: color.a,
            b: color.b,
            color: color.color,
            shortName: newShortName,
            colorPalette: null,
            meta: DataMeta.initial(),
            customText: null,
            colorSpecType: null,
            verarbeitungsEbene: null,
            printProcess: null,
            screenPointForm: null,
            screenLineature: null,
            screenAngle: null,
            boost: null,
            colorType: null,
          );
          ref
              .read(
                colorImportStateProvider(floatingWindowId).notifier,
              )
              .update(updatedList);
          onColorsChanged?.call(updatedList);
        }
      },
      navigatorKey: navigatorKey,
      floatingWindowId: floatingWindowId,
      floatingWindowFocus: floatingWindowFocus,
      bottomLeadingWidget: bottomLeadingWidget,
      bottomTrailingWidget: bottomTrailingWidget,
    );
  }
}
