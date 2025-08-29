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

enum ArtworkField implements _i1.SerializableModel {
  id,
  description,
  customer,
  customerId,
  layerId,
  version,
  abzug,
  reference,
  salesOrderId,
  artworkType,
  printProcessType,
  width,
  height,
  cornerRadius,
  dieCutterType,
  trappNormal,
  trappBlack,
  trappBilder,
  trappSonderfarben,
  trappRueckzug,
  anschnitt,
  layers,
  colors,
  codes,
  actions,
  createdAt,
  createdBy,
  lastModifiedAt,
  lastModifiedBy,
  deletedAt,
  isDraft;

  static ArtworkField fromJson(String name) {
    switch (name) {
      case 'id':
        return ArtworkField.id;
      case 'description':
        return ArtworkField.description;
      case 'customer':
        return ArtworkField.customer;
      case 'customerId':
        return ArtworkField.customerId;
      case 'layerId':
        return ArtworkField.layerId;
      case 'version':
        return ArtworkField.version;
      case 'abzug':
        return ArtworkField.abzug;
      case 'reference':
        return ArtworkField.reference;
      case 'salesOrderId':
        return ArtworkField.salesOrderId;
      case 'artworkType':
        return ArtworkField.artworkType;
      case 'printProcessType':
        return ArtworkField.printProcessType;
      case 'width':
        return ArtworkField.width;
      case 'height':
        return ArtworkField.height;
      case 'cornerRadius':
        return ArtworkField.cornerRadius;
      case 'dieCutterType':
        return ArtworkField.dieCutterType;
      case 'trappNormal':
        return ArtworkField.trappNormal;
      case 'trappBlack':
        return ArtworkField.trappBlack;
      case 'trappBilder':
        return ArtworkField.trappBilder;
      case 'trappSonderfarben':
        return ArtworkField.trappSonderfarben;
      case 'trappRueckzug':
        return ArtworkField.trappRueckzug;
      case 'anschnitt':
        return ArtworkField.anschnitt;
      case 'layers':
        return ArtworkField.layers;
      case 'colors':
        return ArtworkField.colors;
      case 'codes':
        return ArtworkField.codes;
      case 'actions':
        return ArtworkField.actions;
      case 'createdAt':
        return ArtworkField.createdAt;
      case 'createdBy':
        return ArtworkField.createdBy;
      case 'lastModifiedAt':
        return ArtworkField.lastModifiedAt;
      case 'lastModifiedBy':
        return ArtworkField.lastModifiedBy;
      case 'deletedAt':
        return ArtworkField.deletedAt;
      case 'isDraft':
        return ArtworkField.isDraft;
      default:
        throw ArgumentError(
            'Value "$name" cannot be converted to "ArtworkField"');
    }
  }

  @override
  String toJson() => name;
  @override
  String toString() => name;
}
