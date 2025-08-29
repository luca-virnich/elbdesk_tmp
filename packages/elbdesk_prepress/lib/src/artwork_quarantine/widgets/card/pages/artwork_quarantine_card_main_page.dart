part of '../artwork_quarantine_in_group_card.dart';

/// Main page for displaying artwork quarantine information
class _ArtworkQuarantineCardMainPage extends HookConsumerWidget {
  const _ArtworkQuarantineCardMainPage({
    required this.stateNotifier,
    required this.artworkQuarantine,
    required this.readOnly,
    required this.floatingWindowId,
    required this.navigatorKey,
    required this.groupSessionId,
    required this.floatingWindowFocus,
    required this.customerId,
    required this.artworkQuarantineRuntimeId,
  });

  final ArtworkQuarantineGroupState stateNotifier;
  final String artworkQuarantineRuntimeId;
  final ArtworkQuarantine artworkQuarantine;
  final bool readOnly;
  final String floatingWindowId;
  final GlobalKey<NavigatorState> navigatorKey;
  final String groupSessionId;
  final FocusNode floatingWindowFocus;
  final int customerId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScrollableCardItem.constrained(
      builder: (context, constraints) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Top card fields
            _GeneralSection(
              quarantine: artworkQuarantine,
              constraints: constraints,
              floatingWindowFocus: floatingWindowFocus,
              floatingWindowId: floatingWindowId,
              navigatorKey: navigatorKey,
              stateNotifier: stateNotifier,
              readOnly: readOnly,
            ),
            const CardSectionDivider(),

            // Colors (read only)
            if (artworkQuarantine.artworkData.colors.isNotEmpty &&
                artworkQuarantine.meta.id != null) ...[
              const CardSectionDivider(),
              _QuarantineColorsSection(
                artworkQuarantine: artworkQuarantine,
                floatingWindowId: floatingWindowId,
                navigatorKey: navigatorKey,
                floatingWindowFocus: floatingWindowFocus,
                customerId: customerId,
                sessionId: groupSessionId,
              ),
              ArtworkQuarantineMissingColorsTable(
                artworkQuarantine: artworkQuarantine,
                componentIdentifier: ComponentIdentifier
                    .artworkQuarantineCardMainPageColorsTable,
              ),
            ],
          ],
        );
      },
    );
  }
}

/// General information section
class _GeneralSection extends HookConsumerWidget {
  const _GeneralSection({
    required this.quarantine,
    required this.constraints,
    required this.floatingWindowFocus,
    required this.floatingWindowId,
    required this.navigatorKey,
    required this.stateNotifier,
    required this.readOnly,
  });

  final ArtworkQuarantine quarantine;
  final BoxConstraints constraints;
  final FocusNode floatingWindowFocus;
  final String floatingWindowId;
  final GlobalKey<NavigatorState>? navigatorKey;
  final ArtworkQuarantineGroupState stateNotifier;
  final bool readOnly;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final suffixColor =
        context.appTheme.generalColors.onBackground.withAppOpacity(0.5);

    final widthController = useTextEditingController(
      text: quarantine.artworkData.width?.toString() ?? '',
    );

