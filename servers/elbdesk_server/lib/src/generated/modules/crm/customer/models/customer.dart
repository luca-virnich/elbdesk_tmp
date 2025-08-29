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
import '../../../../modules/crm/payment_code/models/payment_code.dart' as _i2;
import '../../../../modules/crm/customer/models/customer_sales_order_hints.dart'
    as _i3;
import '../../../../modules/crm/customer/models/shipping_method.dart' as _i4;
import '../../../../modules/crm/app_client/models/app_client.dart' as _i5;
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart'
    as _i6;
import '../../../../modules/crm/contact/models/contact.dart' as _i7;
import '../../../../modules/unsorted/ftp_interface/ftp_interface.dart' as _i8;
import '../../../../modules/unsorted/junction_tables/customer_bearer.dart'
    as _i9;
import '../../../../modules/prepress/color_palette/models/prepress_color_palette.dart'
    as _i10;

abstract class CustomerDTO
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  CustomerDTO._({
    this.id,
    this.registerNumber,
    this.paymentCodeId,
    this.paymentCode,
    required this.vatId,
    required this.customId,
    this.customIdString,
    this.salesOrderHints,
    required this.invoiceEmail,
    this.invoiceDeliveryMethod,
    this.shippingMethodId,
    this.shippingMethod,
    this.contractSovereigntyId,
    this.contractSovereignty,
    this.assignedUserId,
    this.assignedUser,
    this.contactId,
    this.contact,
    this.ftpInterfaces,
    this.bearers,
    this.prepressColorPalettes,
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

  factory CustomerDTO({
    int? id,
    String? registerNumber,
    int? paymentCodeId,
    _i2.PaymentCodeDTO? paymentCode,
    required String vatId,
    required int customId,
    String? customIdString,
    _i3.CustomerSalesOrderHintsDTO? salesOrderHints,
    required String invoiceEmail,
    String? invoiceDeliveryMethod,
    int? shippingMethodId,
    _i4.ShippingMethodDTO? shippingMethod,
    int? contractSovereigntyId,
    _i5.AppClientDTO? contractSovereignty,
    int? assignedUserId,
    _i6.LightUserDTO? assignedUser,
    int? contactId,
    _i7.ContactDTO? contact,
    List<_i8.FTPInterfaceDTO>? ftpInterfaces,
    List<_i9.BearerCustomerRelation>? bearers,
    List<_i10.PrepressColorPaletteDTO>? prepressColorPalettes,
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
  }) = _CustomerDTOImpl;

  factory CustomerDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return CustomerDTO(
      id: jsonSerialization['id'] as int?,
      registerNumber: jsonSerialization['registerNumber'] as String?,
      paymentCodeId: jsonSerialization['paymentCodeId'] as int?,
      paymentCode: jsonSerialization['paymentCode'] == null
          ? null
          : _i2.PaymentCodeDTO.fromJson(
              (jsonSerialization['paymentCode'] as Map<String, dynamic>)),
      vatId: jsonSerialization['vatId'] as String,
      customId: jsonSerialization['customId'] as int,
      customIdString: jsonSerialization['customIdString'] as String?,
      salesOrderHints: jsonSerialization['salesOrderHints'] == null
          ? null
          : _i3.CustomerSalesOrderHintsDTO.fromJson(
              (jsonSerialization['salesOrderHints'] as Map<String, dynamic>)),
      invoiceEmail: jsonSerialization['invoiceEmail'] as String,
      invoiceDeliveryMethod:
          jsonSerialization['invoiceDeliveryMethod'] as String?,
      shippingMethodId: jsonSerialization['shippingMethodId'] as int?,
      shippingMethod: jsonSerialization['shippingMethod'] == null
          ? null
          : _i4.ShippingMethodDTO.fromJson(
              (jsonSerialization['shippingMethod'] as Map<String, dynamic>)),
      contractSovereigntyId: jsonSerialization['contractSovereigntyId'] as int?,
      contractSovereignty: jsonSerialization['contractSovereignty'] == null
          ? null
          : _i5.AppClientDTO.fromJson((jsonSerialization['contractSovereignty']
              as Map<String, dynamic>)),
      assignedUserId: jsonSerialization['assignedUserId'] as int?,
      assignedUser: jsonSerialization['assignedUser'] == null
          ? null
          : _i6.LightUserDTO.fromJson(
              (jsonSerialization['assignedUser'] as Map<String, dynamic>)),
      contactId: jsonSerialization['contactId'] as int?,
      contact: jsonSerialization['contact'] == null
          ? null
          : _i7.ContactDTO.fromJson(
              (jsonSerialization['contact'] as Map<String, dynamic>)),
      ftpInterfaces: (jsonSerialization['ftpInterfaces'] as List?)
          ?.map(
              (e) => _i8.FTPInterfaceDTO.fromJson((e as Map<String, dynamic>)))
          .toList(),
      bearers: (jsonSerialization['bearers'] as List?)
          ?.map((e) =>
              _i9.BearerCustomerRelation.fromJson((e as Map<String, dynamic>)))
          .toList(),
      prepressColorPalettes:
          (jsonSerialization['prepressColorPalettes'] as List?)
              ?.map((e) => _i10.PrepressColorPaletteDTO.fromJson(
                  (e as Map<String, dynamic>)))
              .toList(),
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

  static final t = CustomerDTOTable();

  static const db = CustomerDTORepository._();

  @override
  int? id;

  String? registerNumber;

  int? paymentCodeId;

  _i2.PaymentCodeDTO? paymentCode;

  String vatId;

  int customId;

  String? customIdString;

  _i3.CustomerSalesOrderHintsDTO? salesOrderHints;

  String invoiceEmail;

  String? invoiceDeliveryMethod;

  int? shippingMethodId;

  _i4.ShippingMethodDTO? shippingMethod;

  int? contractSovereigntyId;

  _i5.AppClientDTO? contractSovereignty;

  int? assignedUserId;

  _i6.LightUserDTO? assignedUser;

  int? contactId;

  _i7.ContactDTO? contact;

  List<_i8.FTPInterfaceDTO>? ftpInterfaces;

  List<_i9.BearerCustomerRelation>? bearers;

  List<_i10.PrepressColorPaletteDTO>? prepressColorPalettes;

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

  /// Returns a shallow copy of this [CustomerDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CustomerDTO copyWith({
    int? id,
    String? registerNumber,
    int? paymentCodeId,
    _i2.PaymentCodeDTO? paymentCode,
    String? vatId,
    int? customId,
    String? customIdString,
    _i3.CustomerSalesOrderHintsDTO? salesOrderHints,
    String? invoiceEmail,
    String? invoiceDeliveryMethod,
    int? shippingMethodId,
    _i4.ShippingMethodDTO? shippingMethod,
    int? contractSovereigntyId,
    _i5.AppClientDTO? contractSovereignty,
    int? assignedUserId,
    _i6.LightUserDTO? assignedUser,
    int? contactId,
    _i7.ContactDTO? contact,
    List<_i8.FTPInterfaceDTO>? ftpInterfaces,
    List<_i9.BearerCustomerRelation>? bearers,
    List<_i10.PrepressColorPaletteDTO>? prepressColorPalettes,
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
      if (registerNumber != null) 'registerNumber': registerNumber,
      if (paymentCodeId != null) 'paymentCodeId': paymentCodeId,
      if (paymentCode != null) 'paymentCode': paymentCode?.toJson(),
      'vatId': vatId,
      'customId': customId,
      if (customIdString != null) 'customIdString': customIdString,
      if (salesOrderHints != null) 'salesOrderHints': salesOrderHints?.toJson(),
      'invoiceEmail': invoiceEmail,
      if (invoiceDeliveryMethod != null)
        'invoiceDeliveryMethod': invoiceDeliveryMethod,
      if (shippingMethodId != null) 'shippingMethodId': shippingMethodId,
      if (shippingMethod != null) 'shippingMethod': shippingMethod?.toJson(),
      if (contractSovereigntyId != null)
        'contractSovereigntyId': contractSovereigntyId,
      if (contractSovereignty != null)
        'contractSovereignty': contractSovereignty?.toJson(),
      if (assignedUserId != null) 'assignedUserId': assignedUserId,
      if (assignedUser != null) 'assignedUser': assignedUser?.toJson(),
      if (contactId != null) 'contactId': contactId,
      if (contact != null) 'contact': contact?.toJson(),
      if (ftpInterfaces != null)
        'ftpInterfaces': ftpInterfaces?.toJson(valueToJson: (v) => v.toJson()),
      if (bearers != null)
        'bearers': bearers?.toJson(valueToJson: (v) => v.toJson()),
      if (prepressColorPalettes != null)
        'prepressColorPalettes':
            prepressColorPalettes?.toJson(valueToJson: (v) => v.toJson()),
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
      if (registerNumber != null) 'registerNumber': registerNumber,
      if (paymentCodeId != null) 'paymentCodeId': paymentCodeId,
      if (paymentCode != null) 'paymentCode': paymentCode?.toJsonForProtocol(),
      'vatId': vatId,
      'customId': customId,
      if (customIdString != null) 'customIdString': customIdString,
      if (salesOrderHints != null)
        'salesOrderHints': salesOrderHints?.toJsonForProtocol(),
      'invoiceEmail': invoiceEmail,
      if (invoiceDeliveryMethod != null)
        'invoiceDeliveryMethod': invoiceDeliveryMethod,
      if (shippingMethodId != null) 'shippingMethodId': shippingMethodId,
      if (shippingMethod != null)
        'shippingMethod': shippingMethod?.toJsonForProtocol(),
      if (contractSovereigntyId != null)
        'contractSovereigntyId': contractSovereigntyId,
      if (contractSovereignty != null)
        'contractSovereignty': contractSovereignty?.toJsonForProtocol(),
      if (assignedUserId != null) 'assignedUserId': assignedUserId,
      if (assignedUser != null)
        'assignedUser': assignedUser?.toJsonForProtocol(),
      if (contactId != null) 'contactId': contactId,
      if (contact != null) 'contact': contact?.toJsonForProtocol(),
      if (ftpInterfaces != null)
        'ftpInterfaces':
            ftpInterfaces?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (bearers != null)
        'bearers': bearers?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (prepressColorPalettes != null)
        'prepressColorPalettes': prepressColorPalettes?.toJson(
            valueToJson: (v) => v.toJsonForProtocol()),
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

  static CustomerDTOInclude include({
    _i2.PaymentCodeDTOInclude? paymentCode,
    _i4.ShippingMethodDTOInclude? shippingMethod,
    _i5.AppClientDTOInclude? contractSovereignty,
    _i6.LightUserDTOInclude? assignedUser,
    _i7.ContactDTOInclude? contact,
    _i8.FTPInterfaceDTOIncludeList? ftpInterfaces,
    _i9.BearerCustomerRelationIncludeList? bearers,
    _i10.PrepressColorPaletteDTOIncludeList? prepressColorPalettes,
  }) {
    return CustomerDTOInclude._(
      paymentCode: paymentCode,
      shippingMethod: shippingMethod,
      contractSovereignty: contractSovereignty,
      assignedUser: assignedUser,
      contact: contact,
      ftpInterfaces: ftpInterfaces,
      bearers: bearers,
      prepressColorPalettes: prepressColorPalettes,
    );
  }

  static CustomerDTOIncludeList includeList({
    _i1.WhereExpressionBuilder<CustomerDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CustomerDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CustomerDTOTable>? orderByList,
    CustomerDTOInclude? include,
  }) {
    return CustomerDTOIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CustomerDTO.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(CustomerDTO.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CustomerDTOImpl extends CustomerDTO {
  _CustomerDTOImpl({
    int? id,
    String? registerNumber,
    int? paymentCodeId,
    _i2.PaymentCodeDTO? paymentCode,
    required String vatId,
    required int customId,
    String? customIdString,
    _i3.CustomerSalesOrderHintsDTO? salesOrderHints,
    required String invoiceEmail,
    String? invoiceDeliveryMethod,
    int? shippingMethodId,
    _i4.ShippingMethodDTO? shippingMethod,
    int? contractSovereigntyId,
    _i5.AppClientDTO? contractSovereignty,
    int? assignedUserId,
    _i6.LightUserDTO? assignedUser,
    int? contactId,
    _i7.ContactDTO? contact,
    List<_i8.FTPInterfaceDTO>? ftpInterfaces,
    List<_i9.BearerCustomerRelation>? bearers,
    List<_i10.PrepressColorPaletteDTO>? prepressColorPalettes,
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
          registerNumber: registerNumber,
          paymentCodeId: paymentCodeId,
          paymentCode: paymentCode,
          vatId: vatId,
          customId: customId,
          customIdString: customIdString,
          salesOrderHints: salesOrderHints,
          invoiceEmail: invoiceEmail,
          invoiceDeliveryMethod: invoiceDeliveryMethod,
          shippingMethodId: shippingMethodId,
          shippingMethod: shippingMethod,
          contractSovereigntyId: contractSovereigntyId,
          contractSovereignty: contractSovereignty,
          assignedUserId: assignedUserId,
          assignedUser: assignedUser,
          contactId: contactId,
          contact: contact,
          ftpInterfaces: ftpInterfaces,
          bearers: bearers,
          prepressColorPalettes: prepressColorPalettes,
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

  /// Returns a shallow copy of this [CustomerDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CustomerDTO copyWith({
    Object? id = _Undefined,
    Object? registerNumber = _Undefined,
    Object? paymentCodeId = _Undefined,
    Object? paymentCode = _Undefined,
    String? vatId,
    int? customId,
    Object? customIdString = _Undefined,
    Object? salesOrderHints = _Undefined,
    String? invoiceEmail,
    Object? invoiceDeliveryMethod = _Undefined,
    Object? shippingMethodId = _Undefined,
    Object? shippingMethod = _Undefined,
    Object? contractSovereigntyId = _Undefined,
    Object? contractSovereignty = _Undefined,
    Object? assignedUserId = _Undefined,
    Object? assignedUser = _Undefined,
    Object? contactId = _Undefined,
    Object? contact = _Undefined,
    Object? ftpInterfaces = _Undefined,
    Object? bearers = _Undefined,
    Object? prepressColorPalettes = _Undefined,
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
    return CustomerDTO(
      id: id is int? ? id : this.id,
      registerNumber:
          registerNumber is String? ? registerNumber : this.registerNumber,
      paymentCodeId: paymentCodeId is int? ? paymentCodeId : this.paymentCodeId,
      paymentCode: paymentCode is _i2.PaymentCodeDTO?
          ? paymentCode
          : this.paymentCode?.copyWith(),
      vatId: vatId ?? this.vatId,
      customId: customId ?? this.customId,
      customIdString:
          customIdString is String? ? customIdString : this.customIdString,
      salesOrderHints: salesOrderHints is _i3.CustomerSalesOrderHintsDTO?
          ? salesOrderHints
          : this.salesOrderHints?.copyWith(),
      invoiceEmail: invoiceEmail ?? this.invoiceEmail,
      invoiceDeliveryMethod: invoiceDeliveryMethod is String?
          ? invoiceDeliveryMethod
          : this.invoiceDeliveryMethod,
      shippingMethodId:
          shippingMethodId is int? ? shippingMethodId : this.shippingMethodId,
      shippingMethod: shippingMethod is _i4.ShippingMethodDTO?
          ? shippingMethod
          : this.shippingMethod?.copyWith(),
      contractSovereigntyId: contractSovereigntyId is int?
          ? contractSovereigntyId
          : this.contractSovereigntyId,
      contractSovereignty: contractSovereignty is _i5.AppClientDTO?
          ? contractSovereignty
          : this.contractSovereignty?.copyWith(),
      assignedUserId:
          assignedUserId is int? ? assignedUserId : this.assignedUserId,
      assignedUser: assignedUser is _i6.LightUserDTO?
          ? assignedUser
          : this.assignedUser?.copyWith(),
      contactId: contactId is int? ? contactId : this.contactId,
      contact: contact is _i7.ContactDTO? ? contact : this.contact?.copyWith(),
      ftpInterfaces: ftpInterfaces is List<_i8.FTPInterfaceDTO>?
          ? ftpInterfaces
          : this.ftpInterfaces?.map((e0) => e0.copyWith()).toList(),
      bearers: bearers is List<_i9.BearerCustomerRelation>?
          ? bearers
          : this.bearers?.map((e0) => e0.copyWith()).toList(),
      prepressColorPalettes:
          prepressColorPalettes is List<_i10.PrepressColorPaletteDTO>?
              ? prepressColorPalettes
              : this.prepressColorPalettes?.map((e0) => e0.copyWith()).toList(),
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

class CustomerDTOTable extends _i1.Table<int?> {
  CustomerDTOTable({super.tableRelation})
      : super(tableName: 'ed_crm_customer') {
    registerNumber = _i1.ColumnString(
      'registerNumber',
      this,
    );
    paymentCodeId = _i1.ColumnInt(
      'paymentCodeId',
      this,
    );
    vatId = _i1.ColumnString(
      'vatId',
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
    salesOrderHints = _i1.ColumnSerializable(
      'salesOrderHints',
      this,
    );
    invoiceEmail = _i1.ColumnString(
      'invoiceEmail',
      this,
    );
    invoiceDeliveryMethod = _i1.ColumnString(
      'invoiceDeliveryMethod',
      this,
    );
    shippingMethodId = _i1.ColumnInt(
      'shippingMethodId',
      this,
    );
    contractSovereigntyId = _i1.ColumnInt(
      'contractSovereigntyId',
      this,
    );
    assignedUserId = _i1.ColumnInt(
      'assignedUserId',
      this,
    );
    contactId = _i1.ColumnInt(
      'contactId',
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

  late final _i1.ColumnString registerNumber;

  late final _i1.ColumnInt paymentCodeId;

  _i2.PaymentCodeDTOTable? _paymentCode;

  late final _i1.ColumnString vatId;

  late final _i1.ColumnInt customId;

  late final _i1.ColumnString customIdString;

  late final _i1.ColumnSerializable salesOrderHints;

  late final _i1.ColumnString invoiceEmail;

  late final _i1.ColumnString invoiceDeliveryMethod;

  late final _i1.ColumnInt shippingMethodId;

  _i4.ShippingMethodDTOTable? _shippingMethod;

  late final _i1.ColumnInt contractSovereigntyId;

  _i5.AppClientDTOTable? _contractSovereignty;

  late final _i1.ColumnInt assignedUserId;

  _i6.LightUserDTOTable? _assignedUser;

  late final _i1.ColumnInt contactId;

  _i7.ContactDTOTable? _contact;

  _i8.FTPInterfaceDTOTable? ___ftpInterfaces;

  _i1.ManyRelation<_i8.FTPInterfaceDTOTable>? _ftpInterfaces;

  _i9.BearerCustomerRelationTable? ___bearers;

  _i1.ManyRelation<_i9.BearerCustomerRelationTable>? _bearers;

  _i10.PrepressColorPaletteDTOTable? ___prepressColorPalettes;

  _i1.ManyRelation<_i10.PrepressColorPaletteDTOTable>? _prepressColorPalettes;

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

  _i2.PaymentCodeDTOTable get paymentCode {
    if (_paymentCode != null) return _paymentCode!;
    _paymentCode = _i1.createRelationTable(
      relationFieldName: 'paymentCode',
      field: CustomerDTO.t.paymentCodeId,
      foreignField: _i2.PaymentCodeDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.PaymentCodeDTOTable(tableRelation: foreignTableRelation),
    );
    return _paymentCode!;
  }

  _i4.ShippingMethodDTOTable get shippingMethod {
    if (_shippingMethod != null) return _shippingMethod!;
    _shippingMethod = _i1.createRelationTable(
      relationFieldName: 'shippingMethod',
      field: CustomerDTO.t.shippingMethodId,
      foreignField: _i4.ShippingMethodDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.ShippingMethodDTOTable(tableRelation: foreignTableRelation),
    );
    return _shippingMethod!;
  }

  _i5.AppClientDTOTable get contractSovereignty {
    if (_contractSovereignty != null) return _contractSovereignty!;
    _contractSovereignty = _i1.createRelationTable(
      relationFieldName: 'contractSovereignty',
      field: CustomerDTO.t.contractSovereigntyId,
      foreignField: _i5.AppClientDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.AppClientDTOTable(tableRelation: foreignTableRelation),
    );
    return _contractSovereignty!;
  }

  _i6.LightUserDTOTable get assignedUser {
    if (_assignedUser != null) return _assignedUser!;
    _assignedUser = _i1.createRelationTable(
      relationFieldName: 'assignedUser',
      field: CustomerDTO.t.assignedUserId,
      foreignField: _i6.LightUserDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i6.LightUserDTOTable(tableRelation: foreignTableRelation),
    );
    return _assignedUser!;
  }

  _i7.ContactDTOTable get contact {
    if (_contact != null) return _contact!;
    _contact = _i1.createRelationTable(
      relationFieldName: 'contact',
      field: CustomerDTO.t.contactId,
      foreignField: _i7.ContactDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i7.ContactDTOTable(tableRelation: foreignTableRelation),
    );
    return _contact!;
  }

  _i8.FTPInterfaceDTOTable get __ftpInterfaces {
    if (___ftpInterfaces != null) return ___ftpInterfaces!;
    ___ftpInterfaces = _i1.createRelationTable(
      relationFieldName: '__ftpInterfaces',
      field: CustomerDTO.t.id,
      foreignField:
          _i8.FTPInterfaceDTO.t.$_edCrmCustomerFtpinterfacesEdCrmCustomerId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i8.FTPInterfaceDTOTable(tableRelation: foreignTableRelation),
    );
    return ___ftpInterfaces!;
  }

  _i9.BearerCustomerRelationTable get __bearers {
    if (___bearers != null) return ___bearers!;
    ___bearers = _i1.createRelationTable(
      relationFieldName: '__bearers',
      field: CustomerDTO.t.id,
      foreignField: _i9.BearerCustomerRelation.t.customerId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i9.BearerCustomerRelationTable(tableRelation: foreignTableRelation),
    );
    return ___bearers!;
  }

  _i10.PrepressColorPaletteDTOTable get __prepressColorPalettes {
    if (___prepressColorPalettes != null) return ___prepressColorPalettes!;
    ___prepressColorPalettes = _i1.createRelationTable(
      relationFieldName: '__prepressColorPalettes',
      field: CustomerDTO.t.id,
      foreignField: _i10.PrepressColorPaletteDTO.t.customerId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) => _i10.PrepressColorPaletteDTOTable(
          tableRelation: foreignTableRelation),
    );
    return ___prepressColorPalettes!;
  }

  _i1.ManyRelation<_i8.FTPInterfaceDTOTable> get ftpInterfaces {
    if (_ftpInterfaces != null) return _ftpInterfaces!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'ftpInterfaces',
      field: CustomerDTO.t.id,
      foreignField:
          _i8.FTPInterfaceDTO.t.$_edCrmCustomerFtpinterfacesEdCrmCustomerId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i8.FTPInterfaceDTOTable(tableRelation: foreignTableRelation),
    );
    _ftpInterfaces = _i1.ManyRelation<_i8.FTPInterfaceDTOTable>(
      tableWithRelations: relationTable,
      table: _i8.FTPInterfaceDTOTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _ftpInterfaces!;
  }

  _i1.ManyRelation<_i9.BearerCustomerRelationTable> get bearers {
    if (_bearers != null) return _bearers!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'bearers',
      field: CustomerDTO.t.id,
      foreignField: _i9.BearerCustomerRelation.t.customerId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i9.BearerCustomerRelationTable(tableRelation: foreignTableRelation),
    );
    _bearers = _i1.ManyRelation<_i9.BearerCustomerRelationTable>(
      tableWithRelations: relationTable,
      table: _i9.BearerCustomerRelationTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _bearers!;
  }

  _i1.ManyRelation<_i10.PrepressColorPaletteDTOTable>
      get prepressColorPalettes {
    if (_prepressColorPalettes != null) return _prepressColorPalettes!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'prepressColorPalettes',
      field: CustomerDTO.t.id,
      foreignField: _i10.PrepressColorPaletteDTO.t.customerId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) => _i10.PrepressColorPaletteDTOTable(
          tableRelation: foreignTableRelation),
    );
    _prepressColorPalettes =
        _i1.ManyRelation<_i10.PrepressColorPaletteDTOTable>(
      tableWithRelations: relationTable,
      table: _i10.PrepressColorPaletteDTOTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _prepressColorPalettes!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        registerNumber,
        paymentCodeId,
        vatId,
        customId,
        customIdString,
        salesOrderHints,
        invoiceEmail,
        invoiceDeliveryMethod,
        shippingMethodId,
        contractSovereigntyId,
        assignedUserId,
        contactId,
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
    if (relationField == 'paymentCode') {
      return paymentCode;
    }
    if (relationField == 'shippingMethod') {
      return shippingMethod;
    }
    if (relationField == 'contractSovereignty') {
      return contractSovereignty;
    }
    if (relationField == 'assignedUser') {
      return assignedUser;
    }
    if (relationField == 'contact') {
      return contact;
    }
    if (relationField == 'ftpInterfaces') {
      return __ftpInterfaces;
    }
    if (relationField == 'bearers') {
      return __bearers;
    }
    if (relationField == 'prepressColorPalettes') {
      return __prepressColorPalettes;
    }
    return null;
  }
}

class CustomerDTOInclude extends _i1.IncludeObject {
  CustomerDTOInclude._({
    _i2.PaymentCodeDTOInclude? paymentCode,
    _i4.ShippingMethodDTOInclude? shippingMethod,
    _i5.AppClientDTOInclude? contractSovereignty,
    _i6.LightUserDTOInclude? assignedUser,
    _i7.ContactDTOInclude? contact,
    _i8.FTPInterfaceDTOIncludeList? ftpInterfaces,
    _i9.BearerCustomerRelationIncludeList? bearers,
    _i10.PrepressColorPaletteDTOIncludeList? prepressColorPalettes,
  }) {
    _paymentCode = paymentCode;
    _shippingMethod = shippingMethod;
    _contractSovereignty = contractSovereignty;
    _assignedUser = assignedUser;
    _contact = contact;
    _ftpInterfaces = ftpInterfaces;
    _bearers = bearers;
    _prepressColorPalettes = prepressColorPalettes;
  }

  _i2.PaymentCodeDTOInclude? _paymentCode;

  _i4.ShippingMethodDTOInclude? _shippingMethod;

  _i5.AppClientDTOInclude? _contractSovereignty;

  _i6.LightUserDTOInclude? _assignedUser;

  _i7.ContactDTOInclude? _contact;

  _i8.FTPInterfaceDTOIncludeList? _ftpInterfaces;

  _i9.BearerCustomerRelationIncludeList? _bearers;

  _i10.PrepressColorPaletteDTOIncludeList? _prepressColorPalettes;

  @override
  Map<String, _i1.Include?> get includes => {
        'paymentCode': _paymentCode,
        'shippingMethod': _shippingMethod,
        'contractSovereignty': _contractSovereignty,
        'assignedUser': _assignedUser,
        'contact': _contact,
        'ftpInterfaces': _ftpInterfaces,
        'bearers': _bearers,
        'prepressColorPalettes': _prepressColorPalettes,
      };

  @override
  _i1.Table<int?> get table => CustomerDTO.t;
}

class CustomerDTOIncludeList extends _i1.IncludeList {
  CustomerDTOIncludeList._({
    _i1.WhereExpressionBuilder<CustomerDTOTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(CustomerDTO.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => CustomerDTO.t;
}

class CustomerDTORepository {
  const CustomerDTORepository._();

  final attach = const CustomerDTOAttachRepository._();

  final attachRow = const CustomerDTOAttachRowRepository._();

  final detach = const CustomerDTODetachRepository._();

  final detachRow = const CustomerDTODetachRowRepository._();

  /// Returns a list of [CustomerDTO]s matching the given query parameters.
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
  Future<List<CustomerDTO>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CustomerDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CustomerDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CustomerDTOTable>? orderByList,
    _i1.Transaction? transaction,
    CustomerDTOInclude? include,
  }) async {
    return session.db.find<CustomerDTO>(
      where: where?.call(CustomerDTO.t),
      orderBy: orderBy?.call(CustomerDTO.t),
      orderByList: orderByList?.call(CustomerDTO.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [CustomerDTO] matching the given query parameters.
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
  Future<CustomerDTO?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CustomerDTOTable>? where,
    int? offset,
    _i1.OrderByBuilder<CustomerDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CustomerDTOTable>? orderByList,
    _i1.Transaction? transaction,
    CustomerDTOInclude? include,
  }) async {
    return session.db.findFirstRow<CustomerDTO>(
      where: where?.call(CustomerDTO.t),
      orderBy: orderBy?.call(CustomerDTO.t),
      orderByList: orderByList?.call(CustomerDTO.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [CustomerDTO] by its [id] or null if no such row exists.
  Future<CustomerDTO?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    CustomerDTOInclude? include,
  }) async {
    return session.db.findById<CustomerDTO>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [CustomerDTO]s in the list and returns the inserted rows.
  ///
  /// The returned [CustomerDTO]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<CustomerDTO>> insert(
    _i1.Session session,
    List<CustomerDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<CustomerDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [CustomerDTO] and returns the inserted row.
  ///
  /// The returned [CustomerDTO] will have its `id` field set.
  Future<CustomerDTO> insertRow(
    _i1.Session session,
    CustomerDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<CustomerDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [CustomerDTO]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<CustomerDTO>> update(
    _i1.Session session,
    List<CustomerDTO> rows, {
    _i1.ColumnSelections<CustomerDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<CustomerDTO>(
      rows,
      columns: columns?.call(CustomerDTO.t),
      transaction: transaction,
    );
  }

  /// Updates a single [CustomerDTO]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<CustomerDTO> updateRow(
    _i1.Session session,
    CustomerDTO row, {
    _i1.ColumnSelections<CustomerDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<CustomerDTO>(
      row,
      columns: columns?.call(CustomerDTO.t),
      transaction: transaction,
    );
  }

  /// Deletes all [CustomerDTO]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<CustomerDTO>> delete(
    _i1.Session session,
    List<CustomerDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<CustomerDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [CustomerDTO].
  Future<CustomerDTO> deleteRow(
    _i1.Session session,
    CustomerDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<CustomerDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<CustomerDTO>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<CustomerDTOTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<CustomerDTO>(
      where: where(CustomerDTO.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CustomerDTOTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<CustomerDTO>(
      where: where?.call(CustomerDTO.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class CustomerDTOAttachRepository {
  const CustomerDTOAttachRepository._();

  /// Creates a relation between this [CustomerDTO] and the given [FTPInterfaceDTO]s
  /// by setting each [FTPInterfaceDTO]'s foreign key `_edCrmCustomerFtpinterfacesEdCrmCustomerId` to refer to this [CustomerDTO].
  Future<void> ftpInterfaces(
    _i1.Session session,
    CustomerDTO customerDTO,
    List<_i8.FTPInterfaceDTO> fTPInterfaceDTO, {
    _i1.Transaction? transaction,
  }) async {
    if (fTPInterfaceDTO.any((e) => e.id == null)) {
      throw ArgumentError.notNull('fTPInterfaceDTO.id');
    }
    if (customerDTO.id == null) {
      throw ArgumentError.notNull('customerDTO.id');
    }

    var $fTPInterfaceDTO = fTPInterfaceDTO
        .map((e) => _i8.FTPInterfaceDTOImplicit(
              e,
              $_edCrmCustomerFtpinterfacesEdCrmCustomerId: customerDTO.id,
            ))
        .toList();
    await session.db.update<_i8.FTPInterfaceDTO>(
      $fTPInterfaceDTO,
      columns: [
        _i8.FTPInterfaceDTO.t.$_edCrmCustomerFtpinterfacesEdCrmCustomerId
      ],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [CustomerDTO] and the given [BearerCustomerRelation]s
  /// by setting each [BearerCustomerRelation]'s foreign key `customerId` to refer to this [CustomerDTO].
  Future<void> bearers(
    _i1.Session session,
    CustomerDTO customerDTO,
    List<_i9.BearerCustomerRelation> bearerCustomerRelation, {
    _i1.Transaction? transaction,
  }) async {
    if (bearerCustomerRelation.any((e) => e.id == null)) {
      throw ArgumentError.notNull('bearerCustomerRelation.id');
    }
    if (customerDTO.id == null) {
      throw ArgumentError.notNull('customerDTO.id');
    }

    var $bearerCustomerRelation = bearerCustomerRelation
        .map((e) => e.copyWith(customerId: customerDTO.id))
        .toList();
    await session.db.update<_i9.BearerCustomerRelation>(
      $bearerCustomerRelation,
      columns: [_i9.BearerCustomerRelation.t.customerId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [CustomerDTO] and the given [PrepressColorPaletteDTO]s
  /// by setting each [PrepressColorPaletteDTO]'s foreign key `customerId` to refer to this [CustomerDTO].
  Future<void> prepressColorPalettes(
    _i1.Session session,
    CustomerDTO customerDTO,
    List<_i10.PrepressColorPaletteDTO> prepressColorPaletteDTO, {
    _i1.Transaction? transaction,
  }) async {
    if (prepressColorPaletteDTO.any((e) => e.id == null)) {
      throw ArgumentError.notNull('prepressColorPaletteDTO.id');
    }
    if (customerDTO.id == null) {
      throw ArgumentError.notNull('customerDTO.id');
    }

    var $prepressColorPaletteDTO = prepressColorPaletteDTO
        .map((e) => e.copyWith(customerId: customerDTO.id))
        .toList();
    await session.db.update<_i10.PrepressColorPaletteDTO>(
      $prepressColorPaletteDTO,
      columns: [_i10.PrepressColorPaletteDTO.t.customerId],
      transaction: transaction,
    );
  }
}

class CustomerDTOAttachRowRepository {
  const CustomerDTOAttachRowRepository._();

  /// Creates a relation between the given [CustomerDTO] and [PaymentCodeDTO]
  /// by setting the [CustomerDTO]'s foreign key `paymentCodeId` to refer to the [PaymentCodeDTO].
  Future<void> paymentCode(
    _i1.Session session,
    CustomerDTO customerDTO,
    _i2.PaymentCodeDTO paymentCode, {
    _i1.Transaction? transaction,
  }) async {
    if (customerDTO.id == null) {
      throw ArgumentError.notNull('customerDTO.id');
    }
    if (paymentCode.id == null) {
      throw ArgumentError.notNull('paymentCode.id');
    }

    var $customerDTO = customerDTO.copyWith(paymentCodeId: paymentCode.id);
    await session.db.updateRow<CustomerDTO>(
      $customerDTO,
      columns: [CustomerDTO.t.paymentCodeId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [CustomerDTO] and [ShippingMethodDTO]
  /// by setting the [CustomerDTO]'s foreign key `shippingMethodId` to refer to the [ShippingMethodDTO].
  Future<void> shippingMethod(
    _i1.Session session,
    CustomerDTO customerDTO,
    _i4.ShippingMethodDTO shippingMethod, {
    _i1.Transaction? transaction,
  }) async {
    if (customerDTO.id == null) {
      throw ArgumentError.notNull('customerDTO.id');
    }
    if (shippingMethod.id == null) {
      throw ArgumentError.notNull('shippingMethod.id');
    }

    var $customerDTO =
        customerDTO.copyWith(shippingMethodId: shippingMethod.id);
    await session.db.updateRow<CustomerDTO>(
      $customerDTO,
      columns: [CustomerDTO.t.shippingMethodId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [CustomerDTO] and [AppClientDTO]
  /// by setting the [CustomerDTO]'s foreign key `contractSovereigntyId` to refer to the [AppClientDTO].
  Future<void> contractSovereignty(
    _i1.Session session,
    CustomerDTO customerDTO,
    _i5.AppClientDTO contractSovereignty, {
    _i1.Transaction? transaction,
  }) async {
    if (customerDTO.id == null) {
      throw ArgumentError.notNull('customerDTO.id');
    }
    if (contractSovereignty.id == null) {
      throw ArgumentError.notNull('contractSovereignty.id');
    }

    var $customerDTO =
        customerDTO.copyWith(contractSovereigntyId: contractSovereignty.id);
    await session.db.updateRow<CustomerDTO>(
      $customerDTO,
      columns: [CustomerDTO.t.contractSovereigntyId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [CustomerDTO] and [LightUserDTO]
  /// by setting the [CustomerDTO]'s foreign key `assignedUserId` to refer to the [LightUserDTO].
  Future<void> assignedUser(
    _i1.Session session,
    CustomerDTO customerDTO,
    _i6.LightUserDTO assignedUser, {
    _i1.Transaction? transaction,
  }) async {
    if (customerDTO.id == null) {
      throw ArgumentError.notNull('customerDTO.id');
    }
    if (assignedUser.id == null) {
      throw ArgumentError.notNull('assignedUser.id');
    }

    var $customerDTO = customerDTO.copyWith(assignedUserId: assignedUser.id);
    await session.db.updateRow<CustomerDTO>(
      $customerDTO,
      columns: [CustomerDTO.t.assignedUserId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [CustomerDTO] and [ContactDTO]
  /// by setting the [CustomerDTO]'s foreign key `contactId` to refer to the [ContactDTO].
  Future<void> contact(
    _i1.Session session,
    CustomerDTO customerDTO,
    _i7.ContactDTO contact, {
    _i1.Transaction? transaction,
  }) async {
    if (customerDTO.id == null) {
      throw ArgumentError.notNull('customerDTO.id');
    }
    if (contact.id == null) {
      throw ArgumentError.notNull('contact.id');
    }

    var $customerDTO = customerDTO.copyWith(contactId: contact.id);
    await session.db.updateRow<CustomerDTO>(
      $customerDTO,
      columns: [CustomerDTO.t.contactId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [CustomerDTO] and the given [FTPInterfaceDTO]
  /// by setting the [FTPInterfaceDTO]'s foreign key `_edCrmCustomerFtpinterfacesEdCrmCustomerId` to refer to this [CustomerDTO].
  Future<void> ftpInterfaces(
    _i1.Session session,
    CustomerDTO customerDTO,
    _i8.FTPInterfaceDTO fTPInterfaceDTO, {
    _i1.Transaction? transaction,
  }) async {
    if (fTPInterfaceDTO.id == null) {
      throw ArgumentError.notNull('fTPInterfaceDTO.id');
    }
    if (customerDTO.id == null) {
      throw ArgumentError.notNull('customerDTO.id');
    }

    var $fTPInterfaceDTO = _i8.FTPInterfaceDTOImplicit(
      fTPInterfaceDTO,
      $_edCrmCustomerFtpinterfacesEdCrmCustomerId: customerDTO.id,
    );
    await session.db.updateRow<_i8.FTPInterfaceDTO>(
      $fTPInterfaceDTO,
      columns: [
        _i8.FTPInterfaceDTO.t.$_edCrmCustomerFtpinterfacesEdCrmCustomerId
      ],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [CustomerDTO] and the given [BearerCustomerRelation]
  /// by setting the [BearerCustomerRelation]'s foreign key `customerId` to refer to this [CustomerDTO].
  Future<void> bearers(
    _i1.Session session,
    CustomerDTO customerDTO,
    _i9.BearerCustomerRelation bearerCustomerRelation, {
    _i1.Transaction? transaction,
  }) async {
    if (bearerCustomerRelation.id == null) {
      throw ArgumentError.notNull('bearerCustomerRelation.id');
    }
    if (customerDTO.id == null) {
      throw ArgumentError.notNull('customerDTO.id');
    }

    var $bearerCustomerRelation =
        bearerCustomerRelation.copyWith(customerId: customerDTO.id);
    await session.db.updateRow<_i9.BearerCustomerRelation>(
      $bearerCustomerRelation,
      columns: [_i9.BearerCustomerRelation.t.customerId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [CustomerDTO] and the given [PrepressColorPaletteDTO]
  /// by setting the [PrepressColorPaletteDTO]'s foreign key `customerId` to refer to this [CustomerDTO].
  Future<void> prepressColorPalettes(
    _i1.Session session,
    CustomerDTO customerDTO,
    _i10.PrepressColorPaletteDTO prepressColorPaletteDTO, {
    _i1.Transaction? transaction,
  }) async {
    if (prepressColorPaletteDTO.id == null) {
      throw ArgumentError.notNull('prepressColorPaletteDTO.id');
    }
    if (customerDTO.id == null) {
      throw ArgumentError.notNull('customerDTO.id');
    }

    var $prepressColorPaletteDTO =
        prepressColorPaletteDTO.copyWith(customerId: customerDTO.id);
    await session.db.updateRow<_i10.PrepressColorPaletteDTO>(
      $prepressColorPaletteDTO,
      columns: [_i10.PrepressColorPaletteDTO.t.customerId],
      transaction: transaction,
    );
  }
}

class CustomerDTODetachRepository {
  const CustomerDTODetachRepository._();

  /// Detaches the relation between this [CustomerDTO] and the given [FTPInterfaceDTO]
  /// by setting the [FTPInterfaceDTO]'s foreign key `_edCrmCustomerFtpinterfacesEdCrmCustomerId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> ftpInterfaces(
    _i1.Session session,
    List<_i8.FTPInterfaceDTO> fTPInterfaceDTO, {
    _i1.Transaction? transaction,
  }) async {
    if (fTPInterfaceDTO.any((e) => e.id == null)) {
      throw ArgumentError.notNull('fTPInterfaceDTO.id');
    }

    var $fTPInterfaceDTO = fTPInterfaceDTO
        .map((e) => _i8.FTPInterfaceDTOImplicit(
              e,
              $_edCrmCustomerFtpinterfacesEdCrmCustomerId: null,
            ))
        .toList();
    await session.db.update<_i8.FTPInterfaceDTO>(
      $fTPInterfaceDTO,
      columns: [
        _i8.FTPInterfaceDTO.t.$_edCrmCustomerFtpinterfacesEdCrmCustomerId
      ],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [CustomerDTO] and the given [BearerCustomerRelation]
  /// by setting the [BearerCustomerRelation]'s foreign key `customerId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> bearers(
    _i1.Session session,
    List<_i9.BearerCustomerRelation> bearerCustomerRelation, {
    _i1.Transaction? transaction,
  }) async {
    if (bearerCustomerRelation.any((e) => e.id == null)) {
      throw ArgumentError.notNull('bearerCustomerRelation.id');
    }

    var $bearerCustomerRelation = bearerCustomerRelation
        .map((e) => e.copyWith(customerId: null))
        .toList();
    await session.db.update<_i9.BearerCustomerRelation>(
      $bearerCustomerRelation,
      columns: [_i9.BearerCustomerRelation.t.customerId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [CustomerDTO] and the given [PrepressColorPaletteDTO]
  /// by setting the [PrepressColorPaletteDTO]'s foreign key `customerId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> prepressColorPalettes(
    _i1.Session session,
    List<_i10.PrepressColorPaletteDTO> prepressColorPaletteDTO, {
    _i1.Transaction? transaction,
  }) async {
    if (prepressColorPaletteDTO.any((e) => e.id == null)) {
      throw ArgumentError.notNull('prepressColorPaletteDTO.id');
    }

    var $prepressColorPaletteDTO = prepressColorPaletteDTO
        .map((e) => e.copyWith(customerId: null))
        .toList();
    await session.db.update<_i10.PrepressColorPaletteDTO>(
      $prepressColorPaletteDTO,
      columns: [_i10.PrepressColorPaletteDTO.t.customerId],
      transaction: transaction,
    );
  }
}

class CustomerDTODetachRowRepository {
  const CustomerDTODetachRowRepository._();

  /// Detaches the relation between this [CustomerDTO] and the [PaymentCodeDTO] set in `paymentCode`
  /// by setting the [CustomerDTO]'s foreign key `paymentCodeId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> paymentCode(
    _i1.Session session,
    CustomerDTO customerdto, {
    _i1.Transaction? transaction,
  }) async {
    if (customerdto.id == null) {
      throw ArgumentError.notNull('customerdto.id');
    }

    var $customerdto = customerdto.copyWith(paymentCodeId: null);
    await session.db.updateRow<CustomerDTO>(
      $customerdto,
      columns: [CustomerDTO.t.paymentCodeId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [CustomerDTO] and the [ShippingMethodDTO] set in `shippingMethod`
  /// by setting the [CustomerDTO]'s foreign key `shippingMethodId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> shippingMethod(
    _i1.Session session,
    CustomerDTO customerdto, {
    _i1.Transaction? transaction,
  }) async {
    if (customerdto.id == null) {
      throw ArgumentError.notNull('customerdto.id');
    }

    var $customerdto = customerdto.copyWith(shippingMethodId: null);
    await session.db.updateRow<CustomerDTO>(
      $customerdto,
      columns: [CustomerDTO.t.shippingMethodId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [CustomerDTO] and the [AppClientDTO] set in `contractSovereignty`
  /// by setting the [CustomerDTO]'s foreign key `contractSovereigntyId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> contractSovereignty(
    _i1.Session session,
    CustomerDTO customerdto, {
    _i1.Transaction? transaction,
  }) async {
    if (customerdto.id == null) {
      throw ArgumentError.notNull('customerdto.id');
    }

    var $customerdto = customerdto.copyWith(contractSovereigntyId: null);
    await session.db.updateRow<CustomerDTO>(
      $customerdto,
      columns: [CustomerDTO.t.contractSovereigntyId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [CustomerDTO] and the [LightUserDTO] set in `assignedUser`
  /// by setting the [CustomerDTO]'s foreign key `assignedUserId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> assignedUser(
    _i1.Session session,
    CustomerDTO customerdto, {
    _i1.Transaction? transaction,
  }) async {
    if (customerdto.id == null) {
      throw ArgumentError.notNull('customerdto.id');
    }

    var $customerdto = customerdto.copyWith(assignedUserId: null);
    await session.db.updateRow<CustomerDTO>(
      $customerdto,
      columns: [CustomerDTO.t.assignedUserId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [CustomerDTO] and the [ContactDTO] set in `contact`
  /// by setting the [CustomerDTO]'s foreign key `contactId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> contact(
    _i1.Session session,
    CustomerDTO customerdto, {
    _i1.Transaction? transaction,
  }) async {
    if (customerdto.id == null) {
      throw ArgumentError.notNull('customerdto.id');
    }

    var $customerdto = customerdto.copyWith(contactId: null);
    await session.db.updateRow<CustomerDTO>(
      $customerdto,
      columns: [CustomerDTO.t.contactId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [CustomerDTO] and the given [FTPInterfaceDTO]
  /// by setting the [FTPInterfaceDTO]'s foreign key `_edCrmCustomerFtpinterfacesEdCrmCustomerId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> ftpInterfaces(
    _i1.Session session,
    _i8.FTPInterfaceDTO fTPInterfaceDTO, {
    _i1.Transaction? transaction,
  }) async {
    if (fTPInterfaceDTO.id == null) {
      throw ArgumentError.notNull('fTPInterfaceDTO.id');
    }

    var $fTPInterfaceDTO = _i8.FTPInterfaceDTOImplicit(
      fTPInterfaceDTO,
      $_edCrmCustomerFtpinterfacesEdCrmCustomerId: null,
    );
    await session.db.updateRow<_i8.FTPInterfaceDTO>(
      $fTPInterfaceDTO,
      columns: [
        _i8.FTPInterfaceDTO.t.$_edCrmCustomerFtpinterfacesEdCrmCustomerId
      ],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [CustomerDTO] and the given [BearerCustomerRelation]
  /// by setting the [BearerCustomerRelation]'s foreign key `customerId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> bearers(
    _i1.Session session,
    _i9.BearerCustomerRelation bearerCustomerRelation, {
    _i1.Transaction? transaction,
  }) async {
    if (bearerCustomerRelation.id == null) {
      throw ArgumentError.notNull('bearerCustomerRelation.id');
    }

    var $bearerCustomerRelation =
        bearerCustomerRelation.copyWith(customerId: null);
    await session.db.updateRow<_i9.BearerCustomerRelation>(
      $bearerCustomerRelation,
      columns: [_i9.BearerCustomerRelation.t.customerId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [CustomerDTO] and the given [PrepressColorPaletteDTO]
  /// by setting the [PrepressColorPaletteDTO]'s foreign key `customerId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> prepressColorPalettes(
    _i1.Session session,
    _i10.PrepressColorPaletteDTO prepressColorPaletteDTO, {
    _i1.Transaction? transaction,
  }) async {
    if (prepressColorPaletteDTO.id == null) {
      throw ArgumentError.notNull('prepressColorPaletteDTO.id');
    }

    var $prepressColorPaletteDTO =
        prepressColorPaletteDTO.copyWith(customerId: null);
    await session.db.updateRow<_i10.PrepressColorPaletteDTO>(
      $prepressColorPaletteDTO,
      columns: [_i10.PrepressColorPaletteDTO.t.customerId],
      transaction: transaction,
    );
  }
}
