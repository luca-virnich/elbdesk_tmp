import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations_ext.dart';
import 'package:elbdesk_prepress/src/artwork/config/artwork_fields.dart';
import 'package:elbdesk_prepress/src/artwork/config/artwork_history_provider.dart';
import 'package:elbdesk_prepress/src/artwork/extensions/artwork_die_cutter_type_extension.dart';
import 'package:elbdesk_prepress/src/artwork/extensions/artwork_print_process_type_ext.dart';
import 'package:elbdesk_prepress/src/artwork/extensions/artwork_type_ext.dart';
import 'package:elbdesk_prepress/src/artwork/widgets/artwork_card/artwork_codes_view.dart';
import 'package:elbdesk_prepress/src/artwork_shared/widgets/artwork_color_table/artwork_color_table.dart';
import 'package:elbdesk_prepress/src/artwork_shared/widgets/artwork_layer_table/artwork_layer_table.dart';
import 'package:elbdesk_prepress/src/artwork_shared/widgets/artwork_trapping/artwork_trapping.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:project_core/project_core.dart';

class ArtworkHistoryCardItem extends ConsumerWidget {
  const ArtworkHistoryCardItem({
    required this.artwork,
    required this.masterArtworkId,
    required this.navigatorKey,
    required this.floatingWindowId,
    required this.floatingWindowFocus,
    super.key,
  });
  final Artwork? artwork;
  final int masterArtworkId;
  final GlobalKey<NavigatorState> navigatorKey;
  final String floatingWindowId;
  final FocusNode floatingWindowFocus;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final ppL10n = context.prepressL10n;

    final suffixColor =
        context.appTheme.generalColors.onBackground.withAppOpacity(0.5);
    final crmL10n = context.crmL10n;

