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

enum ArtworkColorPrintProcessType implements _i1.SerializableModel {
  flexo,
  flexoRef,
  siebdruck,
  siebdruckRef,
  buchdruck,
  buchdruckRef,
  digitaldruck,
  digitaldruckRef,
  offsetdruck,
  offsetdruckRef,
  nichtDruckend;

  static ArtworkColorPrintProcessType fromJson(String name) {
    switch (name) {
      case 'flexo':
        return ArtworkColorPrintProcessType.flexo;
      case 'flexoRef':
        return ArtworkColorPrintProcessType.flexoRef;
      case 'siebdruck':
        return ArtworkColorPrintProcessType.siebdruck;
      case 'siebdruckRef':
        return ArtworkColorPrintProcessType.siebdruckRef;
      case 'buchdruck':
        return ArtworkColorPrintProcessType.buchdruck;
      case 'buchdruckRef':
        return ArtworkColorPrintProcessType.buchdruckRef;
      case 'digitaldruck':
        return ArtworkColorPrintProcessType.digitaldruck;
      case 'digitaldruckRef':
        return ArtworkColorPrintProcessType.digitaldruckRef;
      case 'offsetdruck':
        return ArtworkColorPrintProcessType.offsetdruck;
      case 'offsetdruckRef':
        return ArtworkColorPrintProcessType.offsetdruckRef;
      case 'nichtDruckend':
        return ArtworkColorPrintProcessType.nichtDruckend;
      default:
        throw ArgumentError(
            'Value "$name" cannot be converted to "ArtworkColorPrintProcessType"');
    }
  }

  @override
  String toJson() => name;
  @override
  String toString() => name;
}
