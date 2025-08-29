import 'dart:async';

import 'package:collection/collection.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/spotlight/spotlight_constants.dart';
import 'package:elbdesk_server/src/modules/crm/customer/customer_handler.dart';
import 'package:elbdesk_server/src/modules/crm/customer/customer_utils.dart';
import 'package:elbdesk_server/src/modules/crm/customer_billing_customers/customer_bllling_customers_handler.dart';
import 'package:elbdesk_server/src/modules/crm/customer_billing_customers/endpoints/customer_billing_customer_endpoint.dart';
import 'package:elbdesk_server/src/modules/crm/customer_shipping_contact/customer_shipping_handler.dart';
import 'package:serverpod/serverpod.dart';

final customerStreamController = StreamController<CustomerDTO>.broadcast();

class CustomerEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Stream<CustomerDTO> watch(
    Session session, {
    required String sessionId,
    required int entityId,
  }) async* {
    session.addWillCloseListener(
      (session) {
        CustomerHandler.release(
          session,
          entityId: entityId,
          sessionId: sessionId,
        );
      },
    );
    yield* customerStreamController.stream
        .where((event) => event.id == entityId);
  }

  Future<CustomerDTO?> fetchById(
    Session session,
    int id,
  ) async {
    return CustomerDTO.db.findById(
      session,
      id,
      include: CustomerUtils.includeAll,
    );
  }

  /// Returns the first customer based on the provided filter and sort
  Future<List<CustomerDTO>> find(
    Session session, {
    Sort? sort,
    Filter? filter,
  }) async {
    final sortByField = CustomerField.values.firstWhereOrNull(
      (e) => e.name == sort?.fieldKey,
    );

    final expression = CustomerUtils.buildExpression(filter);

    return CustomerDTO.db.find(
      session,
      where: expression == null ? null : (t) => expression,
      orderBy: CustomerUtils.orderBy(sortByField),
      orderDescending: sort?.orderDescending ?? false,
      include: CustomerUtils.includeAll,
    );
  }

  Future<void> release(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    await CustomerHandler.release(
      session,
      entityId: entityId,
      sessionId: sessionId,
    );
  }

  Future<List<SpotlightItem>> findSpotlight(
    Session session, {
    required String query,
  }) async {
    final isCustomerId = int.tryParse(query);

    if (isCustomerId != null) {
      final customers = await CustomerDTO.db.find(
        session,
        where: (t) => t.customIdString.ilike('%$query%'),
        include: CustomerDTO.include(
          contact: ContactDTO.include(),
        ),
        limit: SpotlightConstants.spotlightLimit,
      );
      return customers
          .map(
            (e) => SpotlightItem(
              primaryKey: e.id!,
              title: e.contact?.fullName ?? '',
              description: e.contact?.fullName ?? '',
              type: SpotlightType.customer,
            ),
          )
          .toList();
    }

    final customers = await CustomerDTO.db.find(
      session,
      where: (t) => t.contact.fullName.ilike('%$query%'),
      orderBy: (t) => t.contact.fullName,
      orderDescending: false,
      include: CustomerDTO.include(
        contact: ContactDTO.include(),
      ),
      limit: SpotlightConstants.spotlightLimit,
    );
    final spotlightItems = customers.map(
      (e) => SpotlightItem(
        primaryKey: e.id!,
        title: e.contact?.fullName ?? '',
        description: e.contact?.fullName ?? '',
        type: SpotlightType.customer,
      ),
    );
    return spotlightItems.toList();
  }

  // falls der filter das feld selected customer enthält und der wert dazu mit
  // einer Zahl beginnt, dann soll das
  // mit id ersetzt werden und wenn das feld nicht mit einer Zahl beginnt,
  // dann soll das mit customerName gesucht werden
  // Future<List<CustomerDTO>> findForDateneingang(
  //   Session session, {
  //   Sort? sort,
  //   Filter? filter,
  // }) async {
  //   final sortByField = CustomerField.values.firstWhereOrNull(
  //     (e) => e.name == sort?.fieldKey,
  //   );

  //   final filterGroups = filter?.filterGroups.map((group) {
  //         return FilterGroup(
  //           filters: group.filters.map((field) {
  //             if (field.fieldKey == CustomerField.filterByIdOrName.name) {
  //               final value = field.value;
  //               if (RegExp(r'^\d+$').hasMatch(value)) {
  //                 return FilterField(
  //                   fieldKey: CustomerField.customId.name,
  //                   filterOperator: field.filterOperator,
  //                   type: FilterType.equal,
  //                   value: value,
  //                   uuid: const Uuid().v4(),
  //                   fieldType: FilterFieldType.number,
  //                 );
  //               } else {
  //                 return FilterField(
  //                   fieldKey: CustomerField.customerName.name,
  //                   filterOperator: field.filterOperator,
  //                   type: FilterType.iLike,
  //                   value: value,
  //                   uuid: const Uuid().v4(),
  //                   fieldType: FilterFieldType.text,
  //                 );
  //               }
  //             }
  //             return field;
  //           }).toList(),
  //           nextOperator: group.nextOperator,
  //         );
  //       }).toList() ??
  //       [];

  //   final transformedFilter = Filter(filterGroups: filterGroups);

  //   final expression = buildFilterExpression<CustomerDTOTable, CustomerField>(
  //     table: CustomerDTOTable(),
  //     filter: transformedFilter,
  //     enumFromString: (String fieldKey) =>
  //         CustomerField.values.firstWhereOrNull((e) => e.name == fieldKey),
  //     getDbField: (table, field) => _dbFieldFromEnum(field)(table),
  //   );

  //   return CustomerDTO.db.find(
  //     session,
  //     where: expression == null
  //         // Filters out deleted entries
  //         ? (t) => t.deletedAt.equals(null as DateTime?)
  //         : (t) => expression,
  //     orderBy: sortByField != null
  //         ? _dbFieldFromEnum(sortByField)
  //         : _dbFieldFromEnum(CustomerField.customerName),
  //     orderDescending: sort?.orderDescending ?? false,
  //     include: _includeAll,
  //   );
  // }

  /// Find a List of Customers based on the filter and sort

  Future<CustomerDTO> create(Session session, ContactDTO contact) async {
    return CustomerHandler.create(
      session,
      contact,
    );
  }

  /// Delete Customer based on the provided customerId and sessionId
  Future<bool> delete(
    Session session, {
    required int customerId,
    required String sessionId,
  }) async {
    return CustomerHandler.delete(
      session,
      customerId: customerId,
      sessionId: sessionId,
    );
  }

  Future<CustomerDTO?> fetchAndLock(
    Session session, {
    required int id,
    required String sessionId,
  }) async {
    return CustomerHandler.fetchAndLock(
      session,
      id: id,
      sessionId: sessionId,
    );
  }

  Future<CustomerDTO?> update(
    Session session, {
    required CustomerDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    return CustomerHandler.update(
      session,
      entity: entity,
      sessionId: sessionId,
      release: release,
    );
  }

  Future<void> addShippingAddress(
    Session session, {
    required int customerId,
    required int contactId,
  }) async {
    await CustomerShippingHandler.addShippingAddress(
      session,
      customerId: customerId,
      contactId: contactId,
    );
  }

  Future<void> deleteShippingAddress(
    Session session, {
    required CustomerShippingContactDTO customerShippingContact,
  }) async {
    await CustomerShippingHandler.delete(
      session,
      customerShippingContact,
    );
  }

  ///
  /// Customer Billing Addresses
  ///

  Future<List<CustomerBillingCustomerDTO>> fetchBillingAddresses(
    Session session, {
    required int customerId,
    Sort? sort,
    Filter? filter,
  }) async {
    final billgingCustomers =
        await CustomerBillingCustomerEndpoint().fetchBillingCustomers(
      session,
      customerId: customerId,
      sort: sort,
      filter: filter,
    );
    return billgingCustomers;
  }

  // Future<List<int>> fetchBillingAddressesForExcludeFilter(
  //   Session session, {
  //   required int customerId,
  // }) async {
  //   final billgingCustomers = await CustomerBillingCustomerEndpoint()
  //       .fetchBillingCustomersForExcludeFilter(session, customerId: customerId);
  //   return billgingCustomers.map((e) => e.billingCustomerId).toList();
  // }

  Future<void> addBillingAddress(
    Session session, {
    required int customerId,
    required int customerCustomerId,
    required bool isPrimary,
  }) async {
    await CustomerBillingCustomersHandler.addBillingAddress(
      session,
      customerId: customerId,
      customerCustomerId: customerCustomerId,
      isPrimary: isPrimary,
    );
  }

  Future<void> deleteBillingAddress(
    Session session, {
    required CustomerBillingCustomerDTO customerBillingCustomer,
  }) async {
    await CustomerBillingCustomersHandler.delete(
      session,
      customerBillingCustomer,
    );
  }

  ///
  /// Customer Customers
  ///

  Future<List<EntityLockDTO>> findEntityLocks(Session session) async {
    final entities = await CustomerDTO.db.find(
      session,
      where: (t) =>
          t.editingSession.notEquals(null as String?) &
          t.editingSession.notEquals(''),
    );

    return entities
        .map(
          (e) => EntityLockDTO(
            tableType: CustomerUtils.tableType.name,
            entityId: e.id!,
            editingSessionId: e.editingSession!,
            lockedAt: e.editingSince!,
            userId: e.editingById,
          ),
        )
        .toList();
  }
}
