import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations_ext.dart';
import 'package:elbdesk_sales/src/sales_order/config/sales_order_fields.dart';
import 'package:elbdesk_sales/src/sales_order/logic/sales_order_state.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:project_core/project_core.dart';

class SalesOrderCustomerAndCustomerCustomerView extends StatelessWidget {
  const SalesOrderCustomerAndCustomerCustomerView({
    required this.width,
    required this.initialEntity,
    required this.stateNotifier,
    required this.sessionId,
    required this.readOnly,
    required this.savedOrInitialEntity,
    required this.identifier,
    super.key,
  });
  final double width;
  final SalesOrder initialEntity;
  final ObjectRef<SalesOrder?> savedOrInitialEntity;
  final SalesOrderState stateNotifier;
  final String sessionId;
  final bool readOnly;
  final ComponentIdentifier identifier;
  @override
  Widget build(BuildContext context) {
    final salesL10n = context.salesL10n;
    final crmL10n = context.crmL10n;
    return CollapsibleCardSection(
      identifier: identifier.name,
      title: crmL10n.customer_and_customer_customer,
      child: ElbTwoColumnWrap(
        customL10n: salesL10n,
        columnLeft: [
          ElbTwoColumnWrapTitleItem<ElbSalesLocalizations>(
            label: crmL10n.customer_singular,
          ),
          ElbTwoColumnItem.text(
            field: SalesOrderFields.fromEnum(SalesOrderField.orderNumber),
            initialValue: initialEntity.orderNumber,
            onChanged: stateNotifier.updateOrderNumber,
          ),
          ElbTwoColumnItem.text(
            field: SalesOrderFields.fromEnum(
              SalesOrderField.customerSecondReference,
            ),
            initialValue: initialEntity.customerSecondReference,
            onChanged: stateNotifier.updateCustomerSecondReference,
          ),
          ElbTwoColumnDropdown.lazyText(
            field: SalesOrderFields.fromEnum(
              SalesOrderField.customerContactPerson,
            ),
            initialValueText: initialEntity.customerContactPerson?.general.name,
            lazyDataProvider: streamActiveEmployeesByCompanyProvider(
              sessionId,
              companyId: initialEntity.customer!.contact!.meta.id!,
            ),
            onChanged: (e) => stateNotifier.updateCustomerContactPerson(
              e?.employee,
            ),
            lazyItemLabelBuilder: (e) => e.employee.general.name,
            outsideTrailing: Consumer(
              builder: (context, ref, child) {
                final selectedEmployee = ref.watch(
                  salesOrderStateProvider(initialEntity.meta.id!, sessionId)
                      .select(
                    (state) => state.requireValue.customerContactPerson,
                  ),
                );

                return AppOpenInNewIconButton(
                  onPressed: selectedEmployee == null
                      ? null
                      : () {
                          final id = selectedEmployee.meta.id;
                          final isPerson = selectedEmployee.general.type ==
                              ContactType.person;
                          if (isPerson) {
                            ref.openWindow(
                              FloatingContactPersonWindowData(
                                contactId: id,
                              ),
                            );
                          } else {
                            ref.openWindow(
                              FloatingContactCompanyWindowData(
                                contactId: id,
                              ),
                            );
                          }
                        },
                );
              },
            ),
          ),
        ],
        columnRight: [
          ElbTwoColumnWrapTitleItem<ElbSalesLocalizations>(
            label: crmL10n.customer_customer,
          ),
          ElbTwoColumnDropdown.lazyText(
            field: SalesOrderFields.fromEnum(SalesOrderField.customerCustomer),
            initialValueText: initialEntity
                .customerCustomer?.customerCustomerContact?.general.name,
            lazyDataProvider: watchCustomerCustomersProvider(
              sessionId,
              customerId: initialEntity.customer!.meta.id!,
            ),
            onChanged: stateNotifier.updateCustomerCustomer,
            lazyItemLabelBuilder: (e) =>
                e.customerCustomerContact!.general.name,
            outsideTrailing: Consumer(
              builder: (context, ref, child) {
                final selectedCustomerCustomer = ref.watch(
                  salesOrderStateProvider(initialEntity.meta.id!, sessionId)
                      .select(
                    (state) => state.requireValue.customerCustomer,
                  ),
                );
                return AppOpenInNewIconButton(
                  onPressed: selectedCustomerCustomer == null
                      ? null
                      : () {
                          final contactId = selectedCustomerCustomer
                              .customerCustomerContact!.meta.id;
                          final type = selectedCustomerCustomer
                              .customerCustomerContact!.general.type;
                          final isPerson = type == ContactType.person;
                          if (isPerson) {
                            ref.openWindow(
                              FloatingContactPersonWindowData(
                                contactId: contactId,
                              ),
                            );
                          } else {
                            ref.openWindow(
                              FloatingContactCompanyWindowData(
                                contactId: contactId,
                              ),
                            );
                          }
                        },
                );
              },
            ),
          ),
          ElbTwoColumnWrapCustomItem<ElbSalesLocalizations>(
            label: '',
            childBuilder: (labelPosition) {
              return _CustomerCustomerContact(
                initialEntity: initialEntity,
                labelPosition: labelPosition,
                stateNotifier: stateNotifier,
                sessionId: sessionId,
                readOnly: readOnly,
              );
            },
          ),
          ElbTwoColumnItem.text(
            field: SalesOrderFields.fromEnum(
              SalesOrderField.customerCustomerReference,
            ),
            initialValue: initialEntity.customerCustomerReference,
            onChanged: stateNotifier.updateCustomerCustomerReference,
          ),
        ],
        width: width,
        readOnly: readOnly,
        validationGroupId: null,
      ),
    );
  }
}

