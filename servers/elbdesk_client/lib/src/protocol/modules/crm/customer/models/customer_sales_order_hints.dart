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

abstract class CustomerSalesOrderHintsDTO implements _i1.SerializableModel {
  CustomerSalesOrderHintsDTO._({
    required this.firstReference,
    required this.secondReference,
    required this.orderNumber,
    required this.keywords,
  });

  factory CustomerSalesOrderHintsDTO({
    required String firstReference,
    required String secondReference,
    required String orderNumber,
    required String keywords,
  }) = _CustomerSalesOrderHintsDTOImpl;

  factory CustomerSalesOrderHintsDTO.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return CustomerSalesOrderHintsDTO(
      firstReference: jsonSerialization['firstReference'] as String,
      secondReference: jsonSerialization['secondReference'] as String,
      orderNumber: jsonSerialization['orderNumber'] as String,
      keywords: jsonSerialization['keywords'] as String,
    );
  }

  String firstReference;

  String secondReference;

  String orderNumber;

  String keywords;

  /// Returns a shallow copy of this [CustomerSalesOrderHintsDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CustomerSalesOrderHintsDTO copyWith({
    String? firstReference,
    String? secondReference,
    String? orderNumber,
    String? keywords,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'firstReference': firstReference,
      'secondReference': secondReference,
      'orderNumber': orderNumber,
      'keywords': keywords,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _CustomerSalesOrderHintsDTOImpl extends CustomerSalesOrderHintsDTO {
  _CustomerSalesOrderHintsDTOImpl({
    required String firstReference,
    required String secondReference,
    required String orderNumber,
    required String keywords,
  }) : super._(
          firstReference: firstReference,
          secondReference: secondReference,
          orderNumber: orderNumber,
          keywords: keywords,
        );

  /// Returns a shallow copy of this [CustomerSalesOrderHintsDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CustomerSalesOrderHintsDTO copyWith({
    String? firstReference,
    String? secondReference,
    String? orderNumber,
    String? keywords,
  }) {
    return CustomerSalesOrderHintsDTO(
      firstReference: firstReference ?? this.firstReference,
      secondReference: secondReference ?? this.secondReference,
      orderNumber: orderNumber ?? this.orderNumber,
      keywords: keywords ?? this.keywords,
    );
  }
}
