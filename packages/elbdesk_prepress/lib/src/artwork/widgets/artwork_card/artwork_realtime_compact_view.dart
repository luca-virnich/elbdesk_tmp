import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/elbdesk_prepress.dart';
import 'package:elbdesk_prepress/src/app_table_cell_artwork_color.dart';
import 'package:elbdesk_prepress/src/artwork/extensions/artwork_die_cutter_type_extension.dart';
import 'package:elbdesk_prepress/src/artwork/extensions/artwork_print_process_type_ext.dart';
import 'package:elbdesk_prepress/src/artwork/extensions/artwork_type_ext.dart';
import 'package:elbdesk_sales/l10n/elb_sales_localizations.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

class ArtworkRealtimeCompactView extends ConsumerWidget {
  const ArtworkRealtimeCompactView({
    required this.artworkId,
    required this.sessionId,
    super.key,
  });
  final int artworkId;
  final String sessionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final artwork =
        ref.watch(watchArtworkRealtimeProvider(artworkId, sessionId));
    return artwork.fastWhen(
      data: (artwork) {
        if (artwork == null) {
          return const SizedBox.shrink();
        }
        return _ArtworkPreviewTile(artwork: artwork);
      },
    );
  }
}

class _ArtworkPreviewTile extends ConsumerWidget {
  const _ArtworkPreviewTile({
    required this.artwork,
  });
  final Artwork artwork;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final generalColors = context.appTheme.generalColors;
    final borderRadiuses = context.appTheme.borderRadiuses;
    final l10n = context.l10n;
    final ppL10n = context.prepressL10n;

