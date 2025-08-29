import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/elbdesk_crm.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations_ext.dart';
import 'package:elbdesk_crm/src/ui/address_communication_tile_content.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';

enum _Type {
  employee,
  company,
}

/// This widget shows a Tile for either a company
/// employee in a company or a contact in a contact.
class AppCardCompanyEmployeeTile extends ConsumerWidget {
  /// This constructor is used to show a company employee in a company.
  const AppCardCompanyEmployeeTile.employee({
    required this.companyEmployee,
    required this.sessionId,
    required this.navigatorKey,
    super.key,
  }) : _type = _Type.employee;

  /// This constructor is used to show a company employee in a contact.
  const AppCardCompanyEmployeeTile.company({
    required this.companyEmployee,
    required this.sessionId,
    required this.navigatorKey,
    super.key,
  }) : _type = _Type.company;

  final CompanyEmployee companyEmployee;
  final String sessionId;
  final GlobalKey<NavigatorState> navigatorKey;
  final _Type _type;

  String name(ElbCrmLocalizations l10n) {
    final inactiveText = companyEmployee.active
        ? ''
        : '(${l10n.contact_inactive.toLowerCase()})';
    if (_type == _Type.company) {
      return '${companyEmployee.company.general.name} $inactiveText';
    }
    return '${companyEmployee.employee.general.name} $inactiveText';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final crmL10n = context.crmL10n;
    return AppCardTile(
      title: name(crmL10n),
      onTitleTap: () {
        return switch (_type) {
          _Type.employee => ref.openWindow(
              FloatingContactPersonWindowData(
                contactId: companyEmployee.employee.meta.id,
              ),
            ),
          _Type.company => ref.openWindow(
              FloatingContactCompanyWindowData(
                contactId: companyEmployee.company.meta.id,
              ),
            ),
        };
      },
      onDelete: () async {
        await showElbDialog<bool>(
          context: context,
          isDismissible: true,
          navigatorKey: navigatorKey,
          child: ElbAlertDialog(
            titleText: l10n.gen_attention,
            contentText: switch (_type) {
              _Type.employee => crmL10n.customer_employee_delete_dialog_text(
                  name(crmL10n),
                ),
              _Type.company => crmL10n.customer_company_delete_dialog_text(
                  name(crmL10n),
                ),
            },
            onCancel: () {
              Navigator.of(context).pop(false);
            },
            actions: [
              AppButton.secondary(
                label: l10n.gen_cancel,
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              AppButton.danger(
                label: l10n.gen_remove,
                onPressed: () async {
                  final (:success, :exception, :data) =
                      await AsyncHandler.handleAsyncOperation(
                    context,
                    () => ref.read(companyEmployeeRepositoryProvider).delete(
                          companyEmployee.meta.id!,
                          sessionId,
                        ),
                    successMessage:
                        crmL10n.company_employee_removed_successfully,
                    successNavigatorKey: navigatorKey,
                    errorNavigatorKey: navigatorKey,
                  );
                  if (success) {
                    navigatorKey.currentState?.pop();
                    // Navigator.of(context).pop(true);
                  }
                },
              ),
            ],
          ),
        );
      },
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (_type == _Type.employee)
            _EmployeeContent(companyEmployee: companyEmployee)
          else
            _CompanyContent(companyEmployee: companyEmployee),
        ],
      ),
    );
  }
}

class _CompanyContent extends ConsumerWidget {
  const _CompanyContent({
    required this.companyEmployee,
  });
  final CompanyEmployee companyEmployee;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final crmL10n = context.crmL10n;
    final contact = ref.watch(
      fetchAndWatchContactProvider(
        companyEmployee.company.meta.id!,
      ),
    );

    return contact.fastWhen(
      data: (contact) {
        final address = contact.address;
        final communication = contact.communication;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AddressCommunicationTileContent(
              address: address.address,
              address2: address.address2,
              address3: address.address3,
              postCode: address.postCode,
              city: address.city,
              country: address.countryCode?.name ?? '',
              mobileNumber: communication.mobile,
              phoneNumber: communication.phone,
              email: communication.email,
              jobTitle: companyEmployee.position,
              department:
                  companyEmployee.departments?.map((t) => t.name).join(', '),
            ),
            const SizedBox(height: AppSpace.s),
            Row(
              spacing: AppSpace.l,
              children: [
                AppButton.blank(
                  label: crmL10n.company_employee_go_to_card,
                  onPressed: () {
                    ref.openWindow(
                      FloatingCompanyEmployeeWindowData(
                        entityId: companyEmployee.meta.id!,
                      ),
                    );
                  },
                ),
                if (companyEmployee.company.customer?.meta.id != null)
                  AppButton.blank(
                    label: crmL10n.company_employee_go_to_customer,
                    onPressed: () {
                      ref.openWindow(
                        FloatingCustomerWindowData(
                          customerId: companyEmployee.company.customer?.meta.id,
                        ),
                      );
                    },
                  ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class _EmployeeContent extends ConsumerWidget {
  const _EmployeeContent({
    required this.companyEmployee,
  });
  final CompanyEmployee companyEmployee;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final crmL10n = context.crmL10n;
    final communication = companyEmployee.employee.communication;
    final contact = ref.watch(
      fetchAndWatchContactProvider(
        companyEmployee.employee.meta.id!,
      ),
    );

    return contact.fastWhen(
      data: (contact) {
        final address = contact.address;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AddressCommunicationTileContent(
              address: address.address,
              address2: address.address2,
              address3: address.address3,
              postCode: address.postCode,
              city: address.city,
              country: address.countryCode?.name,
              mobileNumber: communication.mobile,
              phoneNumber: communication.phone,
              email: communication.email,
              jobTitle: companyEmployee.position,
              department:
                  companyEmployee.departments?.map((t) => t.name).join(', '),
            ),
            const SizedBox(height: AppSpace.s),
            AppButton.blank(
              label: crmL10n.company_employee_go_to_card,
              onPressed: () {
                ref.openWindow(
                  FloatingCompanyEmployeeWindowData(
                    entityId: companyEmployee.meta.id!,
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
