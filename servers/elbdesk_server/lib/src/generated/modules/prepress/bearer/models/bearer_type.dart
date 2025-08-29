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

enum BearerType implements _i1.SerializableModel {
  none,
  type1,
  type2,
  standardFlexoPrint,
  flexoPrintMultilayer,
  sheetFedPressMinPlate,
  sheetFedPressPlateEqualsSub,
  offsetPressFixedPlate,
  sheetFedPressFixedPlate;

  static BearerType fromJson(String name) {
    switch (name) {
      case 'none':
        return BearerType.none;
      case 'type1':
        return BearerType.type1;
      case 'type2':
        return BearerType.type2;
      case 'standardFlexoPrint':
        return BearerType.standardFlexoPrint;
      case 'flexoPrintMultilayer':
        return BearerType.flexoPrintMultilayer;
      case 'sheetFedPressMinPlate':
        return BearerType.sheetFedPressMinPlate;
      case 'sheetFedPressPlateEqualsSub':
        return BearerType.sheetFedPressPlateEqualsSub;
      case 'offsetPressFixedPlate':
        return BearerType.offsetPressFixedPlate;
      case 'sheetFedPressFixedPlate':
        return BearerType.sheetFedPressFixedPlate;
      default:
        throw ArgumentError(
            'Value "$name" cannot be converted to "BearerType"');
    }
  }

  @override
  String toJson() => name;
  @override
  String toString() => name;
}