    return Container(
      decoration: BoxDecoration(
        color: generalColors.background,
        border: Border.all(
          color: generalColors.primarySurfaceBorder,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(borderRadiuses.m),
      ),
      padding: const EdgeInsets.all(AppSpace.m),
      child: LayoutBuilder(
        builder: (context, constraints) {
          const firstBreakpoint = 750;
          const secondBreakpoint = 574;
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // title
                        AppOpenInNewTextButton(
                          label: artwork
                              .fullArtworkIdWithProduct(artwork.product!),
                          onPressed: () {
                            ref.openWindow(
                              FloatingArtworkWindowData(
                                artworkId: artwork.meta.id,
                                customerId: artwork.customer!.meta.id!,
                              ),
                            );
                          },
                        ),

                        // Colors
                        if (artwork.colors.isNotEmpty) ...[
                          const SizedBox(height: AppSpace.s),
                          _Colors(colors: artwork.colors),
                          const SizedBox(height: AppSpace.xl),
                        ] else ...[
                          const SizedBox(height: AppSpace.m),
                        ],

                        // Info
                        ElbTwoColumnWrap(
                          customL10n: ppL10n,
                          readOnly: false,
                          validationGroupId: null,
                          width: constraints.maxWidth > firstBreakpoint
                              ? constraints.maxWidth * 2 / 3
                              : constraints.maxWidth,
                          breakpoint: constraints.maxWidth < secondBreakpoint
                              ? double.infinity
                              : 0,
                          runSpacing: AppSpace.s,
                          columnLeft: [
                            ElbTwoColumnWrapCustomItem<ElbSalesLocalizations>(
                              label: '',
                              readOnly: true,
                              childBuilder: (labelPosition) =>
                                  _RowForArtworkInfo(
                                title: ppL10n.artwork_version_deducation,
                                value: '${artwork.version} / ${artwork.abzug}',
                                width: constraints.maxWidth,
                              ),
                            ),
                            ElbTwoColumnWrapCustomItem<ElbSalesLocalizations>(
                              label: '',
                              readOnly: true,
                              childBuilder: (labelPosition) =>
                                  _RowForArtworkInfo(
                                title: ppL10n.artwork_short_description,
                                value: artwork.description,
                                width: constraints.maxWidth,
                              ),
                            ),
                            ElbTwoColumnWrapCustomItem<ElbSalesLocalizations>(
                              label: '',
                              readOnly: true,
                              childBuilder: (labelPosition) =>
                                  _RowForArtworkInfo(
                                title: ppL10n.artwork_reference,
                                value: artwork.reference,
                                width: constraints.maxWidth,
                              ),
                            ),
                          ],
                          columnRight: [
                            ElbTwoColumnWrapCustomItem<ElbSalesLocalizations>(
                              label: '',
                              readOnly: true,
                              childBuilder: (labelPosition) =>
                                  _RowForArtworkInfo(
                                title: ppL10n.artwork_dimensions,
                                value:
                                    '${artwork.width.formatted(l10n.localeName)} '
                                    'x ${artwork.height.formatted(l10n.localeName)}',
                                width: constraints.maxWidth,
                              ),
                            ),
                            ElbTwoColumnWrapCustomItem<ElbSalesLocalizations>(
                              label: '',
                              readOnly: true,
                              childBuilder: (labelPosition) =>
                                  _RowForArtworkInfo(
                                title:
                                    l10n.artwork_history_die_cutter_and_radius,
                                value:
                                    '${artwork.dieCutterType?.readable(ppL10n)} '
                                    '/ ${artwork.cornerRadius.formatted(l10n.localeName)}',
                                width: constraints.maxWidth,
                              ),
                            ),
                            ElbTwoColumnWrapCustomItem<ElbSalesLocalizations>(
                              label: '',
                              readOnly: true,
                              childBuilder: (labelPosition) =>
                                  _RowForArtworkInfo(
                                title: ppL10n.artwork_type,
                                value:
                                    artwork.artworkType?.readable(ppL10n) ?? '',
                                width: constraints.maxWidth,
                              ),
                            ),
                            ElbTwoColumnWrapCustomItem<ElbSalesLocalizations>(
                              label: '',
                              readOnly: true,
                              childBuilder: (labelPosition) =>
                                  _RowForArtworkInfo(
                                title: ppL10n.main_print_process,
                                value: artwork.printProcessType
                                        ?.readable(ppL10n) ??
                                    '',
                                width: constraints.maxWidth,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  if (constraints.maxWidth > firstBreakpoint)
                    const Flexible(
                      child: Center(
                        child: ArtworkImage(),
                      ),
                    ),
                ],
              ),
              if (constraints.maxWidth < firstBreakpoint)
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: AppSpace.l,
                    ),
                    child: ArtworkImage(),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class _RowForArtworkInfo extends StatelessWidget {
  const _RowForArtworkInfo({
    required this.title,
    required this.value,
    required this.width,
  });

  final String title;
  final String value;
  final double width;

  @override
  Widget build(BuildContext context) {
    final generalColors = context.appTheme.generalColors;

    return Row(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(minWidth: 20, maxWidth: width / 2),
          child: AppText(title, maxLines: 1),
        ),

        // Connecting line
        if (value.isNotEmpty)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: AppSpace.s,
                right: AppSpace.s,
                top: 13,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 1,
                  color:
                      generalColors.primarySurfaceBorder.withAppOpacity(0.75),
                ),
              ),
            ),
          ),

        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: width / 2.5),
          child: AppText(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class _Colors extends StatelessWidget {
  const _Colors({
    required this.colors,
  });
  final List<ArtworkColor> colors;

  @override
  Widget build(BuildContext context) {
    const maxColorsToShow = 7;
    final hasMoreColors = colors.length > maxColorsToShow;
    final visibleColors =
        hasMoreColors ? colors.sublist(0, maxColorsToShow) : colors;

    return AppWrap(
      spacing: AppSpace.s,
      runSpacing: AppSpace.s,
      alignment: WrapAlignment.start,
      children: [
        ...List.generate(
          visibleColors.length,
          (index) => AppTableCellArtworkColor(
            color: visibleColors[index],
            isLoading: false,
          ),
        ),
        if (hasMoreColors)
          const AppText(
            '. . .',
          ),
      ],
    );
  }
}
