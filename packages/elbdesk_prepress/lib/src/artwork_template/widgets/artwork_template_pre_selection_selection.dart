import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/elbdesk_prepress.dart';
import 'package:elbdesk_prepress/src/artwork_template/logic/artwork_template_provider.dart';
import 'package:elbdesk_prepress/src/artwork_template/models/artwork_template_pre_selection.dart';
import 'package:elbdesk_prepress/src/artwork_template/models/artwork_template_selection.dart';
import 'package:elbdesk_prepress/src/artwork_template/widgets/artwork_template_pre_selection_card.dart';
import 'package:elbdesk_prepress/src/artwork_template/widgets/artwork_template_selection_card.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ArtworkTemplatePreSelectionSelection extends HookWidget {
  const ArtworkTemplatePreSelectionSelection({
    required this.width,
    required this.navigatorKey,
    required this.sessionId,
    required this.floatingWindowId,
    required this.floatingWindowFocus,
    required this.preSelectionIdNotifier,
    required this.selectionIdNotifier,
    required this.customerId,
    super.key,
  });
  final double width;
  final GlobalKey<NavigatorState> navigatorKey;
  final String sessionId;
  final String floatingWindowId;
  final FocusNode floatingWindowFocus;
  final ValueNotifier<int?> preSelectionIdNotifier;
  final ValueNotifier<int?> selectionIdNotifier;
  final int? customerId;
  @override
  Widget build(BuildContext context) {
    final selectionController = useTextEditingController();
    final preSelectionController = useTextEditingController();
    final selectionFocusNode = useFocusNode();
    final l10n = context.l10n;
    final ppL10n = context.prepressL10n;

    return ElbTwoColumnWrap(
      width: width,
      customL10n: ppL10n,
      readOnly: false,
      validationGroupId: null,
      columnLeft: [
        ElbTwoColumnWrapLazyTextDropdownItem<ArtworkTemplatePreSelection,
            ElbPrepressLocalizations>(
          field: null,
          initialValue: preSelectionController.text,
          label: ppL10n.artwork_template_preselection_singular,
          dataProvider: fetchAndWatchArtworkTemplatePreSelectionsProvider(
            customerId,
          ),
          onSelected: (value) {
            if (value == null || value.id != preSelectionIdNotifier.value) {
              preSelectionIdNotifier.value = value?.id;
              selectionIdNotifier.value = null;
              selectionController.clear();
            }
            if (value != null) {
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                selectionFocusNode.requestFocus();
              });
            }
          },
          controller: preSelectionController,
          itemLabelBuilder: (value) => value.description,
          outsideTrailing: _AddEditPreselection(
            navigatorKey: navigatorKey,
            sessionId: sessionId,
            floatingWindowId: floatingWindowId,
            floatingWindowFocus: floatingWindowFocus,
            preSelectionIdNotifier: preSelectionIdNotifier,
            customerId: customerId,
            preSelectionController: preSelectionController,
            selectionFocusNode: selectionFocusNode,
          ),
        ),
      ],
      columnRight: [
        if (preSelectionIdNotifier.value != null)
          ElbTwoColumnWrapLazyTextDropdownItem<ArtworkTemplateSelection,
              ElbPrepressLocalizations>(
            field: null,
            initialValue: selectionController.text,
            controller: selectionController,
            readOnly: preSelectionIdNotifier.value == null,
            label: ppL10n.artwork_template_selection_singular,
            dataProvider: fetchAndWatchArtworkTemplateSelectionsProvider(
              preSelectionIdNotifier.value!,
            ),
            itemLabelBuilder: (value) => value.description,
            onSelected: (value) {
              selectionIdNotifier.value = value?.id;

              FocusScope.of(context).unfocus();
            },
            outsideTrailing: _AddEditSelection(
              navigatorKey: navigatorKey,
              artworkPreSelectionId: preSelectionIdNotifier.value,
              sessionId: sessionId,
              floatingWindowId: floatingWindowId,
              floatingWindowFocus: floatingWindowFocus,
              selectionIdNotifier: selectionIdNotifier,
              selectionController: selectionController,
            ),
          ),
      ],
    );
  }
}

class _AddEditPreselection extends ConsumerWidget {
  const _AddEditPreselection({
    required this.navigatorKey,
    required this.sessionId,
    required this.floatingWindowId,
    required this.floatingWindowFocus,
    required this.preSelectionIdNotifier,
    required this.customerId,
    required this.preSelectionController,
    required this.selectionFocusNode,
  });

  final GlobalKey<NavigatorState> navigatorKey;
  final String sessionId;
  final String floatingWindowId;
  final FocusNode floatingWindowFocus;

