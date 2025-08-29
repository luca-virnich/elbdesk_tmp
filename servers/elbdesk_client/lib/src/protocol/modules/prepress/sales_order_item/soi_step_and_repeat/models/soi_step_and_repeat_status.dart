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

enum SoiStepAndRepeatStatus implements _i1.SerializableModel {
  wartenAufArtworks,
  inArbeit,
  bereitZurPruefung,
  inPruefung,
  completed,
  canceled;

  static SoiStepAndRepeatStatus fromJson(String name) {
    switch (name) {
      case 'wartenAufArtworks':
        return SoiStepAndRepeatStatus.wartenAufArtworks;
      case 'inArbeit':
        return SoiStepAndRepeatStatus.inArbeit;
      case 'bereitZurPruefung':
        return SoiStepAndRepeatStatus.bereitZurPruefung;
      case 'inPruefung':
        return SoiStepAndRepeatStatus.inPruefung;
      case 'completed':
        return SoiStepAndRepeatStatus.completed;
      case 'canceled':
        return SoiStepAndRepeatStatus.canceled;
      default:
        throw ArgumentError(
            'Value "$name" cannot be converted to "SoiStepAndRepeatStatus"');
    }
  }

  @override
  String toJson() => name;
  @override
  String toString() => name;
}
