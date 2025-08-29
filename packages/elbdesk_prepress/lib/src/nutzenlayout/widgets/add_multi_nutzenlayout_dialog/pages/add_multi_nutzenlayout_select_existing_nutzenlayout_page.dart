part of '../add_multi_nutzenlayout_dialog.dart';

/// The User can select an existing nutzenlayout for the selected artworks
class _AddMultiNutzenlayoutSelectExistingNutzenlayoutPage
    extends HookConsumerWidget {
  const _AddMultiNutzenlayoutSelectExistingNutzenlayoutPage({
    required this.salesOrderId,
    required this.sessionId,
    required this.customerId,
    required this.navigatorKey,
    required this.pageController,
  });

  final int salesOrderId;
  final String sessionId;
  final int customerId;
  final GlobalKey<NavigatorState> navigatorKey;
  final PageController pageController;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedArtworks = ref.watch(
      selectedArtworksForSammelformaufbauProvider(sessionId),
    );
    final dimensions = useMemoized(
      () => selectedArtworks
          .map(
            (e) => NutzenlayoutArtworkDimensions(
              width: e.artwork.width,
              height: e.artwork.height,
            ),
          )
          .toSet(),
    );
    // fetching all nutzenlayouts by customer with dimensions
    final nutzenlayouts = ref.watch(
      fetchMultiNutzenlayoutsByCustomerWithDimensionsProvider(
        customerId: customerId,
        dimensions: dimensions,
      ),
    );
    // return const SizedBox();

    final nutzenlayoutsByMasterId = ref.watch(
      fetchNutzelayoutsByMasterIdProvider(sessionId),
    );

    final scrollController = useScrollController();
    final scrollController2 = useScrollController();

    return nutzenlayouts.fastWhen(
      data: (nutzenlayouts) {
        return nutzenlayoutsByMasterId.fastWhen(
          data: (masters) {
            final matchingNutzenlayouts = nutzenlayouts
                .where((nutzenlayout) => masters.contains(nutzenlayout.id))
                .toList();
            final nonMatchingNutzenlayouts = nutzenlayouts
                .where((nutzenlayout) => !masters.contains(nutzenlayout.id))
                .toList();

            if (nutzenlayouts.isEmpty) {
              return Center(
                child: AppText(
                  'Noch kein Nutzenlayout mit den angegeben Dimensionen '
                          'für diesen Kunden vorhanden.'
                      .hc,
                ),
              );
            }
            return Column(
              children: [
                const CardSectionTitle(
                  title: 'Wähle ein Nutzenlayout oder erstelle ein Neues',
                ),
                const SizedBox(height: AppSpace.l),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const SizedBox(width: AppSpace.m),
                                AppText(
                                  'Bereits verwendete Layouts'.hc,
                                  style: context.appTheme.textStyles.h2,
                                ),
                              ],
                            ),
                            const SizedBox(height: UiConstants.elementMargin),
                            const AppDivider(),
                            Flexible(
                              child: AppScrollbar(
                                controller: scrollController,
                                child: ListView.separated(
                                  padding: const EdgeInsets.all(AppSpace.m),
                                  controller: scrollController,
                                  shrinkWrap: true,
                                  itemCount: matchingNutzenlayouts.length,
                                  separatorBuilder: (context, index) =>
                                      const AppListViewSeperator.space(),
                                  itemBuilder: (context, index) {
                                    final layout = matchingNutzenlayouts[index];
                                    final idx = layout.id;
                                    return _NutzenLayoutTile(
                                      key: ValueKey(idx.toString()),
                                      nutzenlayout: layout,
                                      salesOrderId: salesOrderId,
                                      navigatorKey: navigatorKey,
                                      sessionId: sessionId,
                                      pageController: pageController,
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const AppDivider.vertical(),
                      Flexible(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const SizedBox(width: AppSpace.m),
                                AppText(
                                  'Nicht verwendete Layouts'.hc,
                                  style: context.appTheme.textStyles.h2,
                                ),
                              ],
                            ),
                            const SizedBox(height: UiConstants.elementMargin),
                            const AppDivider(),
                            Flexible(
                              child: AppScrollbar(
                                controller: scrollController2,
                                child: ListView.separated(
                                  padding: const EdgeInsets.all(AppSpace.m),
                                  controller: scrollController2,
                                  shrinkWrap: true,
                                  itemCount: nonMatchingNutzenlayouts.length,
                                  separatorBuilder: (context, index) =>
                                      const AppListViewSeperator.space(),
                                  itemBuilder: (context, index) {
                                    final layout =
                                        nonMatchingNutzenlayouts[index];
                                    final idx = layout.id;
                                    return _NutzenLayoutTile(
                                      key: ValueKey(idx.toString()),
                                      nutzenlayout: layout,
                                      salesOrderId: salesOrderId,
                                      navigatorKey: navigatorKey,
                                      sessionId: sessionId,
                                      pageController: pageController,
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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

class _NutzenLayoutTile extends HookConsumerWidget {
  const _NutzenLayoutTile({
    required this.nutzenlayout,
    required this.salesOrderId,
    required this.navigatorKey,
    required this.sessionId,
    required this.pageController,
    super.key,
  });
  final Nutzenlayout nutzenlayout;

  final int salesOrderId;
  final GlobalKey<NavigatorState> navigatorKey;
  final String sessionId;
  final PageController pageController;
  String offset(String locale) {
    final offsets =
        nutzenlayout.columns.map((column) => column.offset).toList();

    // Check if all reihen have the same offset
    final allSameOffset = offsets.isNotEmpty &&
        offsets.every((offset) => offset == offsets.first);

    if (allSameOffset) {
      // If all offsets are equal, only return the number once
      return offsets.first.formatted(locale);
    } else {
      // Otherwise return the joined string with dashes
      return offsets.map((offset) => offset.formatted(locale)).join('-');
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final generalColors = context.appTheme.generalColors;
    final borderRadiuses = context.appTheme.borderRadiuses;
    final l10n = context.l10n;
    final locale = l10n.localeName;

    final isLayoutHovered = useState<bool>(false);
    final isContainerHovered = useState<bool>(false);

    return ElbMouseRegionGestureDetector(
      cursor: SystemMouseCursors.click,
      onEnter: (event) {
        if (context.mounted) {
          isContainerHovered.value = true;
          isLayoutHovered.value = false;
        }
      },
      onExit: (event) {
        if (context.mounted) {
          isContainerHovered.value = false;
          isLayoutHovered.value = false;
        }
      },
      onTap: () {
        ref
            .read(
              selectedExistingMultiNutzenlayoutStateProvider(sessionId)
                  .notifier,
            )
            .updateSelectedNutzenlayout(nutzenlayout);
        ref
            .read(
              multiNutzenLayoutStateProvider(sessionId).notifier,
            )
            .initalizeExistingNutzenlayout(nutzenlayout);
        pageController.animateToPage(
          3,
          duration: AnimationConstants.shortDuration,
          curve: Curves.easeInOut,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: generalColors.transparent,
          border: Border.all(
            color: isContainerHovered.value
                ? generalColors.primary
                : generalColors.primarySurfaceBorder,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(borderRadiuses.m),
        ),
        padding: const EdgeInsets.all(AppSpace.m),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 1,
              child: Column(
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: AppText(
                          nutzenlayout.description,
                          style: context.appTheme.textStyles.h2,
                          maxLines: 1,
                          autoSize: false,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpace.m),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: AppSpace.xl,
                        children: [
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: AppSpace.s,
                              children: [
                                LabeledValueRow(
                                  title: 'Maße'.hc,
                                  value:
                                      nutzenlayout.formattedDimensions(locale),
                                  width: constraints.maxWidth,
                                ),
                                LabeledValueRow(
                                  title: 'Drucklänge'.hc,
                                  value: nutzenlayout
                                      .formattedDrucklaengeAndZaehne(
                                    locale,
                                  ),
                                  width: constraints.maxWidth,
                                ),
                                LabeledValueRow(
                                  title: 'Laufrichtung'.hc,
                                  value:
                                      nutzenlayout.laufrichtung.readable(l10n),
                                  width: constraints.maxWidth,
                                ),
                                LabeledValueRow(
                                  title: 'Matrix'.hc,
                                  value: nutzenlayout.matrix,
                                  width: constraints.maxWidth,
                                ),
                                LabeledValueRow(
                                  title: 'Offset'.hc,
                                  value: offset(locale),
                                  width: constraints.maxWidth,
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(width: AppSpace.m),

            // Layout preview
            MouseRegion(
              cursor: SystemMouseCursors.click,
              onEnter: (event) {
                if (context.mounted) {
                  isLayoutHovered.value = true;
                  isContainerHovered.value = false;
                }
              },
              onExit: (event) {
                if (context.mounted) {
                  isLayoutHovered.value = false;
                  isContainerHovered.value = true;
                }
              },
              child: GestureDetector(
                onTap: () async {
                  await showDialog<void>(
                    context: context,
                    builder: (context) => Dialog.fullscreen(
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => Navigator.of(context).pop(),
                              child: InteractiveViewer(
                                boundaryMargin: const EdgeInsets.all(50),
                                minScale: 0.5,
                                maxScale: 8,
                                child: _Layout(
                                  nutzenlayout: nutzenlayout,
                                  navigatorKey: navigatorKey,
                                  sessionId: sessionId,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    _Layout(
                      nutzenlayout: nutzenlayout,
                      navigatorKey: navigatorKey,
                      sessionId: sessionId,
                    ),
                    if (isLayoutHovered.value)
                      ColoredBox(
                        color: Colors.black.withAppOpacity(0.5),
                        child: const ElbIcon(
                          AppIcons.zoom_in,
                          size: AppIconSize.xl,
                          color: Colors.white,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Layout extends HookConsumerWidget {
  const _Layout({
    required this.nutzenlayout,
    required this.navigatorKey,
    required this.sessionId,
  });
  final Nutzenlayout nutzenlayout;
  final String sessionId;
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final drucklaenge = nutzenlayout.drucklaenge;
    final heightLongestColumn = useMemoized(
      () {
        // Calculate the height of the longest reihe
        if (nutzenlayout.columns.isEmpty) {
          return 0.0;
        }

        var maxHeight = 0.0;
        for (final column in nutzenlayout.columns) {
          var columnHeight = column.offset;
          for (final cell in column.cells) {
            columnHeight += cell.height;
          }

          final gapVertical = column.gapVertical(nutzenlayout.drucklaenge) *
              column.cells.length;

          columnHeight += gapVertical;

          if (columnHeight > maxHeight) {
            maxHeight = columnHeight;
          }
        }

        return maxHeight;
      },
      [nutzenlayout],
    );

    return SizedBox(
      height: 180,
      child: FittedBox(
        child: NutzenlayoutMatrixView(
          nutzenlayout: nutzenlayout,
          navigatorKey: navigatorKey,
          sessionId: sessionId,
          isExistingMultiNutzenlayout: true,
        ),
      ),
    );
  }
}
