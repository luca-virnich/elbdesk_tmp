import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/elbdesk_prepress.dart';
import 'package:elbdesk_prepress/src/artwork_color/service/prepress_color_import/color_transformer/lab_calulcation.dart';
import 'package:elbdesk_prepress/src/artwork_color/service/prepress_color_import/logic/color_import_state.dart';
import 'package:elbdesk_prepress/src/artwork_color/service/prepress_color_import/logic/parse_color_palette_cxf_file.dart';
import 'package:elbdesk_prepress/src/artwork_color/widgets/color_table/import_color_table.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// A reusable widget that provides color import functionality with drag & drop
/// and table view
class PrepressColorImportArea extends HookConsumerWidget {
  const PrepressColorImportArea({
    required this.navigatorKey,
    required this.floatingWindowId,
    required this.floatingWindowFocus,
    this.onImport,
    this.onColorsLoaded,
    this.onCancel,
    super.key,
  });

  final GlobalKey<NavigatorState> navigatorKey;
  final String floatingWindowId;
  final FocusNode floatingWindowFocus;
  final Future<void> Function(List<ArtworkColor> colors, String paletteName)?
      onImport;
  final void Function(List<ArtworkColor> colors)? onColorsLoaded;
  final VoidCallback? onCancel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorsToImport =
        ref.watch(colorImportStateProvider(floatingWindowId));
    final tableViewPage = useValueNotifier<int>(0);
    final colorPaletteName = useState<String>('');
    final colorBookAlreadyExists = useState<bool>(false);
    final isLoading = useState<bool>(false);
    final isImporting = useState<bool>(false);

    final parseCxfFileToColorsToImport = useCallback(
      (XFile file) async {
        final (:colorSpecifications, objects: colors) =
            await parseColorPaletteCxfFile(file: file);

        for (final colorObject in colors) {
          if (colorObject.startWL != null) {
            final spectrum = colorObject.reflectanceSpectrumValues;
            final labValues = calculateColor(spectrum!);

            colorObject
              ..l = labValues[0]
              ..a = labValues[1]
              ..b = labValues[2];
          }
        }

        return colors.map((colorObject) {
          final toFlutterColor = labToColor(
            colorObject.l!,
            colorObject.a!,
            colorObject.b!,
          );

          const fractions = 4;
          return ArtworkColor(
            colorName: colorObject.name,
            shortName: colorObject.shortName,
            runtimeId: colorObject.id,
            colorPalette: null,
            colorType: null,
            colorSpecType: null,
            verarbeitungsEbene: null,
            printProcess: null,
            screenPointForm: null,
            screenLineature: null,
            screenAngle: null,
            boost: null,
            customText: null,
            meta: DataMeta.initial(),
            l: double.parse(
              colorObject.l!.toStringAsFixed(fractions),
            ),
            a: double.parse(
              colorObject.a!.toStringAsFixed(fractions),
            ),
            b: double.parse(
              colorObject.b!.toStringAsFixed(fractions),
            ),
            color: toFlutterColor,
          );
        }).toList();
      },
      [],
    );

    return colorsToImport == null
        ? _DragAndDropArea(
            isLoading: isLoading,
            isImporting: isImporting,
            tableViewPage: tableViewPage,
            colorPaletteName: colorPaletteName,
            colorBookAlreadyExists: colorBookAlreadyExists,
            parseCxfFileToColorsToImport: parseCxfFileToColorsToImport,
            floatingWindowId: floatingWindowId,
            onColorsLoaded: onColorsLoaded,
          )
        : _ImportedColorsOverview(
            isImporting: isImporting,
            isLoading: isLoading,
            colorPaletteName: colorPaletteName,
            colorBookAlreadyExists: colorBookAlreadyExists,
            tableViewPage: tableViewPage,
            navigatorKey: navigatorKey,
            floatingWindowId: floatingWindowId,
            floatingWindowFocus: floatingWindowFocus,
            onImport: onImport,
            onCancel: onCancel,
          );
  }
}

