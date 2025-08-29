part of 'artwork_color_table.dart';

class ArtworkColorTableColorNameCell extends HookWidget {
  const ArtworkColorTableColorNameCell({
    required this.customerId,
    required this.initialColor,
    required this.onReset,
    required this.onUpdate,
    required this.currentColorProvider,
    required this.readOnly,
    required this.navigatorKey,
    required this.floatingWindowId,
    required this.floatingWindowFocus,
    required super.key,
    this.disabled = false,
  });
  final int customerId;
  final ArtworkColor? initialColor;
  final bool readOnly;
  final void Function(String runtimeId)? onReset;
  final void Function(
    String runtimeId,
    ArtworkColor newColor,
  )? onUpdate;
  final GlobalKey<NavigatorState> navigatorKey;
  final ProviderListenable<AsyncValue<List<ArtworkColor>>> currentColorProvider;
  final String floatingWindowId;
  final FocusNode floatingWindowFocus;
  final bool disabled;

  String _buildTooltipMessage(ArtworkColor? color) {
    if (color == null) {
      return '';
    }
    if (color.colorPalette?.paletteName == null) {
      return color.colorName;
    }
    return '${color.colorPalette!.paletteName}\n${color.colorName}';
  }

  @override
  Widget build(BuildContext context) {
    final ppL10n = context.prepressL10n;
    final controller = useTextEditingController(text: initialColor?.colorName);

    final isSearching = useState<bool>(false);
    final borderRadiuses = context.appTheme.borderRadiuses;
    return Consumer(
      builder: (context, ref, child) {
        return IgnorePointer(
          ignoring: disabled,
          child: Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.circular(borderRadiuses.s)),
                    border: Border.all(color: const Color(0xffdddddd)),
                  ),
                  height: 20,
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.all(Radius.circular(borderRadiuses.s)),
                    child: ElbMouseRegionGestureDetector(
                      onTap: readOnly || isSearching.value
                          ? null
                          : () async {
                              final selectedColor =
                                  await showElbDialog<ArtworkColor?>(
                                context: context,
                                navigatorKey: navigatorKey,
                                child: ElbDialog(
                                  isSelfScrollable: false,
                                  title: initialColor?.colorName.isEmpty ?? true
                                      ? ppL10n.artwork_add_color
                                      : ppL10n.artwork_edit_color,
                                  floatingWindowId: floatingWindowId,
                                  child: SearchAndSelectColorInArtworkTable(
                                    customerId: customerId,
                                    componentIdentifier: ComponentIdentifier
                                        .searchAndSelectColorInArtworkTable,
                                    isCollapsible: false,
                                  ),
                                ),
                              );
                              if (selectedColor != null && context.mounted) {
                                onUpdate?.call(
                                  initialColor!.runtimeId,
                                  selectedColor,
                                );
                                controller.text = selectedColor.colorName;
                              }
                            },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 20,
                            height: 20,
                            child: isSearching.value
                                ? const CupertinoActivityIndicator()
                                : Consumer(
                                    builder: (context, ref, child) {
                                      final currentArtowrkColor = ref
                                          .watch(currentColorProvider)
                                          .requireValue
                                          .firstWhereOrNull(
                                            (e) =>
                                                e.runtimeId ==
                                                initialColor!.runtimeId,
                                          );

                                      return AppTooltip(
                                        message: _buildTooltipMessage(
                                          currentArtowrkColor,
                                        ),
                                        child: CustomPaint(
                                          painter: _SelectedColorPainter(
                                            currentArtowrkColor?.color ??
                                                context.appTheme.generalColors
                                                    .transparent,
                                            context,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: AppTableCellInputField.text(
                    controller: controller,
                    readOnly: readOnly,
                    initialText: initialColor?.colorName,
                    key: Key('${initialColor!.runtimeId}_colorName'),
                    onChanged: (v) {
                      onReset?.call(initialColor!.runtimeId);
                    },
                    onEditingComplete: () async {
                      if (isSearching.value) return;
                      final text = controller.text;
                      isSearching.value = true;
                      final colors = await ref
                          .read(artworkColorRepositoryProvider)
                          .findByShortName(
                            customerId,
                            text,
                          );
                      if (!context.mounted) {
                        return;
                      }
                      if (colors.isEmpty) {
                        isSearching.value = false;
                        return;
                      }

                      if (colors.length == 1) {
                        final color = colors.first;
                        onUpdate?.call(initialColor!.runtimeId, color);

                        controller.text = color.colorName;

                        FocusScope.of(context).nextFocus();
                        isSearching.value = false;
                      } else {
                        final selectedColor =
                            await showElbDialog<ArtworkColor?>(
                          context: context,
                          navigatorKey: navigatorKey,
                          child: ElbDialog(
                            isSelfScrollable: false,
                            floatingWindowId: floatingWindowId,
                            child: SearchAndSelectColorInArtworkTable(
                              items: colors,
                              customerId: customerId,
                              componentIdentifier: ComponentIdentifier
                                  .searchAndSelectColorInArtworkTable,
                              isCollapsible: false,
                            ),
                          ),
                        );
                        if (selectedColor != null && context.mounted) {
                          onUpdate?.call(
                            initialColor!.runtimeId,
                            selectedColor,
                          );

                          controller.text = selectedColor.colorName;

                          FocusScope.of(context).nextFocus();
                          isSearching.value = false;
                        } else if (context.mounted) {
                          isSearching.value = false;
                        }
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _SelectedColorPainter extends CustomPainter {
  const _SelectedColorPainter(
    this.color,
    this.context,
  );

  final Color color;
  final BuildContext context;

  @override
  void paint(Canvas canvas, Size size) {
    // Feste Werte für das Schachbrettmuster
    const width = 20.0;
    const height = 20.0;
    final generalColors = context.appTheme.generalColors;

    const chessSizeWidth = width / 2; // 15 Felder in der Breite
    const chessSizeHeight = height / 2; // 2 Felder in der Höhe

    final chessPaintB = Paint()..color = generalColors.chessBoardDarkColor;
    final chessPaintW = Paint()..color = generalColors.chessBoardLightColor;

    // Schachbrettmuster zeichnen
    List.generate((height / chessSizeHeight).round(), (int y) {
      List.generate((width / chessSizeWidth).round(), (int x) {
        canvas.drawRect(
          Offset(chessSizeWidth * x, chessSizeHeight * y) &
              const Size(chessSizeWidth, chessSizeHeight),
          (x + y) % 2 != 0 ? chessPaintW : chessPaintB,
        );
      });
    });

    // Rechteck mit übergebener Farbe füllen
    canvas.drawRect(
      const Rect.fromLTWH(
        0,
        0,
        width,
        height,
      ), // Rechteck in der Größe 200x32 px
      Paint()
        ..color = color
        ..style = PaintingStyle.fill,
    );
  }

  @override
  bool shouldRepaint(covariant _SelectedColorPainter oldDelegate) {
    return color != oldDelegate.color;
  }
}
