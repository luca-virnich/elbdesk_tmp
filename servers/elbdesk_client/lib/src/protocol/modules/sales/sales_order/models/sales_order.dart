/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import '../../../../modules/crm/customer/models/customer.dart' as _i2;
import '../../../../modules/crm/contact/models/contact.dart' as _i3;
import 'package:elbdesk_backend_core_client/elbdesk_backend_core_client.dart'
    as _i4;
import '../../../../modules/crm/customer_customer/models/customer_customer.dart'
    as _i5;
import '../../../../modules/prepress/drucklayout/models/drucklayout_sales_order_jt.dart'
    as _i6;

abstract class SalesOrderDTO implements _i1.SerializableModel {
  SalesOrderDTO._({
    this.id,
    required this.description,
    required this.orderDate,
    required this.customId,
    this.customIdString,
    required this.keywords,
    required this.orderNumber,
    required this.status,
    this.billingAddressId,
    this.billingAddress,
    this.shippingAddressId,
    this.shippingAddress,
    this.assignedUserId,
    this.assignedUser,
    this.customerCustomerId,
    this.customerCustomer,
    this.customerCustomerContactPersonId,
    this.customerCustomerContactPerson,
    this.drucklayouts,
    required this.customerId,
    this.customer,
    this.customerContactPersonId,
    this.customerContactPerson,
    required this.customerFirstReference,
    required this.customerSecondReference,
    required this.customerCustomerReference,
    required this.createdAt,
    this.createdById,
    this.lastModifiedAt,
    this.lastModifiedById,
    this.deletedAt,
    this.deletedById,
    this.editingById,
    this.editingSince,
    required this.isDraft,
    this.editingSession,
  });

  factory SalesOrderDTO({
    int? id,
    required String description,
    required DateTime orderDate,
    required int customId,
    String? customIdString,
    required String keywords,
    required String orderNumber,
    required String status,
    int? billingAddressId,
    _i2.CustomerDTO? billingAddress,
    int? shippingAddressId,
    _i3.ContactDTO? shippingAddress,
    int? assignedUserId,
    _i4.LightUserDTO? assignedUser,
    int? customerCustomerId,
    _i5.CustomerCustomerDTO? customerCustomer,
    int? customerCustomerContactPersonId,
    _i3.ContactDTO? customerCustomerContactPerson,
    List<_i6.DrucklayoutSalesOrderJT>? drucklayouts,
    required int customerId,
    _i2.CustomerDTO? customer,
    int? customerContactPersonId,
    _i3.ContactDTO? customerContactPerson,
    required String customerFirstReference,
    required String customerSecondReference,
    required String customerCustomerReference,
    required DateTime createdAt,
    int? createdById,
    DateTime? lastModifiedAt,
    int? lastModifiedById,
    DateTime? deletedAt,
    int? deletedById,
    int? editingById,
    DateTime? editingSince,
    required bool isDraft,
    String? editingSession,
  }) = _SalesOrderDTOImpl;

