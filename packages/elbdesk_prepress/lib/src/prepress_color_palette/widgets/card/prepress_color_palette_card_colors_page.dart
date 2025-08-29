import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/elbdesk_prepress.dart';
import 'package:elbdesk_prepress/src/artwork_color/widgets/color_table/base_color_table.dart';
import 'package:elbdesk_prepress/src/artwork_color/widgets/color_table/edit_color_table.dart';
import 'package:elbdesk_prepress/src/prepress_color_palette/logic/prepress_color_palette_state.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Shows the colors table for a color palette
class PrepressColorPaletteCardColorsPage extends HookConsumerWidget {
  const PrepressColorPaletteCardColorsPage({
    required this.readOnly,
    required this.initialEntity,
    required this.stateNotifier,
    required this.validationGroupId,
    required this.navigatorKey,
    required this.floatingWindowId,
    required this.floatingWindowFocus,
    required this.sessionId,
    super.key,
  });

  final bool readOnly;
  final PrepressColorPalette initialEntity;
  final PrepressColorPaletteState stateNotifier;
  final String validationGroupId;
  final GlobalKey<NavigatorState> navigatorKey;
  final String floatingWindowId;
  final FocusNode floatingWindowFocus;
  final String sessionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tableViewPage = useValueNotifier<int>(0);
    final isLoading = useState<bool>(false);

    return LayoutBuilder(
      builder: (context, constraints) {
        return ref
            .watch(
          prepressColorPaletteStateProvider(
            initialEntity.meta.id!,
            sessionId,
          ),
        )
            .fastWhen(
          data: (data) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CardSectionTitle(
                  title: initialEntity.paletteName,
                ),
                const SizedBox(height: AppSpace.s),
                Expanded(
                  child: readOnly
                      ? BaseColorTable(
                          colors: data.colors ?? [],
                          tableViewPage: tableViewPage,
                          isLoading: isLoading.value,
                          maxWidth: constraints.maxWidth,
                        )
                      : EditColorTable(
                          colors: data.colors ?? [],
                          maxWidth: constraints.maxWidth,
                          tableViewPage: tableViewPage,
                          isLoading: isLoading.value,
                          onColorDeleted: null,
                          onShortNameChanged: (color, newShortName) async {
                            try {
                              isLoading.value = true;
                              final updatedColor = ArtworkColor(
                                runtimeId: color.runtimeId,
                                colorName: color.colorName,
                                l: color.l,
                                a: color.a,
                                b: color.b,
                                color: color.color,
                                shortName: newShortName,
                                colorPalette: color.colorPalette,
                                meta: color.meta,
                                customText: color.customText,
                                colorSpecType: color.colorSpecType,
                                verarbeitungsEbene: color.verarbeitungsEbene,
                                printProcess: color.printProcess,
                                screenPointForm: color.screenPointForm,
                                screenLineature: color.screenLineature,
                                screenAngle: color.screenAngle,
                                boost: color.boost,
                                colorType: color.colorType,
                              );

                              // Update in database
                              await ref
                                  .read(artworkColorRepositoryProvider)
                                  .updateShortName(
                                    color.meta.id!,
                                    newShortName,
                                  );

                              // Update local state
                              final updatedColors = data.colors?.map((c) {
                                    if (c.runtimeId == color.runtimeId) {
                                      return updatedColor;
                                    }
                                    return c;
                                  }).toList() ??
                                  [];
                              stateNotifier.updateColors(updatedColors);
                            } finally {
                              isLoading.value = false;
                            }
                          },
                          navigatorKey: navigatorKey,
                          floatingWindowId: floatingWindowId,
                          floatingWindowFocus: floatingWindowFocus,
                        ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