    return ScrollableCardItem.constrained(
      builder: (context, constraints) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElbTwoColumnWrap(
              width: constraints.maxWidth,
              readOnly: true,
              validationGroupId: null,
              customL10n: ppL10n,
              columnLeft: [
                ElbTwoColumnWrapCustomItem<ElbPrepressLocalizations>(
                  label: '',
                  childBuilder: (labelPosition) {
                    return NextCardLinkField(
                      label: ppL10n.sales_sales_order_singular,
                      onPressed: () {
                        ref.openWindow(
                          FloatingSalesOrderWindowData(
                            salesOrderId: artwork!.salesOrderId,
                          ),
                        );
                      },
                      text: artwork!.salesOrder!.fullSalesOrderId,
                      labelPosition: labelPosition,
                    );
                  },
                ),
                ElbTwoColumnWrapCustomItem<ElbPrepressLocalizations>(
                  label: '',
                  childBuilder: (labelPosition) {
                    return NextCardLinkField(
                      label: crmL10n.customer_singular,
                      onPressed: () {
                        ref.openWindow(
                          FloatingCustomerWindowData(
                            customerId: artwork!.customer!.id,
                          ),
                        );
                      },
                      text: artwork!.customer!.contact!.general.name,
                      labelPosition: labelPosition,
                    );
                  },
                ),
                ElbTwoColumnWrapCustomItem<ElbPrepressLocalizations>(
                  label: '',
                  childBuilder: (labelPosition) {
                    return NextCardLinkField(
                      label: ppL10n.product,
                      onPressed: () {
                        ref.openWindow(
                          FloatingProductWindowData(
                            salesOrderId: artwork!.salesOrderId,
                            productId: artwork!.product!.meta.id,
                          ),
                        );
                      },
                      text: artwork!.product!.fullProductId,
                      labelPosition: labelPosition,
                    );
                  },
                ),
                ElbTwoColumnItem.text(
                  field: ArtworkFields.fromEnum(ArtworkField.description),
                  initialValue: artwork!.description,
                  readOnly: true,
                  onChanged: (p0) {},
                ),
              ],
              columnRight: [
                if (artwork!.product!.productType == ProductType.multilayer)
                  ElbTwoColumnItem.integer(
                    field: ArtworkFields.fromEnum(ArtworkField.layerId),
                    initialValue: artwork!.layerId,
                    readOnly: true,
                    onChanged: (value) {},
                  ),
                ElbTwoColumnItem.text(
                  field: ArtworkFields.fromEnum(ArtworkField.artworkType),
                  initialValue: artwork!.artworkType?.readable(ppL10n) ?? '',
                  readOnly: true,
                  onChanged: (value) {},
                ),
                ElbTwoColumnWrapCustomItem<ElbPrepressLocalizations>(
                  label: '',
                  childBuilder: (labelPosition) {
                    return Row(
                      children: [
                        SizedBox(
                          width: UiConstants.leftLabelWidth,
                          child: NextAppFieldLeftLabel(
                            label: ppL10n.artwork_dimensions,
                            maxLines: 1,
                          ),
                        ),
                        Expanded(
                          child: NextCardFormField.double(
                            showLabel: false,
                            initialDouble: artwork!.width,
                            labelPosition: labelPosition,
                            readOnly: true,
                            label: ppL10n.artwork_width,
                            onChanged: (value) {},
                            validationGroup: null,
                            suffix: AppText(
                              l10n.gen_unit_mm,
                              color: suffixColor,
                            ),
                          ),
                        ),
                        const SizedBox(width: UiConstants.defaultPadding),
                        Expanded(
                          child: NextCardFormField.double(
                            initialDouble: artwork!.height,
                            labelPosition: labelPosition,
                            readOnly: true,
                            label: ppL10n.artwork_height,
                            showLabel: false,
                            onChanged: (value) {},
                            validationGroup: null,
                            suffix: AppText(
                              l10n.gen_unit_mm,
                              color: suffixColor,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
                ElbTwoColumnWrapCustomItem<ElbPrepressLocalizations>(
                  label: '',
                  childBuilder: (labelPosition) {
                    return NextCardMultiField(
                      label: l10n.artwork_history_die_cutter_and_radius,
                      labelPosition: labelPosition,
                      fields: [
                        NextCardFormField.text(
                          validationGroup: null,
                          onChanged: null,
                          labelPosition: labelPosition,
                          label: ppL10n.layer_type_die_cutter,
                          showLabel: false,
                          initialText: artwork!.dieCutterType?.readable(
                                ppL10n,
                              ) ??
                              '',
                          readOnly: true,
                        ),
                        Consumer(
                          builder: (context, ref, child) {
                            return Opacity(
                              opacity: artwork!.dieCutterType ==
                                      ArtworkDieCutterType.circle
                                  ? 0.1
                                  : 1,
                              child: NextCardFormField.double(
                                labelPosition: labelPosition,
                                readOnly: true,
                                label: ppL10n.artwork_corner_radius,
                                focusOrder: 7.2,
                                initialDouble: artwork!.cornerRadius,
                                suffix: AppText(
                                  l10n.gen_unit_mm,
                                  color: suffixColor,
                                ),
                                showLabel: false,
                                onChanged: null,
                                validationGroup: null,
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),
                ElbTwoColumnItem.text(
                  field: ArtworkFields.fromEnum(ArtworkField.printProcessType),
                  initialValue:
                      artwork!.printProcessType?.readable(ppL10n) ?? '',
                  readOnly: true,
                  onChanged: (p0) {},
                ),
              ],
            ),
            const CardSectionDivider(),
            ArtworkColorsTable(
              floatingWindowId: floatingWindowId,
              onCopy: null,
              onMoveUp: null,
              onMoveDown: null,
              onUpdateCustomText: null,
              onAddColor: null,
              customerId: null,
              dataProvider: watchArtworkHistoryColorsProvider(artwork!.colors),
              onUpdateColorName: null,
              onResetColorName: null,
              onSelectColorSpecType: null,
              onSelectPrintProcess: null,
              onUpdateScreenLineature: null,
              onSelectVerarbeitungsEbene: null,
              onSelectColorType: null,
              onUpdateScreenAngle: null,
              onUpdateScreenPointForm: null,
              onDelete: null,
              onUpdateBoost: null,
              readOnly: true,
              navigatorKey: navigatorKey,
              sessionId: '1',
              floatingWindowFocus: floatingWindowFocus,
              componentIdentifier:
                  ComponentIdentifier.artworkHistoryCardCodesColorsTable,
            ),
            const CardSectionDivider(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ArtworkLayerTable(
                    readOnly: true,
                    onAddLayer: null,
                    onMoveUp: null,
                    onMoveDown: null,
                    sessionId: '1',
                    floatingWindowId: null,
                    navigatorKey: null,
                    floatingWindowFocus: floatingWindowFocus,
                    dataProvider: watchArtworkHistoryLayersProvider(
                      artwork!.layers,
                    ),
                    onDelete: null,
                    onUpdateName: null,
                    onSelectLayerType: null,
                    onUpdatePrintable: null,
                    onUpdateLocked: null,
                    componentIdentifier:
                        ComponentIdentifier.artworkHistoryCardCodesLayersTable,
                  ),
                ),
                const SizedBox(width: UiConstants.defaultPadding),
                Expanded(
                  child: ArtworkTrappingAndBleed(
                    initialBleed: artwork!.anschnitt,
                    initialTrapping: artwork!.trapping,
                    readOnly: true,
                    width: (constraints.maxWidth / 2) -
                        (UiConstants.defaultPadding / 2),
                    onBleedChanged: (value) {},
                    onTrappingNormalChanged: (value) {},
                    onTrappingBlackChanged: (value) {},
                    onTrappingBilderChanged: (value) {},
                    onTrappingSonderfarbenChanged: (value) {},
                    onTrappingRueckzugChanged: (value) {},
                    identifier:
                        ComponentIdentifier.artworkHistoryCardTrappingAndBleed,
                  ),
                ),
              ],
            ),
            const CardSectionDivider(),
            const CardSectionDivider(),
            ArtworkCodesView(
              stateNotifier: null,
              maxWidth: constraints.maxWidth,
              inHistory: true,
              navigatorKey: navigatorKey,
              floatingWindowFocus: floatingWindowFocus,
              floatingWindowId: floatingWindowId,
              readOnly: true,
              codes: artwork!.codes,
              componentIdentifier: ComponentIdentifier.artworkHistoryCardCodes,
            ),
          ],
        );
      },
    );
  }
}
