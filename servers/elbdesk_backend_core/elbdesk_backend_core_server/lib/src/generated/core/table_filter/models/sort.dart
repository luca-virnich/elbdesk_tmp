/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class Sort
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  Sort._({
    required this.fieldKey,
    required this.orderDescending,
  });

  factory Sort({
    required String fieldKey,
    required bool orderDescending,
  }) = _SortImpl;

  factory Sort.fromJson(Map<String, dynamic> jsonSerialization) {
    return Sort(
      fieldKey: jsonSerialization['fieldKey'] as String,
      orderDescending: jsonSerialization['orderDescending'] as bool,
    );
  }

  String fieldKey;

  bool orderDescending;

  /// Returns a shallow copy of this [Sort]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Sort copyWith({
    String? fieldKey,
    bool? orderDescending,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'fieldKey': fieldKey,
      'orderDescending': orderDescending,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'fieldKey': fieldKey,
      'orderDescending': orderDescending,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _SortImpl extends Sort {
  _SortImpl({
    required String fieldKey,
    required bool orderDescending,
  }) : super._(
          fieldKey: fieldKey,
          orderDescending: orderDescending,
        );

  /// Returns a shallow copy of this [Sort]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Sort copyWith({
    String? fieldKey,
    bool? orderDescending,
  }) {
    return Sort(
      fieldKey: fieldKey ?? this.fieldKey,
      orderDescending: orderDescending ?? this.orderDescending,
    );
  }
}