  factory SalesOrderDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return SalesOrderDTO(
      id: jsonSerialization['id'] as int?,
      description: jsonSerialization['description'] as String,
      orderDate:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['orderDate']),
      customId: jsonSerialization['customId'] as int,
      customIdString: jsonSerialization['customIdString'] as String?,
      keywords: jsonSerialization['keywords'] as String,
      orderNumber: jsonSerialization['orderNumber'] as String,
      status: jsonSerialization['status'] as String,
      billingAddressId: jsonSerialization['billingAddressId'] as int?,
      billingAddress: jsonSerialization['billingAddress'] == null
          ? null
          : _i2.CustomerDTO.fromJson(
              (jsonSerialization['billingAddress'] as Map<String, dynamic>)),
      shippingAddressId: jsonSerialization['shippingAddressId'] as int?,
      shippingAddress: jsonSerialization['shippingAddress'] == null
          ? null
          : _i3.ContactDTO.fromJson(
              (jsonSerialization['shippingAddress'] as Map<String, dynamic>)),
      assignedUserId: jsonSerialization['assignedUserId'] as int?,
      assignedUser: jsonSerialization['assignedUser'] == null
          ? null
          : _i4.LightUserDTO.fromJson(
              (jsonSerialization['assignedUser'] as Map<String, dynamic>)),
      customerCustomerId: jsonSerialization['customerCustomerId'] as int?,
      customerCustomer: jsonSerialization['customerCustomer'] == null
          ? null
          : _i5.CustomerCustomerDTO.fromJson(
              (jsonSerialization['customerCustomer'] as Map<String, dynamic>)),
      customerCustomerContactPersonId:
          jsonSerialization['customerCustomerContactPersonId'] as int?,
      customerCustomerContactPerson:
          jsonSerialization['customerCustomerContactPerson'] == null
              ? null
              : _i3.ContactDTO.fromJson(
                  (jsonSerialization['customerCustomerContactPerson']
                      as Map<String, dynamic>)),
      drucklayouts: (jsonSerialization['drucklayouts'] as List?)
          ?.map((e) =>
              _i6.DrucklayoutSalesOrderJT.fromJson((e as Map<String, dynamic>)))
          .toList(),
      customerId: jsonSerialization['customerId'] as int,
      customer: jsonSerialization['customer'] == null
          ? null
          : _i2.CustomerDTO.fromJson(
              (jsonSerialization['customer'] as Map<String, dynamic>)),
      customerContactPersonId:
          jsonSerialization['customerContactPersonId'] as int?,
      customerContactPerson: jsonSerialization['customerContactPerson'] == null
          ? null
          : _i3.ContactDTO.fromJson((jsonSerialization['customerContactPerson']
              as Map<String, dynamic>)),
      customerFirstReference:
          jsonSerialization['customerFirstReference'] as String,
      customerSecondReference:
          jsonSerialization['customerSecondReference'] as String,
      customerCustomerReference:
          jsonSerialization['customerCustomerReference'] as String,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      createdById: jsonSerialization['createdById'] as int?,
      lastModifiedAt: jsonSerialization['lastModifiedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['lastModifiedAt']),
      lastModifiedById: jsonSerialization['lastModifiedById'] as int?,
      deletedAt: jsonSerialization['deletedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['deletedAt']),
      deletedById: jsonSerialization['deletedById'] as int?,
      editingById: jsonSerialization['editingById'] as int?,
      editingSince: jsonSerialization['editingSince'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['editingSince']),
      isDraft: jsonSerialization['isDraft'] as bool,
      editingSession: jsonSerialization['editingSession'] as String?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String description;

  DateTime orderDate;

  int customId;

  String? customIdString;

  String keywords;

  String orderNumber;

  String status;

  int? billingAddressId;

  _i2.CustomerDTO? billingAddress;

  int? shippingAddressId;

  _i3.ContactDTO? shippingAddress;

  int? assignedUserId;

  _i4.LightUserDTO? assignedUser;

  int? customerCustomerId;

  _i5.CustomerCustomerDTO? customerCustomer;

  int? customerCustomerContactPersonId;

  _i3.ContactDTO? customerCustomerContactPerson;

  List<_i6.DrucklayoutSalesOrderJT>? drucklayouts;

  int customerId;

  _i2.CustomerDTO? customer;

  int? customerContactPersonId;

  _i3.ContactDTO? customerContactPerson;

  String customerFirstReference;

  String customerSecondReference;

  String customerCustomerReference;

  DateTime createdAt;

  int? createdById;

  DateTime? lastModifiedAt;

  int? lastModifiedById;

  DateTime? deletedAt;

  int? deletedById;

  int? editingById;

  DateTime? editingSince;

  bool isDraft;

  String? editingSession;

  /// Returns a shallow copy of this [SalesOrderDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SalesOrderDTO copyWith({
    int? id,
    String? description,
    DateTime? orderDate,
    int? customId,
    String? customIdString,
    String? keywords,
    String? orderNumber,
    String? status,
    int? billingAddressId,
    _i2.CustomerDTO? billingAddress,
    int? shippingAddressId,
    _i3.ContactDTO? shippingAddress,
    int? assignedUserId,
    _i4.LightUserDTO? assignedUser,
    int? customerCustomerId,
    _i5.CustomerCustomerDTO? customerCustomer,
    int? customerCustomerContactPersonId,
    _i3.ContactDTO? customerCustomerContactPerson,
    List<_i6.DrucklayoutSalesOrderJT>? drucklayouts,
    int? customerId,
    _i2.CustomerDTO? customer,
    int? customerContactPersonId,
    _i3.ContactDTO? customerContactPerson,
    String? customerFirstReference,
    String? customerSecondReference,
    String? customerCustomerReference,
    DateTime? createdAt,
    int? createdById,
    DateTime? lastModifiedAt,
    int? lastModifiedById,
    DateTime? deletedAt,
    int? deletedById,
    int? editingById,
    DateTime? editingSince,
    bool? isDraft,
    String? editingSession,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'description': description,
      'orderDate': orderDate.toJson(),
      'customId': customId,
      if (customIdString != null) 'customIdString': customIdString,
      'keywords': keywords,
      'orderNumber': orderNumber,
      'status': status,
      if (billingAddressId != null) 'billingAddressId': billingAddressId,
      if (billingAddress != null) 'billingAddress': billingAddress?.toJson(),
      if (shippingAddressId != null) 'shippingAddressId': shippingAddressId,
      if (shippingAddress != null) 'shippingAddress': shippingAddress?.toJson(),
      if (assignedUserId != null) 'assignedUserId': assignedUserId,
      if (assignedUser != null) 'assignedUser': assignedUser?.toJson(),
      if (customerCustomerId != null) 'customerCustomerId': customerCustomerId,
      if (customerCustomer != null)
        'customerCustomer': customerCustomer?.toJson(),
      if (customerCustomerContactPersonId != null)
        'customerCustomerContactPersonId': customerCustomerContactPersonId,
      if (customerCustomerContactPerson != null)
        'customerCustomerContactPerson':
            customerCustomerContactPerson?.toJson(),
      if (drucklayouts != null)
        'drucklayouts': drucklayouts?.toJson(valueToJson: (v) => v.toJson()),
      'customerId': customerId,
      if (customer != null) 'customer': customer?.toJson(),
      if (customerContactPersonId != null)
        'customerContactPersonId': customerContactPersonId,
      if (customerContactPerson != null)
        'customerContactPerson': customerContactPerson?.toJson(),
      'customerFirstReference': customerFirstReference,
      'customerSecondReference': customerSecondReference,
      'customerCustomerReference': customerCustomerReference,
      'createdAt': createdAt.toJson(),
      if (createdById != null) 'createdById': createdById,
      if (lastModifiedAt != null) 'lastModifiedAt': lastModifiedAt?.toJson(),
      if (lastModifiedById != null) 'lastModifiedById': lastModifiedById,
      if (deletedAt != null) 'deletedAt': deletedAt?.toJson(),
      if (deletedById != null) 'deletedById': deletedById,
      if (editingById != null) 'editingById': editingById,
      if (editingSince != null) 'editingSince': editingSince?.toJson(),
      'isDraft': isDraft,
      if (editingSession != null) 'editingSession': editingSession,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SalesOrderDTOImpl extends SalesOrderDTO {
  _SalesOrderDTOImpl({
    int? id,
    required String description,
    required DateTime orderDate,
    required int customId,
    String? customIdString,
    required String keywords,
    required String orderNumber,
    required String status,
    int? billingAddressId,
    _i2.CustomerDTO? billingAddress,
    int? shippingAddressId,
    _i3.ContactDTO? shippingAddress,
    int? assignedUserId,
    _i4.LightUserDTO? assignedUser,
    int? customerCustomerId,
    _i5.CustomerCustomerDTO? customerCustomer,
    int? customerCustomerContactPersonId,
    _i3.ContactDTO? customerCustomerContactPerson,
    List<_i6.DrucklayoutSalesOrderJT>? drucklayouts,
    required int customerId,
    _i2.CustomerDTO? customer,
    int? customerContactPersonId,
    _i3.ContactDTO? customerContactPerson,
    required String customerFirstReference,
    required String customerSecondReference,
    required String customerCustomerReference,
    required DateTime createdAt,
    int? createdById,
    DateTime? lastModifiedAt,
    int? lastModifiedById,
    DateTime? deletedAt,
    int? deletedById,
    int? editingById,
    DateTime? editingSince,
    required bool isDraft,
    String? editingSession,
  }) : super._(
          id: id,
          description: description,
          orderDate: orderDate,
          customId: customId,
          customIdString: customIdString,
          keywords: keywords,
          orderNumber: orderNumber,
          status: status,
          billingAddressId: billingAddressId,
          billingAddress: billingAddress,
          shippingAddressId: shippingAddressId,
          shippingAddress: shippingAddress,
          assignedUserId: assignedUserId,
          assignedUser: assignedUser,
          customerCustomerId: customerCustomerId,
          customerCustomer: customerCustomer,
          customerCustomerContactPersonId: customerCustomerContactPersonId,
          customerCustomerContactPerson: customerCustomerContactPerson,
          drucklayouts: drucklayouts,
          customerId: customerId,
          customer: customer,
          customerContactPersonId: customerContactPersonId,
          customerContactPerson: customerContactPerson,
          customerFirstReference: customerFirstReference,
          customerSecondReference: customerSecondReference,
          customerCustomerReference: customerCustomerReference,
          createdAt: createdAt,
          createdById: createdById,
          lastModifiedAt: lastModifiedAt,
          lastModifiedById: lastModifiedById,
          deletedAt: deletedAt,
          deletedById: deletedById,
          editingById: editingById,
          editingSince: editingSince,
          isDraft: isDraft,
          editingSession: editingSession,
        );

  /// Returns a shallow copy of this [SalesOrderDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SalesOrderDTO copyWith({
    Object? id = _Undefined,
    String? description,
    DateTime? orderDate,
    int? customId,
    Object? customIdString = _Undefined,
    String? keywords,
    String? orderNumber,
    String? status,
    Object? billingAddressId = _Undefined,
    Object? billingAddress = _Undefined,
    Object? shippingAddressId = _Undefined,
    Object? shippingAddress = _Undefined,
    Object? assignedUserId = _Undefined,
    Object? assignedUser = _Undefined,
    Object? customerCustomerId = _Undefined,
    Object? customerCustomer = _Undefined,
    Object? customerCustomerContactPersonId = _Undefined,
    Object? customerCustomerContactPerson = _Undefined,
    Object? drucklayouts = _Undefined,
    int? customerId,
    Object? customer = _Undefined,
    Object? customerContactPersonId = _Undefined,
    Object? customerContactPerson = _Undefined,
    String? customerFirstReference,
    String? customerSecondReference,
    String? customerCustomerReference,
    DateTime? createdAt,
    Object? createdById = _Undefined,
    Object? lastModifiedAt = _Undefined,
    Object? lastModifiedById = _Undefined,
    Object? deletedAt = _Undefined,
    Object? deletedById = _Undefined,
    Object? editingById = _Undefined,
    Object? editingSince = _Undefined,
    bool? isDraft,
    Object? editingSession = _Undefined,
  }) {
    return SalesOrderDTO(
      id: id is int? ? id : this.id,
      description: description ?? this.description,
      orderDate: orderDate ?? this.orderDate,
      customId: customId ?? this.customId,
      customIdString:
          customIdString is String? ? customIdString : this.customIdString,
      keywords: keywords ?? this.keywords,
      orderNumber: orderNumber ?? this.orderNumber,
      status: status ?? this.status,
      billingAddressId:
          billingAddressId is int? ? billingAddressId : this.billingAddressId,
      billingAddress: billingAddress is _i2.CustomerDTO?
          ? billingAddress
          : this.billingAddress?.copyWith(),
      shippingAddressId: shippingAddressId is int?
          ? shippingAddressId
          : this.shippingAddressId,
      shippingAddress: shippingAddress is _i3.ContactDTO?
          ? shippingAddress
          : this.shippingAddress?.copyWith(),
      assignedUserId:
          assignedUserId is int? ? assignedUserId : this.assignedUserId,
      assignedUser: assignedUser is _i4.LightUserDTO?
          ? assignedUser
          : this.assignedUser?.copyWith(),
      customerCustomerId: customerCustomerId is int?
          ? customerCustomerId
          : this.customerCustomerId,
      customerCustomer: customerCustomer is _i5.CustomerCustomerDTO?
          ? customerCustomer
          : this.customerCustomer?.copyWith(),
      customerCustomerContactPersonId: customerCustomerContactPersonId is int?
          ? customerCustomerContactPersonId
          : this.customerCustomerContactPersonId,
      customerCustomerContactPerson:
          customerCustomerContactPerson is _i3.ContactDTO?
              ? customerCustomerContactPerson
              : this.customerCustomerContactPerson?.copyWith(),
      drucklayouts: drucklayouts is List<_i6.DrucklayoutSalesOrderJT>?
          ? drucklayouts
          : this.drucklayouts?.map((e0) => e0.copyWith()).toList(),
      customerId: customerId ?? this.customerId,
      customer:
          customer is _i2.CustomerDTO? ? customer : this.customer?.copyWith(),
      customerContactPersonId: customerContactPersonId is int?
          ? customerContactPersonId
          : this.customerContactPersonId,
      customerContactPerson: customerContactPerson is _i3.ContactDTO?
          ? customerContactPerson
          : this.customerContactPerson?.copyWith(),
      customerFirstReference:
          customerFirstReference ?? this.customerFirstReference,
      customerSecondReference:
          customerSecondReference ?? this.customerSecondReference,
      customerCustomerReference:
          customerCustomerReference ?? this.customerCustomerReference,
      createdAt: createdAt ?? this.createdAt,
      createdById: createdById is int? ? createdById : this.createdById,
      lastModifiedAt:
          lastModifiedAt is DateTime? ? lastModifiedAt : this.lastModifiedAt,
      lastModifiedById:
          lastModifiedById is int? ? lastModifiedById : this.lastModifiedById,
      deletedAt: deletedAt is DateTime? ? deletedAt : this.deletedAt,
      deletedById: deletedById is int? ? deletedById : this.deletedById,
      editingById: editingById is int? ? editingById : this.editingById,
      editingSince:
          editingSince is DateTime? ? editingSince : this.editingSince,
      isDraft: isDraft ?? this.isDraft,
      editingSession:
          editingSession is String? ? editingSession : this.editingSession,
    );
  }
}
