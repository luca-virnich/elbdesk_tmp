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
import '../../../../modules/crm/payment_code/models/payment_code.dart' as _i2;
import '../../../../modules/crm/customer/models/customer_sales_order_hints.dart'
    as _i3;
import '../../../../modules/crm/customer/models/shipping_method.dart' as _i4;
import '../../../../modules/crm/app_client/models/app_client.dart' as _i5;
import 'package:elbdesk_backend_core_client/elbdesk_backend_core_client.dart'
    as _i6;
import '../../../../modules/crm/contact/models/contact.dart' as _i7;
import '../../../../modules/unsorted/ftp_interface/ftp_interface.dart' as _i8;
import '../../../../modules/unsorted/junction_tables/customer_bearer.dart'
    as _i9;
import '../../../../modules/prepress/color_palette/models/prepress_color_palette.dart'
    as _i10;

abstract class CustomerDTO implements _i1.SerializableModel {
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
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
