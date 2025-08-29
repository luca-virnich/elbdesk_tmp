import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/artwork_quarantine_group/config/artwork_quarantine_group_fields.dart';
import 'package:elbdesk_prepress/src/artwork_quarantine_group/extensions/artwork_quarantine_status_extension.dart';
import 'package:elbdesk_prepress/src/artwork_quarantine_group/logic/artwork_quarantine_group_state.dart';
import 'package:elbdesk_prepress/src/artwork_quarantine_group/widgets/artwork_quarantine_group_card/pages/artwork_quarantine_group_card_main_page/dialogs/artwork_quarantine_apply_settings_confirmation_dialog.dart';
import 'package:elbdesk_prepress/src/artwork_quarantine_group/widgets/artwork_quarantine_group_card/pages/artwork_quarantine_group_card_main_page/dialogs/artwork_quarantine_series_selection_dialog.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:project_core/project_core.dart';

/// General information section for the Artwork Quarantine Group
class ArtworkQuarantineGroupGeneral extends HookConsumerWidget {
  const ArtworkQuarantineGroupGeneral({
    required this.initialEntity,
    required this.stateNotifier,
    required this.readOnly,
    required this.sessionId,
    required this.navigatorKey,
    required this.floatingWindowFocus,
    required this.floatingWindowId,
    required this.width,
    super.key,
  });

  final ArtworkQuarantineGroup initialEntity;
  final ArtworkQuarantineGroupState stateNotifier;
  final bool readOnly;
  final String sessionId;
  final GlobalKey<NavigatorState> navigatorKey;
  final FocusNode floatingWindowFocus;
  final String floatingWindowId;
  final double width;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final ppL10n = context.prepressL10n;

    final widthController = useTextEditingController(
      text: initialEntity.width?.toString() ?? '',
    );

    final heightController = useTextEditingController(
      text: initialEntity.height?.toString() ?? '',
    );

    final seriesController = useTextEditingController(
      text: ref
              .read(
                artworkQuarantineGroupStateProvider(
                  initialEntity.meta.id!,
                  sessionId,
                ),
              )
              .requireValue
              .selectedProductSeriesId
              ?.toString() ??
          '',
    );