class CustomerEmployeeView extends HookConsumerWidget {
  const CustomerEmployeeView({
    required this.companyId,
    required this.labelPosition,
    required this.stateNotifier,
    required this.entityId,
    required this.sessionId,
    required this.initialEntity,
    required this.readOnly,
    this.focusOrderId,
    super.key,
  });
  final int companyId;
  final NextCardFormFieldLabelPosition labelPosition;
  final SalesOrderState stateNotifier;
  final int entityId;
  final String sessionId;
  final SalesOrder initialEntity;
  final bool readOnly;
  final double? focusOrderId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final crmL10n = context.crmL10n;
    return NextCardLazyDropdownMenu<CompanyEmployee>(
      validationGroupId: null,
      focusOrderId: focusOrderId,
      labelPosition: labelPosition,
      dataProvider: streamActiveEmployeesByCompanyProvider(
        sessionId,
        companyId: companyId,
      ),
      labelBuilder: (e) => e.employee.general.name,
      onSelected: (e) {
        stateNotifier.updateCustomerContactPerson(e?.employee);
      },
      initialValue: initialEntity.customerContactPerson?.general.name ?? '',
      readOnly: readOnly,
      label: crmL10n.customer_contact_person,
      outsideTrailing: Consumer(
        builder: (context, ref, child) {
          final selectedEmployee = ref.watch(
            salesOrderStateProvider(entityId, sessionId).select(
              (state) => state.requireValue.customerContactPerson,
            ),
          );

          return AppOpenInNewIconButton(
            onPressed: selectedEmployee == null
                ? null
                : () {
                    final id = selectedEmployee.meta.id;
                    final isPerson =
                        selectedEmployee.general.type == ContactType.person;
                    if (isPerson) {
                      ref.openWindow(
                        FloatingContactPersonWindowData(
                          contactId: id,
                        ),
                      );
                    } else {
                      ref.openWindow(
                        FloatingContactCompanyWindowData(
                          contactId: id,
                        ),
                      );
                    }
                  },
          );
        },
      ),
    );
  }
}

class _CustomerCustomerContact extends ConsumerWidget {
  const _CustomerCustomerContact({
    required this.initialEntity,
    required this.labelPosition,
    required this.stateNotifier,
    required this.sessionId,
    required this.readOnly,
  });
  final SalesOrder initialEntity;
  final NextCardFormFieldLabelPosition labelPosition;
  final SalesOrderState stateNotifier;
  final String sessionId;
  final bool readOnly;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final salesL10n = context.salesL10n;
    final selectedCustomerCustomer = ref.watch(
      salesOrderStateProvider(initialEntity.meta.id!, sessionId).select(
        (state) => state.requireValue.customerCustomer,
      ),
    );

    if (selectedCustomerCustomer == null) {
      return NextCardLoadingTextField(
        label: salesL10n.assigned_employee,
        labelPosition: labelPosition,
      );
    }

    final employeesOfCustomerCustomer = ref.watch(
      streamActiveEmployeesByCompanyProvider(
        sessionId,
        companyId: selectedCustomerCustomer.customerCustomerContact!.meta.id!,
      ),
    );
    return employeesOfCustomerCustomer.componentWhen(
      loadingWidget: NextCardLoadingTextField(
        label: salesL10n.assigned_employee,
        labelPosition: labelPosition,
      ),
      data: (employeesOfCustomerCustomer) {
        return NextCardDropdownMenu(
          validationGroupId: null,
          labelPosition: labelPosition,
          label: salesL10n.assigned_employee,
          initialValue:
              initialEntity.customerCustomerContactPerson?.general.name ?? '',
          readOnly: readOnly,
          dropdownMenuEntries: employeesOfCustomerCustomer
              .map(
                (e) => NextDropdownMenuEntry(
                  label: e.employee.general.name,
                  value: e,
                ),
              )
              .toList(),
          onSelected: (v) {
            stateNotifier.updateCustomerCustomerContactPerson(
              v?.employee,
            );
          },
          outsideTrailing: Consumer(
            builder: (context, ref, child) {
              final selectedEmployee = ref.watch(
                salesOrderStateProvider(initialEntity.meta.id!, sessionId)
                    .select(
                  (state) => state.requireValue.customerCustomerContactPerson,
                ),
              );
              return AppOpenInNewIconButton(
                onPressed: selectedEmployee == null
                    ? null
                    : () {
                        final id = selectedEmployee.meta.id;
                        final type = selectedEmployee.general.type;
                        final isPerson = type == ContactType.person;
                        if (isPerson) {
                          ref.openWindow(
                            FloatingContactPersonWindowData(
                              contactId: id,
                            ),
                          );
                        } else {
                          ref.openWindow(
                            FloatingContactCompanyWindowData(
                              contactId: id,
                            ),
                          );
                        }
                      },
              );
            },
          ),
        );
      },
    );
  }
}
