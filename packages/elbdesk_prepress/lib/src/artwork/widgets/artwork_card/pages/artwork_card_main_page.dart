part of '../artwork_card.dart';

class _ArtworkCardMainPage extends HookConsumerWidget {
  const _ArtworkCardMainPage({
    required this.stateNotifier,
    required this.initialEntity,
    required this.readOnly,
    required this.floatingWindowId,
    required this.navigatorKey,
    required this.artworkSessionId,
    required this.floatingWindowFocus,
    required this.customerId,
    required this.entityId,
  });
  final ArtworkState stateNotifier;
  final int entityId;
  final Artwork initialEntity;
  final bool readOnly;
  final String floatingWindowId;
  final GlobalKey<NavigatorState> navigatorKey;
  final String artworkSessionId;
  final FocusNode floatingWindowFocus;
  final int customerId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final cornerRadiusController = useTextEditingController(
      text: initialEntity.cornerRadius.toString(),
    );

    final suffixColor =
        context.appTheme.generalColors.onBackground.withAppOpacity(0.5);
    final ppL10n = context.prepressL10n;

    return ScrollableCardItem.constrained(
      builder: (context, constraints) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CollapsibleCardSection(
              title: ppL10n.artwork_general,
              identifier: ComponentIdentifier.artworkCardMainPageGeneral.name,
              trailingWidgets: [
                _SalesOrderItems(
                  artworkId: entityId,
                ),
                const SizedBox(width: UiConstants.elementMargin),
                _Nutzenlayouts(
                  artworkId: entityId,
                  salesOrderId: initialEntity.salesOrderId!,
                ),
                const SizedBox(width: UiConstants.defaultPadding * 3),
                AppOpenInNewTextButton(
                  onPressed: () {
                    ref.openWindow(
                      FloatingSalesOrderWindowData(
                        salesOrderId: initialEntity.salesOrderId,
                      ),
                    );
                  },
                  label: initialEntity.salesOrder!.fullSalesOrderId,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: UiConstants.elementMargin,
                  ),
                  child: AppText('/'),
                ),
                AppOpenInNewTextButton(
                  onPressed: () {
                    ref.openWindow(
                      FloatingCustomerWindowData(
                        customerId: initialEntity.customer!.id,
                      ),
                    );
                  },
                  label: initialEntity.customer!.contact!.general.name,
                ),
              ],
              child: Row(
                children: [
                  Flexible(
                    flex: 2,
                    child: ElbTwoColumnWrap(
                      width: constraints.maxWidth / 3 * 2,
                      readOnly: readOnly,
                      validationGroupId: null,
                      customL10n: ppL10n,
                      columnLeft: [
                        ElbTwoColumnWrapCustomItem<ElbPrepressLocalizations>(
                          label: '',
                          childBuilder: (labelPosition) {
                            return NextCardLinkField(
                              label: ppL10n.product_singular,
                              onPressed: () {
                                ref.openWindow(
                                  FloatingProductWindowData(
                                    salesOrderId: initialEntity.salesOrderId,
                                    productId: initialEntity.product!.meta.id,
                                  ),
                                );
                              },
                              text: initialEntity.product!.fullProductId,
                              labelPosition: labelPosition,
                            );
                          },
                        ),
                        //TOOD(all): Refactor to new MultiItem
                        ElbTwoColumnWrapCustomItem<ElbPrepressLocalizations>(
                          label: '',
                          childBuilder: (labelPosition) {
                            return NextCardMultiField(
                              label: ppL10n.artwork_version_deducation,
                              labelPosition: labelPosition,
                              fields: [
                                // If not excluded it blocks the traversal
                                ExcludeFocus(
                                  child: NextCardFormField.int(
                                    showLabel: false,
                                    initialInt: initialEntity.version,
                                    labelPosition: labelPosition,
                                    readOnly: true,
                                    label: ppL10n.artwork_version,
                                    validationGroup: null,
                                    onChanged: null,
                                  ),
                                ),
                                NextCardFormField.int(
                                  showLabel: false,
                                  initialInt: initialEntity.abzug,
                                  labelPosition: labelPosition,
                                  readOnly: readOnly,
                                  label: ppL10n.artwork_deduction,
                                  focusOrder: 2,
                                  validationGroup: null,
                                  onChanged: (value) {
                                    final parsed = int.tryParse(value);
                                    if (parsed != null) {
                                      stateNotifier.updateAbzug(parsed);
                                    }
                                  },
                                ),
                              ],
                            );
                          },
                        ),

                        ElbTwoColumnItem.text(
                          field:
                              ArtworkFields.fromEnum(ArtworkField.description),
                          initialValue: initialEntity.description,
                          readOnly: readOnly,
                          onChanged: stateNotifier.updateDescription,
                        ),
                        ElbTwoColumnItem.text(
                          field: ArtworkFields.fromEnum(ArtworkField.reference),
                          initialValue: initialEntity.reference,
                          readOnly: readOnly,
                          onChanged: stateNotifier.updateReference,
                        ),
                      ],
                      columnRight: [
                        // Type // Layer
                        if (initialEntity.product!.productType ==
                            ProductType.multilayer)
                          ElbTwoColumnItem.integer(
                            field: ArtworkFields.fromEnum(ArtworkField.layerId),
                            initialValue: initialEntity.layerId,
                            readOnly: readOnly,
                            onChanged: (value) {
                              if (value != null) {
                                stateNotifier.updateLayerId(value);
                              }
                            },
                          ),

                        //TOOD(all): Refactor to new MultiItem
                        ElbTwoColumnWrapCustomItem<ElbPrepressLocalizations>(
                          label: '',
                          childBuilder: (labelPosition) {
                            return NextCardMultiField(
                              label: ppL10n.artwork_dimensions,
                              labelPosition: labelPosition,
                              fields: [
                                NextCardFormField.double(
                                  emptyWhenZero: false,
                                  showLabel: false,
                                  initialDouble: initialEntity.width,
                                  labelPosition: labelPosition,
                                  readOnly: readOnly,
                                  label: ppL10n.artwork_width,
                                  suffix: AppText(
                                    l10n.gen_unit_mm,
                                    color: suffixColor,
                                  ),
                                  focusOrder: 6,
                                  validator: ArtworkFields.fromEnum(
                                    ArtworkField.width,
                                  ).validator(l10n, ppL10n),
                                  onChanged: (value) {
                                    final parsed = Parser.parseDouble(value);
                                    stateNotifier.updateWidth(parsed ?? 0);
                                  },
                                  validationGroup: null,
                                ),
                                NextCardFormField.double(
                                  initialDouble: initialEntity.height,
                                  labelPosition: labelPosition,
                                  readOnly: readOnly,
                                  label: ppL10n.artwork_height,
                                  focusOrder: 7,
                                  suffix: AppText(
                                    l10n.gen_unit_mm,
                                    color: suffixColor,
                                  ),
                                  showLabel: false,
                                  onChanged: (value) {
                                    final parsed = Parser.parseDouble(value);
                                    stateNotifier.updateHeight(parsed ?? 0);
                                  },
                                  validationGroup: null,
                                ),
                              ],
                            );
                          },
                        ),

                        //TOOD(all): Refactor to new MultiItem
                        ElbTwoColumnWrapCustomItem<ElbPrepressLocalizations>(
                          label: '',
                          childBuilder: (labelPosition) {
                            return NextCardMultiField(
                              label: l10n.artwork_history_die_cutter_and_radius,
                              labelPosition: labelPosition,
                              fields: [
                                NextCardDropdownMenu<ArtworkDieCutterType>(
                                  dropdownMenuEntries:
                                      ArtworkDieCutterType.values
                                          .map(
                                            (type) => NextDropdownMenuEntry(
                                              value: type,
                                              label: type.readable(ppL10n),
                                            ),
                                          )
                                          .toList(),
                                  labelPosition: labelPosition,
                                  validationGroupId: null,
                                  label: ppL10n.layer_type_die_cutter,
                                  showLabel: false,
                                  initialValue:
                                      initialEntity.dieCutterType?.readable(
                                    ppL10n,
                                  ),
                                  focusOrderId: 7.1,
                                  readOnly: readOnly,
                                  onSelected: (v) {
                                    stateNotifier.updateDieCutterType(v);
                                    if (v == ArtworkDieCutterType.circle) {
                                      cornerRadiusController.clear();
                                    }
                                  },
                                ),
                                Consumer(
                                  builder: (context, ref, child) {
                                    final dieCutterType = ref.watch(
                                      artworkStateProvider(
                                        entityId,
                                        artworkSessionId,
                                      ).select(
                                        (value) =>
                                            value.requireValue.dieCutterType,
                                      ),
                                    );
                                    return Opacity(
                                      opacity: dieCutterType ==
                                              ArtworkDieCutterType.circle
                                          ? 0.1
                                          : 1,
                                      child: NextCardFormField.double(
                                        labelPosition: labelPosition,
                                        readOnly: readOnly ||
                                            dieCutterType ==
                                                ArtworkDieCutterType.circle,
                                        label: ppL10n.artwork_corner_radius,
                                        focusOrder: 7.2,
                                        controller: cornerRadiusController,
                                        suffix: AppText(
                                          l10n.gen_unit_mm,
                                          color: suffixColor,
                                        ),
                                        showLabel: false,
                                        onChanged: (value) {
                                          final parsed =
                                              Parser.parseDouble(value);
                                          stateNotifier.updateCornerRadius(
                                            parsed ?? 0,
                                          );
                                        },
                                        validationGroup: null,
                                      ),
                                    );
                                  },
                                ),
                              ],
                            );
                          },
                        ),
                        ElbTwoColumnDropdown.text(
                          field:
                              ArtworkFields.fromEnum(ArtworkField.artworkType),
                          onChanged: stateNotifier.updateArtworkType,
                          initialValue: initialEntity.artworkType,
                          readOnly: readOnly,
                        ),

                        ElbTwoColumnDropdown.text(
                          field: ArtworkFields.fromEnum(
                            ArtworkField.printProcessType,
                          ),
                          initialValue: initialEntity.printProcessType,
                          readOnly: readOnly,
                          onChanged:
                              stateNotifier.updateArtworkPrintProcessType,
                        ),
                      ],
                    ),
                  ),
                  // Image
                  const Flexible(
                    flex: 1,
                    child: Align(
                      child: ArtworkImage(),
                    ),
                  ),
                ],
              ),
            ),
            const CardSectionDivider(),

