import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/src/customer/models/customer_customer.dart';

class CustomerCustomerRepository {
  CustomerCustomerRepository({
    required this.endpoint,
  });

  final EndpointCustomerCustomer endpoint;

  Future<List<CustomerCustomer>> fetchCustomerCustomers(
    int customerId,
    Sort? sort,
    Filter? filter,
  ) async {
    final customers = await endpoint.fetchCustomerCustomers(
      customerId: customerId,
      sort: sort,
      filter: filter,
    );

    return customers.map(CustomerCustomer.fromDTO).toList();
  }

  Future<void> deleteCustomerCustomer(int customerCustomerId) async {
    await endpoint.deleteCustomerCustomer(
      customerCustomerId: customerCustomerId,
    );
  }

  Future<void> addCustomerCustomer({
    required int customerId,
    required int customerCustomerContactId,
  }) async {
    await endpoint.addCustomerCustomer(
      customerId: customerId,
      customerCustomerContactId: customerCustomerContactId,
    );
  }
}