  final ValueNotifier<int?> preSelectionIdNotifier;

  final int? customerId;
  final TextEditingController preSelectionController;
  final FocusNode selectionFocusNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final entityId = preSelectionIdNotifier.value;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppIconButton.secondary(
          skipTraversal: true,
          onPressed: entityId == null
              ? null
              : () async {
                  await showElbDialog<ArtworkTemplatePreSelection>(
                    // title: l10n.gen_create_entity(
                    //   l10n.prepress_artwork_template_preselection_singular,
                    // ),
                    context: context,
                    navigatorKey: navigatorKey,
                    child: ArtworkTemplatePreSelectionCard(
                      customerId: customerId,
                      floatingWindowId: floatingWindowId,
                      entityId: entityId,
                      navigatorKey: navigatorKey,
                      floatingWindowFocus: floatingWindowFocus,
                      preSelectionController: preSelectionController,
                      preSelectionIdNotifier: preSelectionIdNotifier,
                    ),
                  );
                  final isValueSelected = preSelectionIdNotifier.value != null;

                  if (isValueSelected) {
                    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                      selectionFocusNode.requestFocus();
                    });
                  }
                },
          iconData: AppIcons.edit,
        ),
        AppIconButton.secondary(
          skipTraversal: true,
          onPressed: () async {
            await showElbDialog<ArtworkTemplatePreSelection>(
              // title: l10n.gen_create_entity(
              //   l10n.prepress_artwork_template_preselection_singular,
              // ),
              context: context,
              navigatorKey: navigatorKey,
              child: ArtworkTemplatePreSelectionCard(
                customerId: customerId,
                floatingWindowId: floatingWindowId,
                entityId: entityId,
                navigatorKey: navigatorKey,
                floatingWindowFocus: floatingWindowFocus,
                preSelectionController: preSelectionController,
                preSelectionIdNotifier: preSelectionIdNotifier,
              ),
            );
            final isValueSelected = preSelectionIdNotifier.value != null;

            if (isValueSelected) {
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                selectionFocusNode.requestFocus();
              });
            }
          },
          iconData: AppIcons.add,
        ),
      ],
    );
  }
}

class _AddEditSelection extends ConsumerWidget {
  const _AddEditSelection({
    required this.navigatorKey,
    required this.artworkPreSelectionId,
    required this.sessionId,
    required this.floatingWindowId,
    required this.floatingWindowFocus,
    required this.selectionIdNotifier,
    required this.selectionController,
  });

  final GlobalKey<NavigatorState> navigatorKey;
  final int? artworkPreSelectionId;
  final String sessionId;
  final String floatingWindowId;
  final FocusNode floatingWindowFocus;

  final ValueNotifier<int?> selectionIdNotifier;
  final TextEditingController selectionController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final entityId = selectionIdNotifier.value;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppIconButton.secondary(
          skipTraversal: true,
          onPressed: artworkPreSelectionId == null || entityId == null
              ? null
              : () async {
                  await showElbDialog<ArtworkTemplateSelection>(
                    // title: l10n.gen_create_entity(
                    //   l10n.prepress_artwork_template_selection_singular,
                    // ),
                    context: context,
                    navigatorKey: navigatorKey,
                    child: ArtworkTemplateSelectionCard(
                      artworkTemplatePreSelectionId: artworkPreSelectionId!,
                      floatingWindowId: floatingWindowId,
                      entityId: entityId,
                      navigatorKey: navigatorKey,
                      floatingWindowFocus: floatingWindowFocus,
                      selectionController: selectionController,
                      selectionIdNotifier: selectionIdNotifier,
                    ),
                  );
                },
          iconData: AppIcons.edit,
        ),
        AppIconButton.secondary(
          skipTraversal: true,
          onPressed: artworkPreSelectionId == null
              ? null
              : () async {
                  await showElbDialog<ArtworkTemplateSelection>(
                    // title: l10n.gen_create_entity(
                    //   l10n.prepress_artwork_template_selection_singular,
                    // ),
                    context: context,
                    navigatorKey: navigatorKey,
                    child: ArtworkTemplateSelectionCard(
                      artworkTemplatePreSelectionId: artworkPreSelectionId!,
                      floatingWindowId: floatingWindowId,
                      entityId: null,
                      navigatorKey: navigatorKey,
                      floatingWindowFocus: floatingWindowFocus,
                      selectionController: selectionController,
                      selectionIdNotifier: selectionIdNotifier,
                    ),
                  );
                },
          iconData: AppIcons.add,
        ),
      ],
    );
  }
}
