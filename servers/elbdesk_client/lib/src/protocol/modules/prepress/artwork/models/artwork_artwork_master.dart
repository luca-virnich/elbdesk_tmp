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

abstract class ArtworkArtworkMaster implements _i1.SerializableModel {
  ArtworkArtworkMaster._({
    required this.artworkId,
    required this.artworkMasterId,
  });

  factory ArtworkArtworkMaster({
    required int artworkId,
    required int artworkMasterId,
  }) = _ArtworkArtworkMasterImpl;

  factory ArtworkArtworkMaster.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return ArtworkArtworkMaster(
      artworkId: jsonSerialization['artworkId'] as int,
      artworkMasterId: jsonSerialization['artworkMasterId'] as int,
    );
  }

  int artworkId;

  int artworkMasterId;

  /// Returns a shallow copy of this [ArtworkArtworkMaster]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ArtworkArtworkMaster copyWith({
    int? artworkId,
    int? artworkMasterId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'artworkId': artworkId,
      'artworkMasterId': artworkMasterId,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _ArtworkArtworkMasterImpl extends ArtworkArtworkMaster {
  _ArtworkArtworkMasterImpl({
    required int artworkId,
    required int artworkMasterId,
  }) : super._(
          artworkId: artworkId,
          artworkMasterId: artworkMasterId,
        );

  /// Returns a shallow copy of this [ArtworkArtworkMaster]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ArtworkArtworkMaster copyWith({
    int? artworkId,
    int? artworkMasterId,
  }) {
    return ArtworkArtworkMaster(
      artworkId: artworkId ?? this.artworkId,
      artworkMasterId: artworkMasterId ?? this.artworkMasterId,
    );
  }
}