    return CollapsibleCardSection(
      trailingWidgets: [
        if (initialEntity.customer != null) ...[
          AppOpenInNewTextButton(
            onPressed: () {
              ref.openWindow(
                FloatingCustomerWindowData(
                  customerId: initialEntity.customer!.meta.id,
                ),
              );
            },
            label: initialEntity.customer!.contact!.general.name,
          ),
        ],
      ],
      title: l10n.gen_general,
      identifier:
          ComponentIdentifier.artworkQuarantineGroupCardMainPageGeneral.name,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElbTwoColumnWrap(
                width: width,
                customL10n: ppL10n,
                readOnly: readOnly,
                validationGroupId: null,
                columnLeft: [
                  ElbTwoColumnWrapCustomItem<ElbPrepressLocalizations>(
                    label: ppL10n.artwork_quarantine_status,
                    childBuilder: (labelPosition) {
                      return _QuarantineStatusButton(
                        group: initialEntity,
                        labelPosition: labelPosition,
                        stateNotifier: stateNotifier,
                        readOnly: true,
                        sessionId: sessionId,
                      );
                    },
                  ),
                  ElbTwoColumnItem.assignedUser(
                    field: ArtworkQuarantineGroupFields.fromEnum(
                      ArtworkQuarantineGroupField.assignedUser,
                    ),
                    initialValue: initialEntity.assignedUser,
                    onChanged: stateNotifier.updateAssignedUser,
                  ),
                  ElbTwoColumnItem.text(
                    field: ArtworkQuarantineGroupFields.fromEnum(
                      ArtworkQuarantineGroupField.description,
                    ),
                    initialValue: initialEntity.description,
                    onChanged: stateNotifier.updateGroupDescription,
                  ),
                  ElbTwoColumnWrapCustomItem<ElbPrepressLocalizations>(
                    label: '',
                    childBuilder: (labelPosition) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: UiConstants.leftLabelWidth,
                            child: AppText(
                              'Zuletzt an AE'.hc,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Consumer(
                            builder: (context, ref, _) {
                              final sendToAeAt = ref.watch(
                                artworkQuarantineGroupStateProvider(
                                  initialEntity.meta.id!,
                                  sessionId,
                                ).select(
                                  (state) => state.requireValue.sendToAeAt,
                                ),
                              );

                              return AppText(
                                sendToAeAt != null
                                    ? sendToAeAt.toDateAndTime(l10n.localeName)
                                    : '-',
                              );
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ],
                columnRight: [
                  // TODO(all): Refactor when trailing is available
                  ElbTwoColumnWrapTextItem<ElbPrepressLocalizations>(
                    field: ArtworkQuarantineGroupFields.fromEnum(
                      ArtworkQuarantineGroupField.selectedProductSeriesId,
                    ),
                    readOnly: true,
                    controller: seriesController,
                    onChanged: null,
                    outsideTrailingWidgets: [
                      AppButton.secondary(
                        label: ppL10n.product_series_select,
                        iconData: AppIcons.company,
                        onPressed: readOnly
                            ? null
                            : () async {
                                final selectedSeries =
                                    await showElbDialog<Product?>(
                                  context: context,
                                  child: ArtworkQuarantineSeriesSelectionDialog(
                                    groupId: initialEntity.meta.id!,
                                    sessionId: sessionId,
                                    floatingWindowId: floatingWindowId,
                                    parentNavigatorKey: navigatorKey,
                                    floatingWindowFocus: floatingWindowFocus,
                                    group: initialEntity,
                                  ),
                                );

                                if (selectedSeries != null) {
                                  stateNotifier.setSelectedProductSeries(
                                    selectedSeries.serienId,
                                  );
                                  seriesController.text =
                                      selectedSeries.serienId.toString();
                                }
                              },
                      ),
                    ],
                  ),
                  ElbTwoColumnDropdown.text(
                    field: ArtworkQuarantineGroupFields.fromEnum(
                      ArtworkQuarantineGroupField.printProcessType,
                    ),
                    initialValue: initialEntity.printProcessType,
                    onChanged: stateNotifier.updateGroupPrintProcessType,
                  ),
                  ElbTwoColumnDropdown.text(
                    field: ArtworkQuarantineGroupFields.fromEnum(
                      ArtworkQuarantineGroupField.productType,
                    ),
                    initialValue: initialEntity.productType,
                    onChanged: stateNotifier.updateProductType,
                  ),
                  ElbTwoColumnDropdown.text(
                    field: ArtworkQuarantineGroupFields.fromEnum(
                      ArtworkQuarantineGroupField.artworkType,
                    ),
                    initialValue: initialEntity.artworkType,
                    onChanged: stateNotifier.updateGroupType,
                  ),
                  ElbTwoColumnWrapMultiItem<ElbPrepressLocalizations>(
                    label: ppL10n.artwork_dimensions,
                    fields: [
                      NextCardFormField.double(
                        emptyWhenZero: false,
                        showLabel: false,
                        controller: widthController,
                        labelPosition: NextCardFormFieldLabelPosition.left,
                        readOnly: readOnly,
                        label: ppL10n.artwork_width,
                        suffix: AppText(
                          l10n.gen_unit_mm,
                          color: readOnly
                              ? context.appTheme.statusColors.disabled
                              : null,
                        ),
                        validationGroup: null,
                        onChanged: (value) {
                          final parsed = Parser.parseDouble(value);
                          stateNotifier.updateGroupWidth(parsed ?? 0);
                        },
                      ),
                      NextCardFormField.double(
                        emptyWhenZero: false,
                        showLabel: false,
                        controller: heightController,
                        labelPosition: NextCardFormFieldLabelPosition.left,
                        readOnly: readOnly,
                        label: ppL10n.artwork_height,
                        suffix: AppText(
                          l10n.gen_unit_mm,
                          color: readOnly
                              ? context.appTheme.statusColors.disabled
                              : null,
                        ),
                        validationGroup: null,
                        onChanged: (value) {
                          final parsed = Parser.parseDouble(value);
                          stateNotifier.updateGroupHeight(parsed ?? 0);
                        },
                      ),
                    ],
                  ),
                  ElbTwoColumnItem.double(
                    field: ArtworkQuarantineGroupFields.fromEnum(
                      ArtworkQuarantineGroupField.cornerRadius,
                    ),
                    initialValue: initialEntity.cornerRadius ?? 0,
                    onChanged: stateNotifier.updateGroupCornerRadius,
                  ),
                  ElbTwoColumnWrapCustomItem<ElbPrepressLocalizations>(
                    label: '',
                    childBuilder: (labelPosition) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 4, bottom: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            _ApplyGroudSettingsToOpenArtworksButton(
                              readOnly: readOnly,
                              floatingWindowId: floatingWindowId,
                              sessionId: sessionId,
                              groupId: initialEntity.meta.id!,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

class _ApplyGroudSettingsToOpenArtworksButton extends ConsumerWidget {
  const _ApplyGroudSettingsToOpenArtworksButton({
    required this.readOnly,
    required this.floatingWindowId,
    required this.sessionId,
    required this.groupId,
  });

  final bool readOnly;

  final String floatingWindowId;
  final String sessionId;
  final int groupId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;

    final hasOpenArtworks = ref.watch(
          artworkQuarantineGroupStateProvider(groupId, sessionId).select(
            (state) => state.requireValue.artworkQuarantines?.any(
              (artwork) =>
                  artwork.general.status == ArtworkQuarantineGroupStatus.open,
            ),
          ),
        ) ??
        false;

    return AppButton.secondary(
      label: l10n.gen_apply,
      onPressed: readOnly || !hasOpenArtworks
          ? null
          : () async {
              await showElbDialog<bool?>(
                context: context,
                child: ArtworkQuarantineApplySettingsConfirmationDialog(
                  groupId: groupId,
                  floatingWindowId: floatingWindowId,
                  sessionId: sessionId,
                ),
              );
            },
    );
  }
}

/// Status button for artwork quarantine
class _QuarantineStatusButton extends ConsumerWidget {
  const _QuarantineStatusButton({
    required this.group,
    required this.labelPosition,
    required this.stateNotifier,
    required this.readOnly,
    required this.sessionId,
  });

  final ArtworkQuarantineGroup group;
  final NextCardFormFieldLabelPosition labelPosition;
  final String sessionId;
  final ArtworkQuarantineGroupState stateNotifier;
  final bool readOnly;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ppL10n = context.prepressL10n;

    final status = ref.watch(
      artworkQuarantineGroupStateProvider(
        group.meta.id!,
        sessionId,
      ).select(
        (v) => v.requireValue.status,
      ),
    );

    return ElbCardSelectionDropdown(
      hasValue: true,
      focusOrderId: null,
      isMandatory: false,
      readOnly: readOnly,
      labelPosition: labelPosition,
      label: ppL10n.artwork_quarantine_status,
      items: [
        for (final status in ArtworkQuarantineGroupStatus.values.orderedStatus)
          ElbSelectionDropdownItem(
            label: status.readable(ppL10n),
            onPressed: () {
              if (!readOnly) {
                stateNotifier.updateStatus(status);
              }
            },
            color: status.color,
          ),
      ],
      buttonLabel: status.readable(ppL10n),
      statusColor: status.color,
    );
  }
}
