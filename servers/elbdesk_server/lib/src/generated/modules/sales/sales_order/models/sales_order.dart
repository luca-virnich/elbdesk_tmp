/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: unnecessary_null_comparison

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../../../../modules/crm/customer/models/customer.dart' as _i2;
import '../../../../modules/crm/contact/models/contact.dart' as _i3;
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart'
    as _i4;
import '../../../../modules/crm/customer_customer/models/customer_customer.dart'
    as _i5;
import '../../../../modules/prepress/drucklayout/models/drucklayout_sales_order_jt.dart'
    as _i6;

abstract class SalesOrderDTO
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = SalesOrderDTOTable();

  static const db = SalesOrderDTORepository._();

  @override
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

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
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
      if (billingAddress != null)
        'billingAddress': billingAddress?.toJsonForProtocol(),
      if (shippingAddressId != null) 'shippingAddressId': shippingAddressId,
      if (shippingAddress != null)
        'shippingAddress': shippingAddress?.toJsonForProtocol(),
      if (assignedUserId != null) 'assignedUserId': assignedUserId,
      if (assignedUser != null)
        'assignedUser': assignedUser?.toJsonForProtocol(),
      if (customerCustomerId != null) 'customerCustomerId': customerCustomerId,
      if (customerCustomer != null)
        'customerCustomer': customerCustomer?.toJsonForProtocol(),
      if (customerCustomerContactPersonId != null)
        'customerCustomerContactPersonId': customerCustomerContactPersonId,
      if (customerCustomerContactPerson != null)
        'customerCustomerContactPerson':
            customerCustomerContactPerson?.toJsonForProtocol(),
      if (drucklayouts != null)
        'drucklayouts':
            drucklayouts?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'customerId': customerId,
      if (customer != null) 'customer': customer?.toJsonForProtocol(),
      if (customerContactPersonId != null)
        'customerContactPersonId': customerContactPersonId,
      if (customerContactPerson != null)
        'customerContactPerson': customerContactPerson?.toJsonForProtocol(),
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

  static SalesOrderDTOInclude include({
    _i2.CustomerDTOInclude? billingAddress,
    _i3.ContactDTOInclude? shippingAddress,
    _i4.LightUserDTOInclude? assignedUser,
    _i5.CustomerCustomerDTOInclude? customerCustomer,
    _i3.ContactDTOInclude? customerCustomerContactPerson,
    _i6.DrucklayoutSalesOrderJTIncludeList? drucklayouts,
    _i2.CustomerDTOInclude? customer,
    _i3.ContactDTOInclude? customerContactPerson,
  }) {
    return SalesOrderDTOInclude._(
      billingAddress: billingAddress,
      shippingAddress: shippingAddress,
      assignedUser: assignedUser,
      customerCustomer: customerCustomer,
      customerCustomerContactPerson: customerCustomerContactPerson,
      drucklayouts: drucklayouts,
      customer: customer,
      customerContactPerson: customerContactPerson,
    );
  }

  static SalesOrderDTOIncludeList includeList({
    _i1.WhereExpressionBuilder<SalesOrderDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SalesOrderDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SalesOrderDTOTable>? orderByList,
    SalesOrderDTOInclude? include,
  }) {
    return SalesOrderDTOIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(SalesOrderDTO.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(SalesOrderDTO.t),
      include: include,
    );
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

class SalesOrderDTOTable extends _i1.Table<int?> {
  SalesOrderDTOTable({super.tableRelation})
      : super(tableName: 'ed_sales_sales_order') {
    description = _i1.ColumnString(
      'description',
      this,
    );
    orderDate = _i1.ColumnDateTime(
      'orderDate',
      this,
    );
    customId = _i1.ColumnInt(
      'customId',
      this,
    );
    customIdString = _i1.ColumnString(
      'customIdString',
      this,
    );
    keywords = _i1.ColumnString(
      'keywords',
      this,
    );
    orderNumber = _i1.ColumnString(
      'orderNumber',
      this,
    );
    status = _i1.ColumnString(
      'status',
      this,
    );
    billingAddressId = _i1.ColumnInt(
      'billingAddressId',
      this,
    );
    shippingAddressId = _i1.ColumnInt(
      'shippingAddressId',
      this,
    );
    assignedUserId = _i1.ColumnInt(
      'assignedUserId',
      this,
    );
    customerCustomerId = _i1.ColumnInt(
      'customerCustomerId',
      this,
    );
    customerCustomerContactPersonId = _i1.ColumnInt(
      'customerCustomerContactPersonId',
      this,
    );
    customerId = _i1.ColumnInt(
      'customerId',
      this,
    );
    customerContactPersonId = _i1.ColumnInt(
      'customerContactPersonId',
      this,
    );
    customerFirstReference = _i1.ColumnString(
      'customerFirstReference',
      this,
    );
    customerSecondReference = _i1.ColumnString(
      'customerSecondReference',
      this,
    );
    customerCustomerReference = _i1.ColumnString(
      'customerCustomerReference',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
    createdById = _i1.ColumnInt(
      'createdById',
      this,
    );
    lastModifiedAt = _i1.ColumnDateTime(
      'lastModifiedAt',
      this,
    );
    lastModifiedById = _i1.ColumnInt(
      'lastModifiedById',
      this,
    );
    deletedAt = _i1.ColumnDateTime(
      'deletedAt',
      this,
    );
    deletedById = _i1.ColumnInt(
      'deletedById',
      this,
    );
    editingById = _i1.ColumnInt(
      'editingById',
      this,
    );
    editingSince = _i1.ColumnDateTime(
      'editingSince',
      this,
    );
    isDraft = _i1.ColumnBool(
      'isDraft',
      this,
    );
    editingSession = _i1.ColumnString(
      'editingSession',
      this,
    );
  }

  late final _i1.ColumnString description;

  late final _i1.ColumnDateTime orderDate;

  late final _i1.ColumnInt customId;

  late final _i1.ColumnString customIdString;

  late final _i1.ColumnString keywords;

  late final _i1.ColumnString orderNumber;

  late final _i1.ColumnString status;

  late final _i1.ColumnInt billingAddressId;

  _i2.CustomerDTOTable? _billingAddress;

  late final _i1.ColumnInt shippingAddressId;

  _i3.ContactDTOTable? _shippingAddress;

  late final _i1.ColumnInt assignedUserId;

  _i4.LightUserDTOTable? _assignedUser;

  late final _i1.ColumnInt customerCustomerId;

  _i5.CustomerCustomerDTOTable? _customerCustomer;

  late final _i1.ColumnInt customerCustomerContactPersonId;

  _i3.ContactDTOTable? _customerCustomerContactPerson;

  _i6.DrucklayoutSalesOrderJTTable? ___drucklayouts;

  _i1.ManyRelation<_i6.DrucklayoutSalesOrderJTTable>? _drucklayouts;

  late final _i1.ColumnInt customerId;

  _i2.CustomerDTOTable? _customer;

  late final _i1.ColumnInt customerContactPersonId;

  _i3.ContactDTOTable? _customerContactPerson;

  late final _i1.ColumnString customerFirstReference;

  late final _i1.ColumnString customerSecondReference;

  late final _i1.ColumnString customerCustomerReference;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnInt createdById;

  late final _i1.ColumnDateTime lastModifiedAt;

  late final _i1.ColumnInt lastModifiedById;

  late final _i1.ColumnDateTime deletedAt;

  late final _i1.ColumnInt deletedById;

  late final _i1.ColumnInt editingById;

  late final _i1.ColumnDateTime editingSince;

  late final _i1.ColumnBool isDraft;

  late final _i1.ColumnString editingSession;

  _i2.CustomerDTOTable get billingAddress {
    if (_billingAddress != null) return _billingAddress!;
    _billingAddress = _i1.createRelationTable(
      relationFieldName: 'billingAddress',
      field: SalesOrderDTO.t.billingAddressId,
      foreignField: _i2.CustomerDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.CustomerDTOTable(tableRelation: foreignTableRelation),
    );
    return _billingAddress!;
  }

  _i3.ContactDTOTable get shippingAddress {
    if (_shippingAddress != null) return _shippingAddress!;
    _shippingAddress = _i1.createRelationTable(
      relationFieldName: 'shippingAddress',
      field: SalesOrderDTO.t.shippingAddressId,
      foreignField: _i3.ContactDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.ContactDTOTable(tableRelation: foreignTableRelation),
    );
    return _shippingAddress!;
  }

  _i4.LightUserDTOTable get assignedUser {
    if (_assignedUser != null) return _assignedUser!;
    _assignedUser = _i1.createRelationTable(
      relationFieldName: 'assignedUser',
      field: SalesOrderDTO.t.assignedUserId,
      foreignField: _i4.LightUserDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.LightUserDTOTable(tableRelation: foreignTableRelation),
    );
    return _assignedUser!;
  }

  _i5.CustomerCustomerDTOTable get customerCustomer {
    if (_customerCustomer != null) return _customerCustomer!;
    _customerCustomer = _i1.createRelationTable(
      relationFieldName: 'customerCustomer',
      field: SalesOrderDTO.t.customerCustomerId,
      foreignField: _i5.CustomerCustomerDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.CustomerCustomerDTOTable(tableRelation: foreignTableRelation),
    );
    return _customerCustomer!;
  }

  _i3.ContactDTOTable get customerCustomerContactPerson {
    if (_customerCustomerContactPerson != null)
      return _customerCustomerContactPerson!;
    _customerCustomerContactPerson = _i1.createRelationTable(
      relationFieldName: 'customerCustomerContactPerson',
      field: SalesOrderDTO.t.customerCustomerContactPersonId,
      foreignField: _i3.ContactDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.ContactDTOTable(tableRelation: foreignTableRelation),
    );
    return _customerCustomerContactPerson!;
  }

  _i6.DrucklayoutSalesOrderJTTable get __drucklayouts {
    if (___drucklayouts != null) return ___drucklayouts!;
    ___drucklayouts = _i1.createRelationTable(
      relationFieldName: '__drucklayouts',
      field: SalesOrderDTO.t.id,
      foreignField: _i6.DrucklayoutSalesOrderJT.t.salesOrderId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i6.DrucklayoutSalesOrderJTTable(tableRelation: foreignTableRelation),
    );
    return ___drucklayouts!;
  }

  _i2.CustomerDTOTable get customer {
    if (_customer != null) return _customer!;
    _customer = _i1.createRelationTable(
      relationFieldName: 'customer',
      field: SalesOrderDTO.t.customerId,
      foreignField: _i2.CustomerDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.CustomerDTOTable(tableRelation: foreignTableRelation),
    );
    return _customer!;
  }

  _i3.ContactDTOTable get customerContactPerson {
    if (_customerContactPerson != null) return _customerContactPerson!;
    _customerContactPerson = _i1.createRelationTable(
      relationFieldName: 'customerContactPerson',
      field: SalesOrderDTO.t.customerContactPersonId,
      foreignField: _i3.ContactDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.ContactDTOTable(tableRelation: foreignTableRelation),
    );
    return _customerContactPerson!;
  }

  _i1.ManyRelation<_i6.DrucklayoutSalesOrderJTTable> get drucklayouts {
    if (_drucklayouts != null) return _drucklayouts!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'drucklayouts',
      field: SalesOrderDTO.t.id,
      foreignField: _i6.DrucklayoutSalesOrderJT.t.salesOrderId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i6.DrucklayoutSalesOrderJTTable(tableRelation: foreignTableRelation),
    );
    _drucklayouts = _i1.ManyRelation<_i6.DrucklayoutSalesOrderJTTable>(
      tableWithRelations: relationTable,
      table: _i6.DrucklayoutSalesOrderJTTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _drucklayouts!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        description,
        orderDate,
        customId,
        customIdString,
        keywords,
        orderNumber,
        status,
        billingAddressId,
        shippingAddressId,
        assignedUserId,
        customerCustomerId,
        customerCustomerContactPersonId,
        customerId,
        customerContactPersonId,
        customerFirstReference,
        customerSecondReference,
        customerCustomerReference,
        createdAt,
        createdById,
        lastModifiedAt,
        lastModifiedById,
        deletedAt,
        deletedById,
        editingById,
        editingSince,
        isDraft,
        editingSession,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'billingAddress') {
      return billingAddress;
    }
    if (relationField == 'shippingAddress') {
      return shippingAddress;
    }
    if (relationField == 'assignedUser') {
      return assignedUser;
    }
    if (relationField == 'customerCustomer') {
      return customerCustomer;
    }
    if (relationField == 'customerCustomerContactPerson') {
      return customerCustomerContactPerson;
    }
    if (relationField == 'drucklayouts') {
      return __drucklayouts;
    }
    if (relationField == 'customer') {
      return customer;
    }
    if (relationField == 'customerContactPerson') {
      return customerContactPerson;
    }
    return null;
  }
}

class SalesOrderDTOInclude extends _i1.IncludeObject {
  SalesOrderDTOInclude._({
    _i2.CustomerDTOInclude? billingAddress,
    _i3.ContactDTOInclude? shippingAddress,
    _i4.LightUserDTOInclude? assignedUser,
    _i5.CustomerCustomerDTOInclude? customerCustomer,
    _i3.ContactDTOInclude? customerCustomerContactPerson,
    _i6.DrucklayoutSalesOrderJTIncludeList? drucklayouts,
    _i2.CustomerDTOInclude? customer,
    _i3.ContactDTOInclude? customerContactPerson,
  }) {
    _billingAddress = billingAddress;
    _shippingAddress = shippingAddress;
    _assignedUser = assignedUser;
    _customerCustomer = customerCustomer;
    _customerCustomerContactPerson = customerCustomerContactPerson;
    _drucklayouts = drucklayouts;
    _customer = customer;
    _customerContactPerson = customerContactPerson;
  }

  _i2.CustomerDTOInclude? _billingAddress;

  _i3.ContactDTOInclude? _shippingAddress;

  _i4.LightUserDTOInclude? _assignedUser;

  _i5.CustomerCustomerDTOInclude? _customerCustomer;

  _i3.ContactDTOInclude? _customerCustomerContactPerson;

  _i6.DrucklayoutSalesOrderJTIncludeList? _drucklayouts;

  _i2.CustomerDTOInclude? _customer;

  _i3.ContactDTOInclude? _customerContactPerson;

  @override
  Map<String, _i1.Include?> get includes => {
        'billingAddress': _billingAddress,
        'shippingAddress': _shippingAddress,
        'assignedUser': _assignedUser,
        'customerCustomer': _customerCustomer,
        'customerCustomerContactPerson': _customerCustomerContactPerson,
        'drucklayouts': _drucklayouts,
        'customer': _customer,
        'customerContactPerson': _customerContactPerson,
      };

  @override
  _i1.Table<int?> get table => SalesOrderDTO.t;
}

class SalesOrderDTOIncludeList extends _i1.IncludeList {
  SalesOrderDTOIncludeList._({
    _i1.WhereExpressionBuilder<SalesOrderDTOTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(SalesOrderDTO.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => SalesOrderDTO.t;
}

class SalesOrderDTORepository {
  const SalesOrderDTORepository._();

  final attach = const SalesOrderDTOAttachRepository._();

  final attachRow = const SalesOrderDTOAttachRowRepository._();

  final detachRow = const SalesOrderDTODetachRowRepository._();

  /// Returns a list of [SalesOrderDTO]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<SalesOrderDTO>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SalesOrderDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SalesOrderDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SalesOrderDTOTable>? orderByList,
    _i1.Transaction? transaction,
    SalesOrderDTOInclude? include,
  }) async {
    return session.db.find<SalesOrderDTO>(
      where: where?.call(SalesOrderDTO.t),
      orderBy: orderBy?.call(SalesOrderDTO.t),
      orderByList: orderByList?.call(SalesOrderDTO.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [SalesOrderDTO] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<SalesOrderDTO?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SalesOrderDTOTable>? where,
    int? offset,
    _i1.OrderByBuilder<SalesOrderDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SalesOrderDTOTable>? orderByList,
    _i1.Transaction? transaction,
    SalesOrderDTOInclude? include,
  }) async {
    return session.db.findFirstRow<SalesOrderDTO>(
      where: where?.call(SalesOrderDTO.t),
      orderBy: orderBy?.call(SalesOrderDTO.t),
      orderByList: orderByList?.call(SalesOrderDTO.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [SalesOrderDTO] by its [id] or null if no such row exists.
  Future<SalesOrderDTO?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    SalesOrderDTOInclude? include,
  }) async {
    return session.db.findById<SalesOrderDTO>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [SalesOrderDTO]s in the list and returns the inserted rows.
  ///
  /// The returned [SalesOrderDTO]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<SalesOrderDTO>> insert(
    _i1.Session session,
    List<SalesOrderDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<SalesOrderDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [SalesOrderDTO] and returns the inserted row.
  ///
  /// The returned [SalesOrderDTO] will have its `id` field set.
  Future<SalesOrderDTO> insertRow(
    _i1.Session session,
    SalesOrderDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<SalesOrderDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [SalesOrderDTO]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<SalesOrderDTO>> update(
    _i1.Session session,
    List<SalesOrderDTO> rows, {
    _i1.ColumnSelections<SalesOrderDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<SalesOrderDTO>(
      rows,
      columns: columns?.call(SalesOrderDTO.t),
      transaction: transaction,
    );
  }

  /// Updates a single [SalesOrderDTO]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<SalesOrderDTO> updateRow(
    _i1.Session session,
    SalesOrderDTO row, {
    _i1.ColumnSelections<SalesOrderDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<SalesOrderDTO>(
      row,
      columns: columns?.call(SalesOrderDTO.t),
      transaction: transaction,
    );
  }

  /// Deletes all [SalesOrderDTO]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<SalesOrderDTO>> delete(
    _i1.Session session,
    List<SalesOrderDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<SalesOrderDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [SalesOrderDTO].
  Future<SalesOrderDTO> deleteRow(
    _i1.Session session,
    SalesOrderDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<SalesOrderDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<SalesOrderDTO>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<SalesOrderDTOTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<SalesOrderDTO>(
      where: where(SalesOrderDTO.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SalesOrderDTOTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<SalesOrderDTO>(
      where: where?.call(SalesOrderDTO.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class SalesOrderDTOAttachRepository {
  const SalesOrderDTOAttachRepository._();

  /// Creates a relation between this [SalesOrderDTO] and the given [DrucklayoutSalesOrderJT]s
  /// by setting each [DrucklayoutSalesOrderJT]'s foreign key `salesOrderId` to refer to this [SalesOrderDTO].
  Future<void> drucklayouts(
    _i1.Session session,
    SalesOrderDTO salesOrderDTO,
    List<_i6.DrucklayoutSalesOrderJT> drucklayoutSalesOrderJT, {
    _i1.Transaction? transaction,
  }) async {
    if (drucklayoutSalesOrderJT.any((e) => e.id == null)) {
      throw ArgumentError.notNull('drucklayoutSalesOrderJT.id');
    }
    if (salesOrderDTO.id == null) {
      throw ArgumentError.notNull('salesOrderDTO.id');
    }

    var $drucklayoutSalesOrderJT = drucklayoutSalesOrderJT
        .map((e) => e.copyWith(salesOrderId: salesOrderDTO.id))
        .toList();
    await session.db.update<_i6.DrucklayoutSalesOrderJT>(
      $drucklayoutSalesOrderJT,
      columns: [_i6.DrucklayoutSalesOrderJT.t.salesOrderId],
      transaction: transaction,
    );
  }
}

class SalesOrderDTOAttachRowRepository {
  const SalesOrderDTOAttachRowRepository._();

  /// Creates a relation between the given [SalesOrderDTO] and [CustomerDTO]
  /// by setting the [SalesOrderDTO]'s foreign key `billingAddressId` to refer to the [CustomerDTO].
  Future<void> billingAddress(
    _i1.Session session,
    SalesOrderDTO salesOrderDTO,
    _i2.CustomerDTO billingAddress, {
    _i1.Transaction? transaction,
  }) async {
    if (salesOrderDTO.id == null) {
      throw ArgumentError.notNull('salesOrderDTO.id');
    }
    if (billingAddress.id == null) {
      throw ArgumentError.notNull('billingAddress.id');
    }

    var $salesOrderDTO =
        salesOrderDTO.copyWith(billingAddressId: billingAddress.id);
    await session.db.updateRow<SalesOrderDTO>(
      $salesOrderDTO,
      columns: [SalesOrderDTO.t.billingAddressId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [SalesOrderDTO] and [ContactDTO]
  /// by setting the [SalesOrderDTO]'s foreign key `shippingAddressId` to refer to the [ContactDTO].
  Future<void> shippingAddress(
    _i1.Session session,
    SalesOrderDTO salesOrderDTO,
    _i3.ContactDTO shippingAddress, {
    _i1.Transaction? transaction,
  }) async {
    if (salesOrderDTO.id == null) {
      throw ArgumentError.notNull('salesOrderDTO.id');
    }
    if (shippingAddress.id == null) {
      throw ArgumentError.notNull('shippingAddress.id');
    }

    var $salesOrderDTO =
        salesOrderDTO.copyWith(shippingAddressId: shippingAddress.id);
    await session.db.updateRow<SalesOrderDTO>(
      $salesOrderDTO,
      columns: [SalesOrderDTO.t.shippingAddressId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [SalesOrderDTO] and [LightUserDTO]
  /// by setting the [SalesOrderDTO]'s foreign key `assignedUserId` to refer to the [LightUserDTO].
  Future<void> assignedUser(
    _i1.Session session,
    SalesOrderDTO salesOrderDTO,
    _i4.LightUserDTO assignedUser, {
    _i1.Transaction? transaction,
  }) async {
    if (salesOrderDTO.id == null) {
      throw ArgumentError.notNull('salesOrderDTO.id');
    }
    if (assignedUser.id == null) {
      throw ArgumentError.notNull('assignedUser.id');
    }

    var $salesOrderDTO =
        salesOrderDTO.copyWith(assignedUserId: assignedUser.id);
    await session.db.updateRow<SalesOrderDTO>(
      $salesOrderDTO,
      columns: [SalesOrderDTO.t.assignedUserId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [SalesOrderDTO] and [CustomerCustomerDTO]
  /// by setting the [SalesOrderDTO]'s foreign key `customerCustomerId` to refer to the [CustomerCustomerDTO].
  Future<void> customerCustomer(
    _i1.Session session,
    SalesOrderDTO salesOrderDTO,
    _i5.CustomerCustomerDTO customerCustomer, {
    _i1.Transaction? transaction,
  }) async {
    if (salesOrderDTO.id == null) {
      throw ArgumentError.notNull('salesOrderDTO.id');
    }
    if (customerCustomer.id == null) {
      throw ArgumentError.notNull('customerCustomer.id');
    }

    var $salesOrderDTO =
        salesOrderDTO.copyWith(customerCustomerId: customerCustomer.id);
    await session.db.updateRow<SalesOrderDTO>(
      $salesOrderDTO,
      columns: [SalesOrderDTO.t.customerCustomerId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [SalesOrderDTO] and [ContactDTO]
  /// by setting the [SalesOrderDTO]'s foreign key `customerCustomerContactPersonId` to refer to the [ContactDTO].
  Future<void> customerCustomerContactPerson(
    _i1.Session session,
    SalesOrderDTO salesOrderDTO,
    _i3.ContactDTO customerCustomerContactPerson, {
    _i1.Transaction? transaction,
  }) async {
    if (salesOrderDTO.id == null) {
      throw ArgumentError.notNull('salesOrderDTO.id');
    }
    if (customerCustomerContactPerson.id == null) {
      throw ArgumentError.notNull('customerCustomerContactPerson.id');
    }

    var $salesOrderDTO = salesOrderDTO.copyWith(
        customerCustomerContactPersonId: customerCustomerContactPerson.id);
    await session.db.updateRow<SalesOrderDTO>(
      $salesOrderDTO,
      columns: [SalesOrderDTO.t.customerCustomerContactPersonId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [SalesOrderDTO] and [CustomerDTO]
  /// by setting the [SalesOrderDTO]'s foreign key `customerId` to refer to the [CustomerDTO].
  Future<void> customer(
    _i1.Session session,
    SalesOrderDTO salesOrderDTO,
    _i2.CustomerDTO customer, {
    _i1.Transaction? transaction,
  }) async {
    if (salesOrderDTO.id == null) {
      throw ArgumentError.notNull('salesOrderDTO.id');
    }
    if (customer.id == null) {
      throw ArgumentError.notNull('customer.id');
    }

    var $salesOrderDTO = salesOrderDTO.copyWith(customerId: customer.id);
    await session.db.updateRow<SalesOrderDTO>(
      $salesOrderDTO,
      columns: [SalesOrderDTO.t.customerId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [SalesOrderDTO] and [ContactDTO]
  /// by setting the [SalesOrderDTO]'s foreign key `customerContactPersonId` to refer to the [ContactDTO].
  Future<void> customerContactPerson(
    _i1.Session session,
    SalesOrderDTO salesOrderDTO,
    _i3.ContactDTO customerContactPerson, {
    _i1.Transaction? transaction,
  }) async {
    if (salesOrderDTO.id == null) {
      throw ArgumentError.notNull('salesOrderDTO.id');
    }
    if (customerContactPerson.id == null) {
      throw ArgumentError.notNull('customerContactPerson.id');
    }

    var $salesOrderDTO = salesOrderDTO.copyWith(
        customerContactPersonId: customerContactPerson.id);
    await session.db.updateRow<SalesOrderDTO>(
      $salesOrderDTO,
      columns: [SalesOrderDTO.t.customerContactPersonId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [SalesOrderDTO] and the given [DrucklayoutSalesOrderJT]
  /// by setting the [DrucklayoutSalesOrderJT]'s foreign key `salesOrderId` to refer to this [SalesOrderDTO].
  Future<void> drucklayouts(
    _i1.Session session,
    SalesOrderDTO salesOrderDTO,
    _i6.DrucklayoutSalesOrderJT drucklayoutSalesOrderJT, {
    _i1.Transaction? transaction,
  }) async {
    if (drucklayoutSalesOrderJT.id == null) {
      throw ArgumentError.notNull('drucklayoutSalesOrderJT.id');
    }
    if (salesOrderDTO.id == null) {
      throw ArgumentError.notNull('salesOrderDTO.id');
    }

    var $drucklayoutSalesOrderJT =
        drucklayoutSalesOrderJT.copyWith(salesOrderId: salesOrderDTO.id);
    await session.db.updateRow<_i6.DrucklayoutSalesOrderJT>(
      $drucklayoutSalesOrderJT,
      columns: [_i6.DrucklayoutSalesOrderJT.t.salesOrderId],
      transaction: transaction,
    );
  }
}

class SalesOrderDTODetachRowRepository {
  const SalesOrderDTODetachRowRepository._();

  /// Detaches the relation between this [SalesOrderDTO] and the [CustomerDTO] set in `billingAddress`
  /// by setting the [SalesOrderDTO]'s foreign key `billingAddressId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> billingAddress(
    _i1.Session session,
    SalesOrderDTO salesorderdto, {
    _i1.Transaction? transaction,
  }) async {
    if (salesorderdto.id == null) {
      throw ArgumentError.notNull('salesorderdto.id');
    }

    var $salesorderdto = salesorderdto.copyWith(billingAddressId: null);
    await session.db.updateRow<SalesOrderDTO>(
      $salesorderdto,
      columns: [SalesOrderDTO.t.billingAddressId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [SalesOrderDTO] and the [ContactDTO] set in `shippingAddress`
  /// by setting the [SalesOrderDTO]'s foreign key `shippingAddressId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> shippingAddress(
    _i1.Session session,
    SalesOrderDTO salesorderdto, {
    _i1.Transaction? transaction,
  }) async {
    if (salesorderdto.id == null) {
      throw ArgumentError.notNull('salesorderdto.id');
    }

    var $salesorderdto = salesorderdto.copyWith(shippingAddressId: null);
    await session.db.updateRow<SalesOrderDTO>(
      $salesorderdto,
      columns: [SalesOrderDTO.t.shippingAddressId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [SalesOrderDTO] and the [LightUserDTO] set in `assignedUser`
  /// by setting the [SalesOrderDTO]'s foreign key `assignedUserId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> assignedUser(
    _i1.Session session,
    SalesOrderDTO salesorderdto, {
    _i1.Transaction? transaction,
  }) async {
    if (salesorderdto.id == null) {
      throw ArgumentError.notNull('salesorderdto.id');
    }

    var $salesorderdto = salesorderdto.copyWith(assignedUserId: null);
    await session.db.updateRow<SalesOrderDTO>(
      $salesorderdto,
      columns: [SalesOrderDTO.t.assignedUserId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [SalesOrderDTO] and the [CustomerCustomerDTO] set in `customerCustomer`
  /// by setting the [SalesOrderDTO]'s foreign key `customerCustomerId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> customerCustomer(
    _i1.Session session,
    SalesOrderDTO salesorderdto, {
    _i1.Transaction? transaction,
  }) async {
    if (salesorderdto.id == null) {
      throw ArgumentError.notNull('salesorderdto.id');
    }

    var $salesorderdto = salesorderdto.copyWith(customerCustomerId: null);
    await session.db.updateRow<SalesOrderDTO>(
      $salesorderdto,
      columns: [SalesOrderDTO.t.customerCustomerId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [SalesOrderDTO] and the [ContactDTO] set in `customerCustomerContactPerson`
  /// by setting the [SalesOrderDTO]'s foreign key `customerCustomerContactPersonId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> customerCustomerContactPerson(
    _i1.Session session,
    SalesOrderDTO salesorderdto, {
    _i1.Transaction? transaction,
  }) async {
    if (salesorderdto.id == null) {
      throw ArgumentError.notNull('salesorderdto.id');
    }

    var $salesorderdto =
        salesorderdto.copyWith(customerCustomerContactPersonId: null);
    await session.db.updateRow<SalesOrderDTO>(
      $salesorderdto,
      columns: [SalesOrderDTO.t.customerCustomerContactPersonId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [SalesOrderDTO] and the [ContactDTO] set in `customerContactPerson`
  /// by setting the [SalesOrderDTO]'s foreign key `customerContactPersonId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> customerContactPerson(
    _i1.Session session,
    SalesOrderDTO salesorderdto, {
    _i1.Transaction? transaction,
  }) async {
    if (salesorderdto.id == null) {
      throw ArgumentError.notNull('salesorderdto.id');
    }

    var $salesorderdto = salesorderdto.copyWith(customerContactPersonId: null);
    await session.db.updateRow<SalesOrderDTO>(
      $salesorderdto,
      columns: [SalesOrderDTO.t.customerContactPersonId],
      transaction: transaction,
    );
  }
}
