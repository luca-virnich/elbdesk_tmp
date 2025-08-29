import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/artwork_template/logic/artwork_template_provider.dart';
import 'package:elbdesk_prepress/src/artwork_template/widgets/artwork_template_pre_selection_selection.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:project_core/project_core.dart';

class CustomerArtworkTemplates extends HookConsumerWidget {
  const CustomerArtworkTemplates({
    required this.customerId,
    required this.sessionId,
    required this.navigatorKey,
    required this.floatingWindowFocus,
    required this.floatingWindowId,
    super.key,
  });
  final int customerId;
  final String sessionId;
  final GlobalKey<NavigatorState> navigatorKey;
  final FocusNode floatingWindowFocus;
  final String floatingWindowId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPreSelectionIdNotifier = useState<int?>(null);
    final selectedSelectionIdNotifier = useState<int?>(null);

    final filterGroup = useMemoized(
      () {
        return FilterGroup(
          nextOperator: FilterOperator.and,
          filters: [
            if (selectedPreSelectionIdNotifier.value != null)
              FilterField(
                fieldKey: ArtworkTemplateField.artworkTemplatePreSelection.name,
                value: selectedPreSelectionIdNotifier.value.toString(),
                type: FilterType.equal,
                fieldType: FilterFieldType.number,
                filterOperator: FilterOperator.and,
                uuid: const Uuid().v4(),
              ),
            if (selectedSelectionIdNotifier.value != null)
              FilterField(
                fieldKey: ArtworkTemplateField.artworkTemplateSelection.name,
                value: selectedSelectionIdNotifier.value.toString(),
                type: FilterType.equal,
                fieldType: FilterFieldType.number,
                filterOperator: FilterOperator.and,
                uuid: const Uuid().v4(),
              ),
          ],
        );
      },
      [
        selectedPreSelectionIdNotifier.value,
        selectedSelectionIdNotifier.value,
      ],
    );

    final l10n = context.l10n;
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ArtworkTemplatePreSelectionSelection(
              width: constraints.maxWidth,
              customerId: customerId,
              sessionId: sessionId,
              navigatorKey: navigatorKey,
              floatingWindowFocus: floatingWindowFocus,
              floatingWindowId: floatingWindowId,
              preSelectionIdNotifier: selectedPreSelectionIdNotifier,
              selectionIdNotifier: selectedSelectionIdNotifier,
            ),
            const CardSectionDivider(),
            const AppDivider(),
            const CardSectionDivider(),
            Expanded(
              child: ArtworkTemplateTable.byCustomer(
                dataProvider: (sessionId) =>
                    findArtworkTemplatesByCustomerProvider(
                  customerId,
                  sessionId,
                ),
                componentIdentifier:
                    ComponentIdentifier.customerArtworkTemplatesTable,
                isCollapsible: false,
                onSelect: (artworkTemplate) {
                  ref.openWindow(
                    FloatingArtworkTemplateWindowData(
                      artworkTemplateId: artworkTemplate.meta.id,
                      customerId: artworkTemplate.customer?.id,
                      preSelectionId:
                          artworkTemplate.artworkTemplatePreSelection.id!,
                      selectionId: artworkTemplate.artworkTemplateSelection.id!,
                    ),
                  );
                },
                // tableDensity: AppTableDensity.minimal,
                customerId: customerId,
                preSelectionId: selectedPreSelectionIdNotifier.value,
                selectionId: selectedSelectionIdNotifier.value,
                toolbarTrailingActions: (sessionId) => [
                  _AddNewCustomerArtworkButton(
                    l10n: l10n,
                    customerId: customerId,
                    selectedPreSelectionId:
                        selectedPreSelectionIdNotifier.value,
                    selectedSelectionId: selectedSelectionIdNotifier.value,
                  ),
                ],
                hiddenFilterGroup: filterGroup,
              ),
            ),
          ],
        );
      },
    );
  }
}

class _AddNewCustomerArtworkButton extends ConsumerWidget {
  const _AddNewCustomerArtworkButton({
    required this.l10n,
    required this.customerId,
    required this.selectedPreSelectionId,
    required this.selectedSelectionId,
  });

  final ElbCoreLocalizations l10n;
  final int customerId;
  final int? selectedPreSelectionId;
  final int? selectedSelectionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ppL10n = context.prepressL10n;
    final disabled =
        selectedPreSelectionId == null || selectedSelectionId == null;

    return AppButton.primary(
      iconData: AppIcons.add,
      tooltip: l10n.gen_add_entity(ppL10n.artwork_template_singular),
      onPressed: disabled
          ? null
          : () {
              ref.openWindow(
                FloatingArtworkTemplateWindowData(
                  artworkTemplateId: null,
                  customerId: customerId,
                  preSelectionId: selectedPreSelectionId!,
                  selectionId: selectedSelectionId!,
                ),
              );
            },
    );
  }
}
