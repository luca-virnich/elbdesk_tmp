part of '../{{#snakeCase}}{{feature_name}}{{/snakeCase}}_card.dart';

/// {{#pascalCase}}{{feature_name}}{{/pascalCase}} Card Main Page
/// 
/// This is the main page of the {{#pascalCase}}{{feature_name}}{{/pascalCase}} card
/// 
/// It is used to display the general information
/// 
class _{{#pascalCase}}{{feature_name}}{{/pascalCase}}CardMainPage extends HookConsumerWidget {
  const _{{#pascalCase}}{{feature_name}}{{/pascalCase}}CardMainPage({
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
  final {{#pascalCase}}{{feature_name}}{{/pascalCase}}State stateNotifier;
  final int entityId;
  final {{#pascalCase}}{{feature_name}}{{/pascalCase}} initialEntity;
  final bool readOnly;
  final String floatingWindowId;
  final GlobalKey<NavigatorState> navigatorKey;
  final FocusNode floatingWindowFocus;
  final int customerId;
  final String sessionId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;

    return ScrollableCardItem.constrained(
      builder: (context, constraints) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CollapsibleCardSection(
              title: l10n.crm_general,
              identifier: CollapsibleIdentifier.{{#camelCase}}{{feature_name}}{{/camelCase}}MainPageGeneral,
              child: TwoColumnWrap(
                builder: (labelPosition, childWidth) {
                  return [
                    Column(
                      children: [
                        NextCardFormField.text(
                          labelPosition: labelPosition,
                          readOnly: readOnly,
                          validator: (value) => {{#pascalCase}}{{feature_name}}{{/pascalCase}}FieldWrapper({{#pascalCase}}{{feature_name}}{{/pascalCase}}Field.name)
                              .validator(l10n)
                              ?.call(value?.trim()),
                          focusOrder: 1,
                          validationGroup: null,
                          label: l10n.gen_name,
                          initialText: initialEntity.name,
                          onChanged: (v) {
                            stateNotifier.updateName(v);
                          },
                          onClear: (v) {
                            stateNotifier.updateName('');
                          },
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        NextCardFormField.text(
                          labelPosition: labelPosition,
                          readOnly: readOnly,
                          validator: (value) => {{#pascalCase}}{{feature_name}}{{/pascalCase}}FieldWrapper({{#pascalCase}}{{feature_name}}{{/pascalCase}}Field.description)
                              .validator(l10n)
                              ?.call(value?.trim()),
                          focusOrder: 2,
                          validationGroup: null,
                          label: l10n.gen_description,
                          initialText: initialEntity.description,
                          onChanged: (v) {
                            stateNotifier.updateDescription(v);
                          },
                          onClear: (v) {
                            stateNotifier.updateDescription('');
                          },
                          maxLines: 3,
                          minLines: 2,
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