class _ImportedColorsOverview extends ConsumerWidget {
  const _ImportedColorsOverview({
    required this.isImporting,
    required this.isLoading,
    required this.colorPaletteName,
    required this.colorBookAlreadyExists,
    required this.tableViewPage,
    required this.navigatorKey,
    required this.floatingWindowId,
    required this.floatingWindowFocus,
    this.onImport,
    this.onCancel,
  });

  final ValueNotifier<bool> isImporting;
  final ValueNotifier<bool> isLoading;
  final ValueNotifier<String> colorPaletteName;
  final ValueNotifier<bool> colorBookAlreadyExists;
  final ValueNotifier<int> tableViewPage;
  final GlobalKey<NavigatorState> navigatorKey;
  final String floatingWindowId;
  final FocusNode floatingWindowFocus;
  final Future<void> Function(List<ArtworkColor> colors, String paletteName)?
      onImport;
  final VoidCallback? onCancel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final colorsToImport =
        ref.watch(colorImportStateProvider(floatingWindowId));

    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          height: constraints.maxHeight * 0.8,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CardSectionTitle(
                title: colorPaletteName.value,
              ),
              const SizedBox(height: AppSpace.s),
              if (colorBookAlreadyExists.value)
                const ColorPaletteWarning()
              else
                const SizedBox.shrink(),
              Expanded(
                child: ImportColorTable(
                  colors: colorsToImport ?? [],
                  maxWidth: constraints.maxWidth,
                  tableViewPage: tableViewPage,
                  isLoading: isLoading.value,
                  isImporting: isImporting,
                  navigatorKey: navigatorKey,
                  floatingWindowId: floatingWindowId,
                  floatingWindowFocus: floatingWindowFocus,
                  bottomLeadingWidget: AppButton.danger(
                    onPressed: isImporting.value
                        ? null
                        : () {
                            ref
                                .read(
                                  colorImportStateProvider(floatingWindowId)
                                      .notifier,
                                )
                                .clear();
                            onCancel?.call();
                          },
                    label: l10n.gen_delete_all,
                  ),
                  bottomTrailingWidget: _ImportButton(
                    colorBookAlreadyExists: colorBookAlreadyExists,
                    floatingWindowId: floatingWindowId,
                    isLoading: isLoading,
                    colorPaletteName: colorPaletteName.value,
                    isImporting: isImporting,
                    onImport: onImport,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _DragAndDropArea extends ConsumerWidget {
  const _DragAndDropArea({
    required this.isLoading,
    required this.isImporting,
    required this.tableViewPage,
    required this.colorPaletteName,
    required this.parseCxfFileToColorsToImport,
    required this.floatingWindowId,
    required this.colorBookAlreadyExists,
    this.onColorsLoaded,
  });

  final ValueNotifier<bool> isLoading;
  final ValueNotifier<bool> isImporting;
  final ValueNotifier<int> tableViewPage;
  final ValueNotifier<String> colorPaletteName;
  final String floatingWindowId;
  final void Function(List<ArtworkColor> colors)? onColorsLoaded;
  final Future<List<ArtworkColor>> Function(XFile file)
      parseCxfFileToColorsToImport;
  final ValueNotifier<bool> colorBookAlreadyExists;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final ppL10n = context.prepressL10n;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpace.l),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: AppFileDropArea(
            icon: AppIcons.upload_file,
            title1: ppL10n.color_select_cxf,
            title2: l10n.gen_or,
            subTitle: l10n.gen_drag_and_drop_here,
            height: 240,
            isEnabled: !isLoading.value || !isImporting.value,
            isLoading: isLoading.value || isImporting.value,
            onDragDone: isImporting.value || isLoading.value
                ? null
                : (details) async {
                    isLoading.value = true;
                    try {
                      if (details.files.isEmpty) {
                        isLoading.value = false;
                        return;
                      }
                      final file = details.files.first;
                      // Check file type
                      if (!file.name.toLowerCase().endsWith('.cxf')) {
                        AppNotificationOverlay.error(
                          context,
                          l10n.gen_invalid_file_type,
                        );
                        isLoading.value = false;
                        return;
                      }

                      tableViewPage.value = 0;
                      final fileName =
                          file.name.substring(0, file.name.lastIndexOf('.'));
                      colorPaletteName.value = fileName;

                      colorBookAlreadyExists.value = await ref
                          .read(prepressColorPaletteRepositoryProvider)
                          .colorBookExists(
                            colorPaletteName.value,
                          );

                      final colorsToImport = await compute(
                        parseCxfFileToColorsToImport,
                        file,
                      );

                      if (onColorsLoaded != null) {
                        onColorsLoaded!(colorsToImport);
                      } else {
                        ref
                            .read(
                              colorImportStateProvider(floatingWindowId)
                                  .notifier,
                            )
                            .update(
                              colorsToImport,
                            );
                      }
                      isLoading.value = false;
                    } catch (e) {
                      if (context.mounted) {
                        isLoading.value = false;
                      }
                    }
                  },
            onPressed: isImporting.value || isLoading.value
                ? null
                : () async {
                    isLoading.value = true;
                    const typeGroup = XTypeGroup(
                      label: 'cxf',
                      extensions: <String>['cxf'],
                    );

                    final file = await openFile(
                      acceptedTypeGroups: <XTypeGroup>[typeGroup],
                    );
                    if (file != null) {
                      tableViewPage.value = 0;
                      final fileName =
                          file.name.substring(0, file.name.lastIndexOf('.'));
                      colorPaletteName.value = fileName;

                      final colorsToImport = await compute(
                        parseCxfFileToColorsToImport,
                        file,
                      );

                      if (onColorsLoaded != null) {
                        onColorsLoaded!(colorsToImport);
                      } else {
                        ref
                            .read(
                              colorImportStateProvider(floatingWindowId)
                                  .notifier,
                            )
                            .update(
                              colorsToImport,
                            );
                      }
                      isLoading.value = false;
                    } else {
                      if (context.mounted) {
                        isLoading.value = false;
                      }
                    }
                  },
          ),
        ),
      ),
    );
  }
}

