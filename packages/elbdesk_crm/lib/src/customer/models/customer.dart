import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/elbdesk_crm.dart';
import 'package:elbdesk_crm/src/app_client/models/app_client.dart';
import 'package:elbdesk_crm/src/payment_code/models/payment_code.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer.freezed.dart';
part 'customer.g.dart';

/// Customer
///
/// This is the app side Customer model. It is used to store contact information
/// for a contact during runtime. The CustomerDTO is fetched from the server and
/// converted to a Customer object.
///
/// To parse the CustomerDTO to and from a Customer object, the fromDTO and
/// toDTO methods are used.
///
@freezed
class Customer with _$Customer, HasMetaData {
  /// Customer constructor
  const factory Customer({
    required DataMeta meta,
    required Contact? contact,
    required int customId,
    required String vatId,
    required String invoiceEmail,
    required InvoiceDeliveryMethod? invoiceDeliveryMethod,
    required CustomerSalesOrderHints salesOrderHints,
    required PaymentCode? paymentCode,
    required ShippingMethod? shippingMethod,
    required List<FTPInterfaceDTO> ftpInterfaces,
    required AppClient? contractSovereignty,
    required LightUser? assignedUser,
    int? id,
  }) = _Customer;

  const Customer._();

  factory Customer.fromJson(Map<String, Object?> json) =>
      _$CustomerFromJson(json);

  /// Customer from DTO
  factory Customer.fromDTO(CustomerDTO dto) {
    final dataMeta = DataMeta.fromDTO(dto);

    final customer = Customer(
      contractSovereignty: dto.contractSovereignty != null
          ? AppClient.fromDTO(dto.contractSovereignty!)
          : null,
      id: dto.id,
      customId: dto.customId,
      assignedUser: dto.assignedUser != null
          ? LightUser.fromDTO(dto.assignedUser!)
          : null,
      vatId: dto.vatId,
      invoiceEmail: dto.invoiceEmail,
      paymentCode: dto.paymentCode != null
          ? PaymentCode.fromDTO(dto.paymentCode!)
          : null,
      shippingMethod: dto.shippingMethod != null
          ? ShippingMethod.fromDTO(dto.shippingMethod!)
          : null,
      invoiceDeliveryMethod: dto.invoiceDeliveryMethod != null
          ? Parser.enumFromString(
              InvoiceDeliveryMethod.values,
              dto.invoiceDeliveryMethod,
            )
          : null,
      contact: dto.contact == null ? null : Contact.fromDTO(dto.contact!),
      meta: dataMeta,
      ftpInterfaces: dto.ftpInterfaces ?? [],
      salesOrderHints: dto.salesOrderHints == null
          ? const CustomerSalesOrderHints(
              firstReference: '',
              secondReference: '',
              orderNumber: '',
              keywords: '',
            )
          : CustomerSalesOrderHints.fromDTO(dto.salesOrderHints!),
    );

    return customer;
  }

  /// Customer to DTO
  CustomerDTO toDTO() => CustomerDTO(
        contractSovereignty: contractSovereignty?.toDTO(),
        contractSovereigntyId: contractSovereignty?.meta.id,
        assignedUser: assignedUser?.toDTO(),
        assignedUserId: assignedUser?.lightUserId,
        customId: customId,
        customIdString: customId.toString(),
        isDraft: meta.isDraft,
        invoiceEmail: invoiceEmail,
        invoiceDeliveryMethod: invoiceDeliveryMethod?.name,
        shippingMethodId: shippingMethod?.id,
        paymentCode: paymentCode?.toDTO(),
        paymentCodeId: paymentCode?.id,
        id: id,
        salesOrderHints: salesOrderHints.toDTO(),
        lastModifiedAt: meta.lastModifiedAt,
        createdAt: meta.createdAt!,
        contact: contact?.toDTO(),
        contactId: contact?.meta.id,
        ftpInterfaces: ftpInterfaces,
        vatId: vatId,
      );
}

@freezed
class CustomerSalesOrderHints with _$CustomerSalesOrderHints {
  const factory CustomerSalesOrderHints({
    required String firstReference,
    required String secondReference,
    required String orderNumber,
    required String keywords,
  }) = _CustomerSalesOrderHints;

  const CustomerSalesOrderHints._();

  factory CustomerSalesOrderHints.fromJson(Map<String, Object?> json) =>
      _$CustomerSalesOrderHintsFromJson(json);

  factory CustomerSalesOrderHints.fromDTO(CustomerSalesOrderHintsDTO dto) {
    return CustomerSalesOrderHints(
      firstReference: dto.firstReference,
      secondReference: dto.secondReference,
      orderNumber: dto.orderNumber,
      keywords: dto.keywords,
    );
  }

  CustomerSalesOrderHintsDTO toDTO() => CustomerSalesOrderHintsDTO(
        firstReference: firstReference,
        secondReference: secondReference,
        orderNumber: orderNumber,
        keywords: keywords,
      );
}

/// ComparableCustomer
///
/// The ComparableContact model is used to compare two contacts. The Comparable
/// gets rid of the MetaData and enables the contact to be compared with just
/// the contact information

class CustomerAdditionalData implements AdditionalEntityData {
  const CustomerAdditionalData({
    required this.customerName,
  });

  factory CustomerAdditionalData.fromJson(Map<String, dynamic> json) {
    return CustomerAdditionalData(
      customerName: json['customerName'] as String,
    );
  }

  final String customerName;

  @override
  Map<String, dynamic> toJson() {
    return {
      'customerName': customerName,
    };
  }
}