    final heightController = useTextEditingController(
      text: quarantine.artworkData.height?.toString() ?? '',
    );
    final ppL10n = context.prepressL10n;
    return Column(
      children: [
        CollapsibleCardSection(
          title: l10n.gen_general,
          identifier:
              ComponentIdentifier.artworkQuarantineCardMainPageGeneral.name,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ElbTwoColumnWrap(
                  width: constraints.maxWidth / 3 * 2,
                  readOnly: true,
                  validationGroupId: null,
                  customL10n: ppL10n,
                  columnLeft: [
                    ElbTwoColumnDropdown.selection(
                      readOnly: true,
                      field: ArtworkQuarantineFields.fromEnum(
                        ArtworkQuarantineField.status,
                      ),
                      value: quarantine.general.status,
                      onChanged: (value) {},
                    ),
                    ElbTwoColumnItem.text(
                      field: ArtworkQuarantineFields.fromEnum(
                        ArtworkQuarantineField.description,
                      ),
                      initialValue: quarantine.general.description,
                      readOnly: readOnly,
                      onChanged: (value) =>
                          stateNotifier.updateArtworkDescription(
                        quarantine.general.quarantineUuid,
                        value,
                      ),
                    ),
                    ElbTwoColumnItem.text(
                      field: ArtworkQuarantineFields.fromEnum(
                        ArtworkQuarantineField.keywords,
                      ),
                      initialValue: quarantine.general.keywords ?? '',
                      readOnly: readOnly,
                      onChanged: (value) => stateNotifier.updateArtworkKeywords(
                        quarantine.general.quarantineUuid,
                        value,
                      ),
                    ),
                    if (quarantine.group?.selectedProductSeriesId != null)
                      ElbTwoColumnItem.text(
                        field: ArtworkQuarantineFields.fromEnum(
                          ArtworkQuarantineField.productSeriesId,
                        ),
                        initialValue: quarantine.group?.selectedProductSeriesId
                            .toString(),
                        readOnly: true,
                        onChanged: (p0) {},
                      ),
                  ],
                  columnRight: [
                    ElbTwoColumnWrapCustomItem<ElbPrepressLocalizations>(
                      label: '',
                      childBuilder: (labelPosition) {
                        return // Dimensions
                            NextCardMultiField(
                          label: ppL10n.artwork_dimensions,
                          labelPosition: labelPosition,
                          fields: [
                            NextCardFormField.double(
                              emptyWhenZero: false,
                              showLabel: false,
                              controller: widthController,
                              labelPosition: labelPosition,
                              readOnly: readOnly,
                              label: ppL10n.artwork_width,
                              suffix: AppText(
                                l10n.gen_unit_mm,
                                color: suffixColor,
                              ),
                              validationGroup: null,
                              onChanged: readOnly
                                  ? null
                                  : (value) {
                                      final parsed = Parser.parseDouble(value);
                                      stateNotifier.updateArtworkWidth(
                                        quarantine.general.quarantineUuid,
                                        parsed,
                                      );
                                    },
                            ),
                            NextCardFormField.double(
                              emptyWhenZero: false,
                              showLabel: false,
                              controller: heightController,
                              labelPosition: labelPosition,
                              readOnly: readOnly,
                              label: ppL10n.artwork_height,
                              suffix: AppText(
                                l10n.gen_unit_mm,
                                color: suffixColor,
                              ),
                              validationGroup: null,
                              onChanged: readOnly
                                  ? null
                                  : (value) {
                                      final parsed = Parser.parseDouble(value);
                                      stateNotifier.updateArtworkHeight(
                                        quarantine.general.quarantineUuid,
                                        parsed,
                                      );
                                    },
                            ),
                          ],
                        );
                      },
                    ),
                    // Corner Radius
                    ElbTwoColumnItem.double(
                      field: ArtworkQuarantineFields.fromEnum(
                        ArtworkQuarantineField.cornerRadius,
                      ),
                      initialValue: quarantine.artworkData.cornerRadius,
                      readOnly: readOnly,
                      onChanged: (value) {
                        stateNotifier.updateArtworkCornerRadius(
                          quarantine.general.quarantineUuid,
                          value,
                        );
                      },
                    ),

                    ElbTwoColumnDropdown.text(
                      field: ArtworkQuarantineFields.fromEnum(
                        ArtworkQuarantineField.printProcessType,
                      ),
                      initialValue: quarantine.general.printProcessType,
                      onChanged: (value) {
                        stateNotifier.updateArtworkPrintProcessType(
                          quarantine.general.quarantineUuid,
                          value,
                        );
                      },
                    ),
                    ElbTwoColumnDropdown.text(
                      field: ArtworkQuarantineFields.fromEnum(
                        ArtworkQuarantineField.productType,
                      ),
                      initialValue: quarantine.general.productType,
                      onChanged: (value) {
                        stateNotifier.updateArtworkProductType(
                          quarantine.general.quarantineUuid,
                          value,
                        );
                      },
                    ),
                    ElbTwoColumnDropdown.text(
                      field: ArtworkQuarantineFields.fromEnum(
                        ArtworkQuarantineField.artworkType,
                      ),
                      initialValue: quarantine.general.type,
                      onChanged: (value) {
                        stateNotifier.updateArtworkType(
                          quarantine.general.quarantineUuid,
                          value,
                        );
                      },
                    ),
                  ],
                ),
              ),
              // PDF preview
              ArtworkQuarantineThumbnailPdf(
                quarantine: quarantine,
                height: 240,
                width: 180,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Colors section for displaying quarantine colors using ArtworkColorsTable
class _QuarantineColorsSection extends ConsumerWidget {
  const _QuarantineColorsSection({
    required this.floatingWindowId,
    required this.navigatorKey,
    required this.floatingWindowFocus,
    required this.customerId,
    required this.sessionId,
    required this.artworkQuarantine,
  });

  final String floatingWindowId;
  final GlobalKey<NavigatorState> navigatorKey;
  final FocusNode floatingWindowFocus;
  final int customerId;
  final String sessionId;
  final ArtworkQuarantine artworkQuarantine;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get colors directly from the group state for this specific quarantine

    return ArtworkQuarantineColorViewTable(
      componentIdentifier:
          ComponentIdentifier.artworkQuarantineCardMainPageColorsTable,
      title: 'Gefundene Farben'.hc,
      colors: artworkQuarantine.artworkData.colors,
    );
  }
}
