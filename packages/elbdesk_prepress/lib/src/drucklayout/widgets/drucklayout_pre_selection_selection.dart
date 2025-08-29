import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_prepress/elbdesk_prepress.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Drucklayout Pre Selection Selection
///
/// A widget that allows the user to select a pre selection and a selection
/// for a drucklayout
class DrucklayoutPreSelectionSelection extends HookWidget {
  const DrucklayoutPreSelectionSelection({
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
    final ppL10n = context.prepressL10n;

    return ElbTwoColumnWrap(
      width: width,
      readOnly: false,
      customL10n: ppL10n,
      validationGroupId: null,
      columnLeft: [
        ElbTwoColumnDropdown.lazyText(
          field: DrucklayoutFields.fromEnum(
            DrucklayoutField.drucklayoutPreSelection,
          ),
          initialValueText: preSelectionController.text,
          onChanged: (value) {
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
          lazyDataProvider: fetchAndWatchDrucklayoutPreSelectionsProvider(
            customerId,
          ),
          lazyItemLabelBuilder: (value) {
            return value.description;
          },
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
          ElbTwoColumnDropdown.lazyText(
            field: DrucklayoutFields.fromEnum(
              DrucklayoutField.drucklayoutSelection,
            ),
            initialValueText: selectionController.text,
            onChanged: (value) {
              selectionIdNotifier.value = value?.id;
            },
            lazyDataProvider: fetchAndWatchDrucklayoutSelectionsProvider(
              preSelectionIdNotifier.value!,
            ),
            lazyItemLabelBuilder: (value) {
              return value.description;
            },
            outsideTrailing: _AddEditSelection(
              navigatorKey: navigatorKey,
              drucklayoutPreSelectionId: preSelectionIdNotifier.value,
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
                  await showElbDialog<DrucklayoutPreSelection>(
                    // title: l10n.gen_create_entity(
                    //   l10n.prepress_drucklayout_preselection_singular,
                    // ),
                    context: context,
                    navigatorKey: navigatorKey,
                    child: DrucklayoutPreSelectionCard(
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
            await showElbDialog<DrucklayoutPreSelection>(
              // title: l10n.gen_create_entity(
              //   l10n.prepress_drucklayout_preselection_singular,
              // ),
              context: context,
              navigatorKey: navigatorKey,
              child: DrucklayoutPreSelectionCard(
                customerId: customerId,
                floatingWindowId: floatingWindowId,
                entityId: preSelectionIdNotifier.value,
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
    required this.drucklayoutPreSelectionId,
    required this.sessionId,
    required this.floatingWindowId,
    required this.floatingWindowFocus,
    required this.selectionIdNotifier,
    required this.selectionController,
  });

  final GlobalKey<NavigatorState> navigatorKey;
  final int? drucklayoutPreSelectionId;
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
          onPressed: drucklayoutPreSelectionId == null || entityId == null
              ? null
              : () async {
                  await showElbDialog<DrucklayoutSelection>(
                    context: context,
                    navigatorKey: navigatorKey,
                    child: DrucklayoutSelectionCard(
                      drucklayoutPreSelectionId: drucklayoutPreSelectionId!,
                      floatingWindowId: floatingWindowId,
                      entityId: entityId,
                      navigatorKey: navigatorKey,
                      floatingWindowFocus: floatingWindowFocus,
                      selectionIdNotifier: selectionIdNotifier,
                      selectionController: selectionController,
                    ),
                  );
                },
          iconData: AppIcons.edit,
        ),
        AppIconButton.secondary(
          skipTraversal: true,
          onPressed: () async {
            await showElbDialog<DrucklayoutSelection>(
              context: context,
              navigatorKey: navigatorKey,
              child: DrucklayoutSelectionCard(
                drucklayoutPreSelectionId: drucklayoutPreSelectionId!,
                floatingWindowId: floatingWindowId,
                entityId: null,
                navigatorKey: navigatorKey,
                floatingWindowFocus: floatingWindowFocus,
                selectionIdNotifier: selectionIdNotifier,
                selectionController: selectionController,
              ),
            );
          },
          iconData: AppIcons.add,
        ),
      ],
    );
  }
}
