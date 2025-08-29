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
import '../../../../modules/prepress/nutzenlayout/models/nutzenlayout_cell_dto.dart'
    as _i2;

abstract class NutzenlayoutColumnDTO implements _i1.SerializableModel {
  NutzenlayoutColumnDTO._({
    required this.gapVertical,
    required this.offset,
    required this.cells,
  });

  factory NutzenlayoutColumnDTO({
    required double gapVertical,
    required double offset,
    required List<_i2.NutzenlayoutCellDTO> cells,
  }) = _NutzenlayoutColumnDTOImpl;

  factory NutzenlayoutColumnDTO.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return NutzenlayoutColumnDTO(
      gapVertical: (jsonSerialization['gapVertical'] as num).toDouble(),
      offset: (jsonSerialization['offset'] as num).toDouble(),
      cells: (jsonSerialization['cells'] as List)
          .map((e) =>
              _i2.NutzenlayoutCellDTO.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  double gapVertical;

  double offset;

  List<_i2.NutzenlayoutCellDTO> cells;

  /// Returns a shallow copy of this [NutzenlayoutColumnDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  NutzenlayoutColumnDTO copyWith({
    double? gapVertical,
    double? offset,
    List<_i2.NutzenlayoutCellDTO>? cells,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'gapVertical': gapVertical,
      'offset': offset,
      'cells': cells.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _NutzenlayoutColumnDTOImpl extends NutzenlayoutColumnDTO {
  _NutzenlayoutColumnDTOImpl({
    required double gapVertical,
    required double offset,
    required List<_i2.NutzenlayoutCellDTO> cells,
  }) : super._(
          gapVertical: gapVertical,
          offset: offset,
          cells: cells,
        );

  /// Returns a shallow copy of this [NutzenlayoutColumnDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  NutzenlayoutColumnDTO copyWith({
    double? gapVertical,
    double? offset,
    List<_i2.NutzenlayoutCellDTO>? cells,
  }) {
    return NutzenlayoutColumnDTO(
      gapVertical: gapVertical ?? this.gapVertical,
      offset: offset ?? this.offset,
      cells: cells ?? this.cells.map((e0) => e0.copyWith()).toList(),
    );
  }
}
