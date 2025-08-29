part of '../service_user_card.dart';

class _ServiceUserCardInformationPage extends HookWidget {
  const _ServiceUserCardInformationPage({
    required this.stateNotifier,
    required this.initialEntity,
    required this.fullNameErrorNotifier,
    required this.initialsErrorNotifier,
    required this.workEmailErrorNotifier,
    required this.readOnly,
    required this.validationGroupId,
    required this.serviceUserId,
    required this.sessionId,
  });

  final ServiceUserState stateNotifier;
  final ServiceUser initialEntity;

  final ValueNotifier<String?> fullNameErrorNotifier;
  final ValueNotifier<String?> initialsErrorNotifier;
  final ValueNotifier<String?> workEmailErrorNotifier;
  final bool readOnly;
  final String validationGroupId;
  final int serviceUserId;
  final String sessionId;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return ScrollableCardItem.constrained(
      builder: (context, constraints) {
        final pageWidth = constraints.maxWidth;
        return Column(
          children: [
            CollapsibleCardSection(
              title: l10n.admin_user_info,
              identifier:
                  ComponentIdentifier.serviceUserCardGeneralInformation.name,
              child: TwoColumnWrap(
                width: pageWidth,
                builder: (labelPosition, childWidth) {
                  return [
                    Column(
                      children: [
                        NextCardFormField.text(
                          customErrorMessageNotifier: fullNameErrorNotifier,
                          focusOrder: 1,
                          readOnly: readOnly,
                          validationGroup: validationGroupId,
                          labelPosition: labelPosition,
                          label: l10n.service_user_service_name,
                          validator: (value) => ServiceUserFields.fromEnum(
                            ServiceUserField.serviceName,
                          ).validator(l10n, l10n)?.call(value),
                          initialText: initialEntity.serviceName,
                          onChanged: stateNotifier.updateServiceName,
                          onClear: (v) {
                            stateNotifier.updateServiceName('');
                          },
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        NextCardFormField.text(
                          customErrorMessageNotifier: fullNameErrorNotifier,
                          focusOrder: 2,
                          readOnly: readOnly,
                          validationGroup: validationGroupId,
                          labelPosition: labelPosition,
                          label: l10n.service_user_service_description,
                          validator: (value) => ServiceUserFields.fromEnum(
                            ServiceUserField.serviceDescription,
                          ).validator(l10n, l10n)?.call(value),
                          initialText: initialEntity.serviceDescription,
                          onChanged: stateNotifier.updateServiceDescription,
                          onClear: (v) {
                            stateNotifier.updateServiceDescription('');
                          },
                        ),
                      ],
                    ),
                  ];
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