class _ImportButton extends HookConsumerWidget {
  const _ImportButton({
    required this.colorPaletteName,
    required this.colorBookAlreadyExists,
    required this.isLoading,
    required this.isImporting,
    required this.floatingWindowId,
    this.onImport,
  });
  final String colorPaletteName;
  final ValueNotifier<bool> isLoading;
  final ValueNotifier<bool> isImporting;
  final ValueNotifier<bool> colorBookAlreadyExists;
  final String floatingWindowId;
  final Future<void> Function(List<ArtworkColor> colors, String paletteName)?
      onImport;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final colorsToImport =
        ref.watch(colorImportStateProvider(floatingWindowId));
    final isNullOrEmpty = colorsToImport == null ||
        colorsToImport.isEmpty ||
        colorPaletteName.isEmpty ||
        isLoading.value;

    return AppApplyButton(
      label: l10n.gen_import,
      isLoading: isImporting.value,
      onPressed:
          isNullOrEmpty || isImporting.value || colorBookAlreadyExists.value
              ? null
              : () async {
                  isImporting.value = true;

                  try {
                    if (onImport != null) {
                      await onImport!(colorsToImport, colorPaletteName);
                    }
                  } finally {
                    if (context.mounted) {
                      ref
                          .read(
                            colorImportStateProvider(floatingWindowId).notifier,
                          )
                          .clear();
                      isImporting.value = false;
                    }
                  }
                },
    );
  }
}

/// A beautiful animated warning message that appears when a color palette
/// already exists
class ColorPaletteWarning extends HookWidget {
  const ColorPaletteWarning({super.key});

  @override
  Widget build(BuildContext context) {
    final ppL10n = context.prepressL10n;
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 500),
    );
    final slideAnimation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOutCubic,
      ),
    );
    final fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOut,
      ),
    );

    useEffect(
      () {
        animationController.forward();
        return null;
      },
      const [],
    );

    return SlideTransition(
      position: slideAnimation,
      child: FadeTransition(
        opacity: fadeAnimation,
        child: AppSmallInfoBox(label: ppL10n.color_palette_already_exists),
      ),
    );
  }
}
