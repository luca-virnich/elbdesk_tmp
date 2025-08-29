part of '../drucklayout_card.dart';

/// Drucklayout Card Main Page
///
/// This is the main page of the Drucklayout card
///
/// It is used to display the general information
///
class _DrucklayoutCardMainPage extends HookConsumerWidget {
  const _DrucklayoutCardMainPage({
    required this.stateNotifier,
    required this.initialEntity,
    required this.readOnly,
    required this.floatingWindowId,
    required this.navigatorKey,
    required this.floatingWindowFocus,
    required this.customerId,
    required this.entityId,
    required this.sessionId,
  });
  final DrucklayoutState stateNotifier;
  final int entityId;
  final Drucklayout initialEntity;
  final bool readOnly;
  final String? floatingWindowId;
  final GlobalKey<NavigatorState> navigatorKey;
  final FocusNode floatingWindowFocus;
  final int customerId;
  final String sessionId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final crmL10n = context.crmL10n;
    final ppL10n = context.prepressL10n;

    return ScrollableCardItem.constrained(
      builder: (context, constraints) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CollapsibleCardSection(
              title: crmL10n.general,
              identifier: ComponentIdentifier.drucklayoutMainPageGeneral.name,
              child: TwoColumnWrap(
                builder: (labelPosition, childWidth) {
                  return [
                    Column(
                      children: [
                        // ID
                        NextCardFormField.text(
                          excludeFocusTraversal: true,
                          labelPosition: labelPosition,
                          readOnly: true,
                          validator: null,
                          validationGroup: null,
                          label: l10n.gen_id,
                          initialText: initialEntity.formattedId,
                          onChanged: null,
                        ),

                        // PreSelection
                        NextCardFormField.text(
                          excludeFocusTraversal: true,
                          labelPosition: labelPosition,
                          readOnly: true,
                          validator: null,
                          validationGroup: null,
                          label: ppL10n.drucklayout_preselection_singular,
                          initialText:
                              initialEntity.drucklayoutPreSelection.description,
                          onChanged: null,
                        ),

                        // Selection
                        NextCardFormField.text(
                          excludeFocusTraversal: true,
                          labelPosition: labelPosition,
                          readOnly: true,
                          validator: null,
                          validationGroup: null,
                          label: ppL10n.drucklayout_selection_singular,
                          initialText:
                              initialEntity.drucklayoutSelection.description,
                          onChanged: null,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        // Title
                        NextCardFormField.text(
                          labelPosition: labelPosition,
                          readOnly: readOnly,
                          validator: (value) =>
                              DrucklayoutFields.fromEnum(DrucklayoutField.title)
                                  .validator(l10n, ppL10n)
                                  ?.call(value?.trim()),
                          focusOrder: 1,
                          validationGroup: null,
                          label: ppL10n.drucklayout_title,
                          initialText: initialEntity.title,
                          onChanged: stateNotifier.updateTitle,
                          onClear: (v) {
                            stateNotifier.updateTitle('');
                          },
                        ),
                        NextCardFormField.text(
                          labelPosition: labelPosition,
                          maxLines: 3,
                          minLines: 2,
                          keyboardType: TextInputType.multiline,
                          readOnly: readOnly,
                          validator: (value) => DrucklayoutFields.fromEnum(
                            DrucklayoutField.description,
                          ).validator(l10n, ppL10n)?.call(value?.trim()),
                          focusOrder: 2,
                          validationGroup: null,
                          label: l10n.gen_description,
                          initialText: initialEntity.description,
                          onChanged: stateNotifier.updateDescription,
                          onClear: (v) {
                            stateNotifier.updateDescription('');
                          },
                        ),
                      ],
                    ),
                  ];
                },
                width: constraints.maxWidth,
              ),
            ),
          ],
        );
      },
    );
  }
}
