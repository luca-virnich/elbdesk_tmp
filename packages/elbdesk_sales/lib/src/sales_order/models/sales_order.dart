import 'dart:convert';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/elbdesk_crm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_order.freezed.dart';
part 'sales_order.g.dart';

/// Sales Order
///
/// The Sales Order model is our client model for the SalesOrderDTO
///
/// A Sales Order can be created by a user and is used to create a new order
/// for a customer. The Sales Order can have multiple Sales Order Items.
///
@freezed
class SalesOrder with _$SalesOrder, HasMetaData {
  /// Sales Order constructor
  const factory SalesOrder({
    required String description,
    required int customId,
    required DateTime? orderDate,
    required LightUser? assignedUser,
    required String keywords,
    required String orderNumber,
    required SalesOrderStatus status, // required List<SalesOrderItem> items,
    required Customer? customer,
    required Contact? customerContactPerson,
    required Contact? customerCustomerContactPerson,
    required CustomerCustomer? customerCustomer,
    required String customerFirstReference,
    required String customerSecondReference,
    required String customerCustomerReference,
    required Contact? shippingAddress,
    required Customer? billingAddress,
    required DataMeta meta,
  }) = _SalesOrder;

  factory SalesOrder.fromJson(Map<String, Object?> json) =>
      _$SalesOrderFromJson(json);

  /// Sales Order from DTO
  factory SalesOrder.fromDTO(SalesOrderDTO dto) {
    final dataMeta = DataMeta.fromDTO(dto);

    return SalesOrder(
      keywords: dto.keywords,
      customId: dto.customId,
      assignedUser: dto.assignedUser != null
          ? LightUser.fromDTO(dto.assignedUser!)
          : null,

      description: dto.description,
      orderDate: dto.orderDate.toLocal(),
      status: Parser.enumFromString(
        SalesOrderStatus.values,
        dto.status,
      )!,
      billingAddress: dto.billingAddress != null
          ? Customer.fromDTO(dto.billingAddress!)
          : null,

      shippingAddress: dto.shippingAddress != null
          ? Contact.fromDTO(dto.shippingAddress!)
          : null,

      orderNumber: dto.orderNumber,
      // items: (dto.items ?? []).map(SalesOrderItem.fromDTO).toList(),

      customer: dto.customer != null ? Customer.fromDTO(dto.customer!) : null,
      meta: dataMeta,
      customerContactPerson: dto.customerContactPerson != null
          ? Contact.fromDTO(dto.customerContactPerson!)
          : null,
      customerCustomerContactPerson: dto.customerCustomerContactPerson != null
          ? Contact.fromDTO(dto.customerCustomerContactPerson!)
          : null,
      customerCustomer: dto.customerCustomer != null
          ? CustomerCustomer.fromDTO(dto.customerCustomer!)
          : null,
      customerFirstReference: dto.customerFirstReference,
      customerSecondReference: dto.customerSecondReference,
      customerCustomerReference: dto.customerCustomerReference,
    );
  }

  /// Sales Order constructor
  const SalesOrder._();

  String get fullSalesOrderId {
    return 'VA-$customId';
  }

  /// Sales Order to DTO
  SalesOrderDTO toDTO() {
    return SalesOrderDTO(
      id: meta.id,
      description: description,
      customId: customId,
      customIdString: customId.toString(),
      keywords: keywords,
      customerContactPersonId: customerContactPerson?.meta.id,
      customerCustomerContactPersonId: customerCustomerContactPerson?.meta.id,
      customerCustomerId: customerCustomer?.id,
      status: status.name,
      orderDate: orderDate!,
      billingAddressId: billingAddress?.id,
      assignedUser: assignedUser?.toDTO(),
      shippingAddressId: shippingAddress?.meta.id,
      assignedUserId: assignedUser?.lightUserId,
      orderNumber: orderNumber,
      createdAt: meta.createdAt!,
      isDraft: meta.isDraft,
      lastModifiedAt: meta.lastModifiedAt,
      customerId: customer!.meta.id!,
      customerFirstReference: customerFirstReference,
      customerSecondReference: customerSecondReference,
      customerCustomerReference: customerCustomerReference,
    );
  }
}

class SalesOrderAdditionalData implements AdditionalEntityData {
  const SalesOrderAdditionalData({
    required this.customId,
    required this.customerName,
    this.status,
    this.keywords,
  });

  factory SalesOrderAdditionalData.fromJsonString(String jsonString) {
    final json = jsonDecode(jsonString) as Map<String, dynamic>;
    return SalesOrderAdditionalData.fromJson(json);
  }

  factory SalesOrderAdditionalData.fromJson(Map<String, dynamic> json) {
    return SalesOrderAdditionalData(
      customerName:
          json[SalesOrderAdditionalDataField.customerName.name] as String,
      customId: json[SalesOrderAdditionalDataField.customId.name] as String,
      status: json[SalesOrderAdditionalDataField.status.name] as String?,
      keywords: json[SalesOrderAdditionalDataField.keywords.name] as String?,
    );
  }

  // We are using the customId only to show in the recent window
  // and in the note notification as Label
  final String customId;

  // The customer name is used to show in the recent window and in the
  // note notification as subtitle
  final String customerName;

  final String? status;

  final String? keywords;

  @override
  Map<String, dynamic> toJson() {
    return {
      SalesOrderAdditionalDataField.customerName.name: customerName,
      SalesOrderAdditionalDataField.customId.name: customId,
      SalesOrderAdditionalDataField.status.name: status,
      SalesOrderAdditionalDataField.keywords.name: keywords,
    };
  }
}
