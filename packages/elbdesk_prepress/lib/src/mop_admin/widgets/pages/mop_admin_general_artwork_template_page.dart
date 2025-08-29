import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/artwork_template/logic/artwork_template_provider.dart';
import 'package:elbdesk_prepress/src/artwork_template/widgets/artwork_template_pre_selection_selection.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:project_core/project_core.dart';

/// General Artwork Template Page
///
/// This page allows managing artwork templates that are available for all
/// customers.
/// It provides functionality to create, edit, and manage artwork templates
/// globally.
class MopAdminGeneralArtworkTemplatePage extends HookConsumerWidget {
  /// Creates a new instance of GeneralArtworkTemplatePage
  const MopAdminGeneralArtworkTemplatePage({
    required this.sessionId,
    required this.navigatorKey,
    required this.floatingWindowFocus,
    required this.floatingWindowId,
    super.key,
  });

  /// The session ID for state management
  final String sessionId;

  /// The navigator key for dialog management
  final GlobalKey<NavigatorState> navigatorKey;

  /// The focus node for the floating window
  final FocusNode floatingWindowFocus;

  /// The ID of the floating window
  final String floatingWindowId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPreSelectionIdNotifier = useState<int?>(null);
    final selectedSelectionIdNotifier = useState<int?>(null);
    final l10n = context.l10n;
    final ppL10n = context.prepressL10n;

    return ScrollableCardItem.constrained(
      builder: (context, constraints) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CollapsibleCardSection(
              title: ppL10n.artwork_template_global,
              identifier:
                  ComponentIdentifier.mopAdminGeneralArtworkTemplates.name,
              child: ArtworkTemplatePreSelectionSelection(
                customerId: null,
                width: constraints.maxWidth,
                sessionId: sessionId,
                navigatorKey: navigatorKey,
                floatingWindowFocus: floatingWindowFocus,
                floatingWindowId: floatingWindowId,
                preSelectionIdNotifier: selectedPreSelectionIdNotifier,
                selectionIdNotifier: selectedSelectionIdNotifier,
              ),
            ),
            const CardSectionDivider(),
            const AppDivider(),
            const CardSectionDivider(),
            ArtworkTemplateTable.global(
              componentIdentifier:
                  ComponentIdentifier.mopAdminGeneralArtworkTemplatesTable,
              isCollapsible: false,
              dataProvider: (sessionId) => findGeneralArtworkTemplatesProvider(
                sessionId,
              ),
              onSelect: (artworkTemplate) {
                ref.openWindow(
                  FloatingArtworkTemplateWindowData(
                    artworkTemplateId: artworkTemplate.meta.id,
                    customerId: null,
                    preSelectionId:
                        artworkTemplate.artworkTemplatePreSelection.id!,
                    selectionId: artworkTemplate.artworkTemplateSelection.id!,
                  ),
                );
              },
              toolbarTrailingActions: (sessionId) => [
                _AddNewArtworkTemplateButton(
                  selectedPreSelectionId: selectedPreSelectionIdNotifier.value,
                  selectedSelectionId: selectedSelectionIdNotifier.value,
                ),
              ],
              hiddenFilterGroup: FilterGroup(
                nextOperator: FilterOperator.and,
                filters: [
                  if (selectedPreSelectionIdNotifier.value != null)
                    FilterField(
                      fieldKey:
                          ArtworkTemplateField.artworkTemplatePreSelection.name,
                      value: selectedPreSelectionIdNotifier.value.toString(),
                      type: FilterType.equal,
                      fieldType: FilterFieldType.number,
                      filterOperator: FilterOperator.and,
                      uuid: const Uuid().v4(),
                    ),
                  if (selectedSelectionIdNotifier.value != null)
                    FilterField(
                      fieldKey:
                          ArtworkTemplateField.artworkTemplateSelection.name,
                      value: selectedSelectionIdNotifier.value.toString(),
                      type: FilterType.equal,
                      fieldType: FilterFieldType.number,
                      filterOperator: FilterOperator.and,
                      uuid: const Uuid().v4(),
                    ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

/// Button to add a new global artwork template
class _AddNewArtworkTemplateButton extends ConsumerWidget {
  const _AddNewArtworkTemplateButton({
    required this.selectedPreSelectionId,
    required this.selectedSelectionId,
  });

  final int? selectedPreSelectionId;
  final int? selectedSelectionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final disabled =
        selectedPreSelectionId == null || selectedSelectionId == null;
    final ppL10n = context.prepressL10n;
    return AppButton.primary(
      iconData: AppIcons.add,
      tooltip: l10n.gen_add_entity(ppL10n.artwork_template_singular),
      onPressed: disabled
          ? null
          : () {
              ref.openWindow(
                FloatingArtworkTemplateWindowData(
                  artworkTemplateId: null,
                  // null for global templates
                  customerId: null,
                  preSelectionId: selectedPreSelectionId!,
                  selectionId: selectedSelectionId!,
                ),
              );
            },
    );
  }
}
