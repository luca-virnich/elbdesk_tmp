import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/artwork_color/models/artwork_color.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// @nodoc
class ArtworkColorRepository implements EntityRepository<ArtworkColor> {
  /// @nodoc
  ArtworkColorRepository({
    required this.ref,
    required this.endpoint,
  });

  final Ref ref;
  final EndpointArtworkColor endpoint;

  @override
  Future<ArtworkColor> createAndReturnEntity({
    required String sessionId,
    required ArtworkColor entity,
    required bool release,
  }) async {
    throw UnimplementedError();
  }

  Future<int> create({
    required String sessionId,
    required int colorPaletteId,
  }) async {
    final newColor = await endpoint.create(
      sessionId: sessionId,
      colorPaletteId: colorPaletteId,
    );

    return newColor.id!;
  }

  @override
  Future<bool> delete(int entityId, String sessionId) async {
    return endpoint.delete(
      entityId: entityId,
      sessionId: sessionId,
    );
  }

  @override
  Future<List<ArtworkColor>> fetchAll() async {
    throw UnimplementedError();
  }

  @override
  Future<ArtworkColor> fetchById(int id) async {
    final color = await endpoint.fetchById(id);
    return ArtworkColor.fromDTO(color!);
  }

  @override
  Future<List<ArtworkColor>> find({Sort? sort, Filter? filter}) async {
    final response = await endpoint.find(sort: sort, filter: filter);
    return response.map(ArtworkColor.fromDTO).toList();
  }

  @override
  Future<ArtworkColor?> fetchAndLock(
    int colorId,
    String sessionId,
  ) async {
    final response = await endpoint.fetchAndLock(
      id: colorId,
      editingSessionId: sessionId,
    );
    return response != null ? ArtworkColor.fromDTO(response) : null;
  }

  @override
  Future<void> release(int entityId, String sessionId) async {
    await endpoint.release(
      entityId: entityId,
      sessionId: sessionId,
    );
  }

  @override
  Future<ArtworkColor> update({
    required ArtworkColor entity,
    required bool release,
    required String sessionId,
  }) async {
    final response = await endpoint.update(
      sessionId: sessionId,
      entity: entity.toDTO(),
      release: release,
    );
    return ArtworkColor.fromDTO(response);
  }

  Future<void> updateShortName(
    int entityId,
    String shortName,
  ) async {
    await endpoint.updateShortName(entityId: entityId, shortName: shortName);
  }

  Future<List<ArtworkColor>> fetchColorPaletteColors(
    int colorPaletteId,
  ) async {
    final response =
        await endpoint.fetchColorPaletteColors(colorPaletteId: colorPaletteId);
    return response.map(ArtworkColor.fromDTO).toList();
  }

  Future<List<ArtworkColor>> findByShortName(
    int customerId,
    String shortName,
  ) async {
    final response = await endpoint.findByShortName(
      customerId: customerId,
      shortName: shortName,
    );
    return response.map(ArtworkColor.fromDTO).toList();
  }

  Future<List<ArtworkColor>> findAllByCustomerId({
    required int customerId,
    required Sort? sort,
    required Filter? filter,
  }) async {
    final response = await endpoint.findAllByCustomerId(
      customerId: customerId,
      sort: sort,
      filter: filter,
    );
    return response.map(ArtworkColor.fromDTO).toList();
  }

  /// Import colors to a new palette
  ///
  /// A new ColorPalette will be created with the provided paletteName
  ///
  /// This method imports colors to a palette in batches of 20
  Future<void> importColors({
    required List<ArtworkColorDTO> artworkColors,
    required String paletteName,
    int? customerId,
  }) async {
    const batchSize = 20;
    for (var i = 0; i < artworkColors.length; i += batchSize) {
      final end = (i + batchSize < artworkColors.length)
          ? i + batchSize
          : artworkColors.length;
      final batch = artworkColors.sublist(i, end);
      await endpoint.importColors(
        artworkColors: batch,
        paletteName: paletteName,
        customerId: customerId,
      );
    }
  }

  /// Add colors to an existing palette
  ///
  /// This method adds colors to an existing palette in batches of 20
  Future<void> addColorsToPalette(
    List<ArtworkColorDTO> artworkColors,
    int paletteId,
  ) async {
    const batchSize = 20;
    for (var i = 0; i < artworkColors.length; i += batchSize) {
      final end = (i + batchSize < artworkColors.length)
          ? i + batchSize
          : artworkColors.length;
      final batch = artworkColors.sublist(i, end);
      await endpoint.addColorsToPalette(
        artworkColors: batch,
        paletteId: paletteId,
      );
    }
  }
}