            // Quarantine Colors
            // Area is only shown if we have a quarantine id
            // And only then it checks if there are colors in the quarantine
            if (initialEntity.artworkQuarantineId != null)
              _ColorTable(
                initialEntity: initialEntity,
                floatingWindowId: floatingWindowId,
                stateNotifier: stateNotifier,
                customerId: customerId,
                readOnly: readOnly,
                navigatorKey: navigatorKey,
                artworkSessionId: artworkSessionId,
                floatingWindowFocus: floatingWindowFocus,
              ),

            // Actual Colors
            ArtworkColorsTable(
              componentIdentifier:
                  ComponentIdentifier.artworkCardMainPageColorsTable,
              onUpdateCustomText: stateNotifier.updateColorCustomText,
              floatingWindowId: floatingWindowId,
              onCopy: stateNotifier.copyColor,
              onMoveUp: stateNotifier.moveColorUp,
              onMoveDown: stateNotifier.moveColorDown,
              onAddColor: stateNotifier.addBlankColor,
              customerId: customerId,
              dataProvider:
                  watchArtworkColorsProvider(entityId, artworkSessionId),
              onUpdateColorName: stateNotifier.updateColorName,
              onResetColorName: stateNotifier.resetColorName,
              onSelectColorSpecType: stateNotifier.updateColorSpecType,
              onSelectPrintProcess: stateNotifier.updateColorPrintProcess,
              onUpdateScreenLineature: stateNotifier.updateColorScreenLineature,
              onSelectVerarbeitungsEbene:
                  stateNotifier.updateColorVerarbeitungsEbene,
              onSelectColorType: stateNotifier.updateColorType,
              onUpdateScreenAngle: stateNotifier.updateColorScreenAngle,
              onUpdateScreenPointForm: stateNotifier.updateColorScreenPointForm,
              onDelete: stateNotifier.deleteColor,
              onUpdateBoost: stateNotifier.updateColorBoost,
              readOnly: readOnly,
              navigatorKey: navigatorKey,
              sessionId: artworkSessionId,
              floatingWindowFocus: floatingWindowFocus,
            ),
            const CardSectionDivider(),
            // Layers
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: FocusTraversalGroup(
                    child: ArtworkLayerTable(
                      componentIdentifier:
                          ComponentIdentifier.artworkCardMainPageLayerTable,
                      readOnly: readOnly,
                      onAddLayer: stateNotifier.addBlankLayer,
                      sessionId: artworkSessionId,
                      floatingWindowId: floatingWindowId,
                      navigatorKey: navigatorKey,
                      floatingWindowFocus: floatingWindowFocus,
                      dataProvider: watchArtworkLayersProvider(
                        entityId,
                        artworkSessionId,
                      ),
                      onDelete: stateNotifier.deleteLayer,
                      onMoveUp: stateNotifier.moveLayerUp,
                      onMoveDown: stateNotifier.moveLayerDown,
                      onUpdateName: stateNotifier.updateLayerName,
                      onSelectLayerType: stateNotifier.updateLayerType,
                      onUpdatePrintable: stateNotifier.updateLayerPrintable,
                      onUpdateLocked: stateNotifier.updateLayerLocked,
                    ),
                  ),
                ),
                const SizedBox(width: UiConstants.defaultPadding * 3),
                Expanded(
                  child: ArtworkTrappingAndBleed(
                    initialBleed: initialEntity.anschnitt,
                    initialTrapping: initialEntity.trapping,
                    readOnly: readOnly,
                    width: (constraints.maxWidth / 2) -
                        ((UiConstants.defaultPadding * 3) / 2),
                    onBleedChanged: stateNotifier.updateAnschnitt,
                    onTrappingNormalChanged: stateNotifier.updateTrappingNormal,
                    onTrappingBlackChanged: stateNotifier.updateTrappingBlack,
                    onTrappingBilderChanged: stateNotifier.updateTrappingBilder,
                    onTrappingSonderfarbenChanged:
                        stateNotifier.updateTrappingSonderfarben,
                    onTrappingRueckzugChanged:
                        stateNotifier.updateTrappingRueckzug,
                    identifier:
                        ComponentIdentifier.artworkCardMainPageTrappingAndBleed,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class _ColorTable extends ConsumerWidget {
  const _ColorTable({
    required this.initialEntity,
    required this.floatingWindowId,
    required this.stateNotifier,
    required this.customerId,
    required this.readOnly,
    required this.navigatorKey,
    required this.artworkSessionId,
    required this.floatingWindowFocus,
  });

  final Artwork initialEntity;
  final String floatingWindowId;
  final ArtworkState stateNotifier;
  final int customerId;
  final bool readOnly;
  final GlobalKey<NavigatorState> navigatorKey;
  final String artworkSessionId;
  final FocusNode floatingWindowFocus;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO(tk): Optimize this
    final artworkQuarantineColorsAsync = ref.watch(
      fetchArtworkQuarantineColorsProvider(
        initialEntity.artworkQuarantineId!,
      ),
    );
    final artworkQuarantine = ref.watch(
      fetchArtworkQuarantineProvider(
        initialEntity.artworkQuarantineId!,
      ),
    );

    return artworkQuarantineColorsAsync.fastWhen(
      data: (data) {
        if (data.isNotEmpty) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ArtworkQuarantineColorsTable(
                  componentIdentifier: ComponentIdentifier
                      .artworkCardMainPageQuarantineColorsTable,
                  floatingWindowId: floatingWindowId,
                  onAcceptColor: stateNotifier.addColor,
                  customerId: customerId,
                  dataProvider: fetchArtworkQuarantineColorsProvider(
                    initialEntity.artworkQuarantineId!,
                  ),
                  readOnly: readOnly,
                  navigatorKey: navigatorKey,
                  sessionId: artworkSessionId,
                  floatingWindowFocus: floatingWindowFocus,
                ),
              ),
              const SizedBox(width: UiConstants.defaultPadding * 3),
              Expanded(
                child: artworkQuarantine.hasValue && !artworkQuarantine.hasError
                    ? ArtworkQuarantineMissingColorsTable(
                        showTitlebar: false,
                        artworkQuarantine: artworkQuarantine.requireValue!,
                        componentIdentifier: ComponentIdentifier
                            .artworkCardMainPageQuarantineMissingColorsTable,
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class _SalesOrderItems extends ConsumerWidget {
  const _SalesOrderItems({
    required this.artworkId,
  });

  final int artworkId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sois = ref.watch(
      watchSalesOrderItemsByArtworkProvider(
        artworkId,
      ),
    );
    return sois.fastWhen(
      data: (data) => SoiStatusTagWrap.statusLabel(
        salesOrderItems: data,
      ),
    );
  }
}

class _Nutzenlayouts extends ConsumerWidget {
  const _Nutzenlayouts({
    required this.artworkId,
    required this.salesOrderId,
  });
  final int artworkId;
  final int salesOrderId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nutzenlayouts = ref.watch(
      fetchAndWatchArtworkNutzenlayoutsBySalesOrderProvider(
        salesOrderId: salesOrderId,
        artworkId: artworkId,
      ),
    );
    return nutzenlayouts.fastWhen(
      data: (layouts) {
        return AppWrap(
          children: [
            for (final layout in layouts)
              NutzenlayoutTag(
                nutzenlayout: layout,
              ),
          ],
        );
      },
    );
  }
}
