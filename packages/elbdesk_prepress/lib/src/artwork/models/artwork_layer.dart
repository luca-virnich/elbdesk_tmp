import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'artwork_layer.freezed.dart';
part 'artwork_layer.g.dart';

/// ArtworkLayer
///
/// The ArtworkLayer model is our client model for the LayerDTO
///
@freezed
class ArtworkLayer with _$ArtworkLayer {
  /// ArtworkLayer constructor
  const factory ArtworkLayer({
    required String layerName,
    required ArtworkLayerType? layerType,
    required bool printable,
    required bool locked,
    required String runtimeId,
  }) = _ArtworkLayer;

  const ArtworkLayer._();

  factory ArtworkLayer.fromJson(Map<String, Object?> json) =>
      _$ArtworkLayerFromJson(json);

  /// Initial ArtworkLayer
  factory ArtworkLayer.initial() {
    return ArtworkLayer(
      layerName: '',
      layerType: null,
      printable: false,
      locked: false,
      runtimeId: const Uuid().v4(),
    );
  }

  /// ArtworkLayer from DTO
  factory ArtworkLayer.fromDTO(ArtworkLayerDTO dto) {
    return ArtworkLayer(
      layerName: dto.layerName,
      layerType: dto.layerType,
      printable: dto.printable,
      locked: dto.locked,
      runtimeId: const Uuid().v4(),
    );
  }

  /// ArtworkLayer to DTO
  ArtworkLayerDTO toDTO() {
    return ArtworkLayerDTO(
      layerName: layerName,
      layerType: layerType,
      printable: printable,
      locked: locked,
    );
  }
}
