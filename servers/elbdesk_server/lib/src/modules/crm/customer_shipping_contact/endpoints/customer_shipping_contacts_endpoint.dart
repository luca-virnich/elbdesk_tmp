import 'dart:async';

import 'package:collection/collection.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/modules/crm/contact/models/contact.dart';
import 'package:elbdesk_server/src/generated/modules/crm/country_code/models/country_code.dart';
import 'package:elbdesk_server/src/generated/modules/crm/customer/models/customer.dart';
import 'package:elbdesk_server/src/generated/modules/crm/customer_shipping_contact/models/customer_shipping_contact.dart';
import 'package:elbdesk_server/src/generated/modules/crm/customer_shipping_contact/models/customer_shipping_contact_field.dart';
import 'package:elbdesk_server/src/modules/crm/customer_shipping_contact/customer_shipping_contact_utils.dart';
import 'package:elbdesk_server/src/modules/crm/customer_shipping_contact/customer_shipping_handler.dart';
import 'package:serverpod/serverpod.dart';

final customerShippingContactStreamController =
    StreamController<CustomerShippingContactDTO>.broadcast();

final customerShippingContactDeletionStreamController =
    StreamController<int>.broadcast();

class CustomerShippingContactsEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Stream<CustomerShippingContactDTO> watchByCustomer(
    Session session, {
    required int customerId,
  }) async* {
    yield* customerShippingContactStreamController.stream
        .where((event) => event.customerId == customerId)
        .map((event) {
      return event;
    });
  }

  Stream<int> watchDeletionsByCustomer(
    Session session,
  ) async* {
    yield* customerShippingContactDeletionStreamController.stream;
  }

  Future<CustomerShippingContactDTO?> fetch(
    Session session,
    int customerShippingContactId,
  ) async {
    return CustomerShippingContactDTO.db
        .findById(session, customerShippingContactId);
  }

  Future<List<CustomerShippingContactDTO>> fetchShippingContacts(
    Session session, {
    required int customerId,
    Sort? sort,
    Filter? filter,
  }) {
    final sortByField = CustomerShippingContactField.values.firstWhereOrNull(
      (e) => e.name == sort?.fieldKey,
    );

    final filterExpression =
        CustomerShippingContactUtils.buildExpression(filter);

    var expression =
        CustomerShippingContactDTOTable().customerId.equals(customerId);

    if (filterExpression != null) {
      expression = expression & filterExpression;
    }

    return CustomerShippingContactDTO.db.find(
      session,
      include: CustomerShippingContactDTO.include(
        shippingContact: ContactDTO.include(
          countryCode: CountryCodeDTO.include(),
        ),
        customer: CustomerDTO.include(),
      ),
      where: (t) => expression,
      orderBy: CustomerShippingContactUtils.orderBy(sortByField),
      orderDescending: sort?.orderDescending ?? false,
    );
  }

  Future<void> markAsPrimary(
    Session session, {
    required CustomerShippingContactDTO customerShippingContact,
  }) async {
    await CustomerShippingHandler.markAsPrimary(
      session,
      customerShippingContact,
    );
  }

  Future<void> removeAsPrimary(
    Session session, {
    required int customerId,
  }) async {
    await CustomerShippingHandler.removeAsPrimary(session, customerId);
  }

  Future<void> deleteShippingAddress(
    Session session, {
    required int customerShippingContactId,
  }) async {
    final shippingContact = await fetch(session, customerShippingContactId);
    if (shippingContact == null) {
      throw Exception('Shipping contact not found');
    }
    await CustomerShippingContactDTO.db.deleteRow(
      session,
      shippingContact,
    );
    customerShippingContactDeletionStreamController
        .add(customerShippingContactId);
  }
}
