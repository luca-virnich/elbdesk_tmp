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

enum ArtworkLayerField implements _i1.SerializableModel {
  id,
  layerType,
  layerName,
  printable,
  locked,
  actions,
  move;

  static ArtworkLayerField fromJson(String name) {
    switch (name) {
      case 'id':
        return ArtworkLayerField.id;
      case 'layerType':
        return ArtworkLayerField.layerType;
      case 'layerName':
        return ArtworkLayerField.layerName;
      case 'printable':
        return ArtworkLayerField.printable;
      case 'locked':
        return ArtworkLayerField.locked;
      case 'actions':
        return ArtworkLayerField.actions;
      case 'move':
        return ArtworkLayerField.move;
      default:
        throw ArgumentError(
            'Value "$name" cannot be converted to "ArtworkLayerField"');
    }
  }

  @override
  String toJson() => name;
  @override
  String toString() => name;
}
