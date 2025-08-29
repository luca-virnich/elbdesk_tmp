import 'dart:async';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/elbdesk_prepress.dart';
import 'package:elbdesk_prepress/src/artwork/models/artwork_layer.dart';
import 'package:elbdesk_prepress/src/artwork_code/_export_artwork_code.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_core/project_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'artwork_state.g.dart';

/// Contact State
///
/// This state is used to manage and update the contact details
@riverpod
class ArtworkState extends _$ArtworkState implements EntityState<Artwork> {
  ///@nodoc
  ArtworkState() {
    _initializeStateManager();
  }
  late final EntityStateManager<Artwork> _stateManager;

  void _initializeStateManager() {
    _stateManager = EntityStateManager<Artwork>(
      setLoadingState: () => state = const AsyncLoading(),
      setDataState: (Artwork artwork) => state = AsyncData(artwork),
      setErrorState: (Object error, StackTrace stackTrace) =>
          state = AsyncError(error, stackTrace),
      fetchAndLockFn: () =>
          ref.read(artworkRepositoryProvider).fetchAndLock(entityId, sessionId),
      releaseFn: () =>
          ref.read(artworkRepositoryProvider).release(entityId, sessionId),
      fetchByIdFn: () =>
          ref.read(artworkRepositoryProvider).fetchById(entityId),
      updateWithReleaseFn: () => ref.read(artworkRepositoryProvider).update(
            entity: state.requireValue,
            release: true,
            sessionId: sessionId,
          ),
    );
  }

  @override
  Future<Artwork> build(int entityId, String sessionId) async {
    return _stateManager.build(
      id: entityId,
      sessionId: sessionId,
      ref: ref,
    );
  }

  @override
  Future<void> refetchWithLock() {
    return _stateManager.refetchWithLock();
  }

  @override
  Future<void> refetchWithoutLock() {
    return _stateManager.refetchWithoutLock();
  }

  @override
  Future<void> saveAndUnlockAndRefetch() async {
    return _stateManager.saveAndUnlockAndRefetch();
  }

  @override
  void updateMetaAfterSave() {
    final userId = ref.read(authUserStateProvider)!.id!;
    state = AsyncData(
      state.requireValue.copyWith.meta(
        lastModifiedAt: DateTime.now(),
        lastModifiedById: userId,
        isDraft: false,
      ),
    );
  }

  Future<void> updateIsLocked(bool isLocked) async {
    await refetchWithLock();
  }

  void updateDescription(String description) {
    state = AsyncData(state.requireValue.copyWith(description: description));
  }

  void updateWidth(double width) {
    state = AsyncData(state.requireValue.copyWith(width: width));
  }

  void updateHeight(double height) {
    state = AsyncData(state.requireValue.copyWith(height: height));
  }

  void updateArtworkPrintProcessType(
    ArtworkPrintProcessType? printProcessType,
  ) {
    state = AsyncData(
      state.requireValue.copyWith(printProcessType: printProcessType),
    );
  }

  void updateDieCutterType(ArtworkDieCutterType? dieCutterType) {
    state = AsyncData(
      state.requireValue.copyWith(
        dieCutterType: dieCutterType,
        cornerRadius: dieCutterType == ArtworkDieCutterType.circle
            ? 0
            : state.requireValue.cornerRadius,
      ),
    );
  }

  void updateTrappingNormal(double trappNormal) {
    state = AsyncData(
      state.requireValue.copyWith(
        trapping:
            state.requireValue.trapping.copyWith(trappNormal: trappNormal),
      ),
    );
  }

  void updateAbzug(int abzug) {
    state = AsyncData(state.requireValue.copyWith(abzug: abzug));
  }

  void updateArtworkType(ArtworkType? artworkType) {
    state = AsyncData(state.requireValue.copyWith(artworkType: artworkType));
  }

  void updateReference(String reference) {
    state = AsyncData(state.requireValue.copyWith(reference: reference));
  }

  void updateTrappingBlack(double trappBlack) {
    state = AsyncData(
      state.requireValue.copyWith(
        trapping: state.requireValue.trapping.copyWith(trappBlack: trappBlack),
      ),
    );
  }

  void updateLayerId(int layerId) {
    state = AsyncData(
      state.requireValue.copyWith(layerId: layerId),
    );
  }

  void updateCornerRadius(double cornerRadius) {
    state = AsyncData(
      state.requireValue.copyWith(cornerRadius: cornerRadius),
    );
  }

  /// En: Update Trapping Images
  void updateTrappingBilder(double trappBilder) {
    state = AsyncData(
      state.requireValue.copyWith(
        trapping:
            state.requireValue.trapping.copyWith(trappBilder: trappBilder),
      ),
    );
  }

  /// En: Update Special colors
  void updateTrappingSonderfarben(double trappSonderfarben) {
    state = AsyncData(
      state.requireValue.copyWith(
        trapping: state.requireValue.trapping
            .copyWith(trappSonderfarben: trappSonderfarben),
      ),
    );
  }

  /// En: Update Pullback or shrinkage
  void updateTrappingRueckzug(double trappRueckzug) {
    state = AsyncData(
      state.requireValue.copyWith(
        trapping:
            state.requireValue.trapping.copyWith(trappRueckzug: trappRueckzug),
      ),
    );
  }

  /// En: Update Bleed
  void updateAnschnitt(double anschnitt) {
    state = AsyncData(state.requireValue.copyWith(anschnitt: anschnitt));
  }

  void addLayer(ArtworkLayer layer) {
    state = AsyncData(
      state.requireValue
          .copyWith(layers: [...state.requireValue.layers, layer]),
    );
  }

  void updateLayer(ArtworkLayer layer) {
    final currentLayers = state.requireValue.layers;
    final updatedLayers = currentLayers
        .map((e) => e.runtimeId == layer.runtimeId ? layer : e)
        .toList();
    state = AsyncData(state.requireValue.copyWith(layers: updatedLayers));
  }

  void deleteLayer(String runtimeId) {
    final currentLayers = state.requireValue.layers;
    final updatedLayers =
        currentLayers.where((e) => e.runtimeId != runtimeId).toList();
    state = AsyncData(state.requireValue.copyWith(layers: updatedLayers));
  }

// *
// * Colors
// *

  /// Adds color to the artwork if it is not already present
  void addColor(ArtworkColor color) {
    final currentColors = state.requireValue.colors;
    if (!currentColors.any((e) => e.shortName == color.shortName)) {
      state = AsyncData(
        state.requireValue.copyWith(
          colors: [...currentColors, color],
        ),
      );
    }
  }

  ArtworkColor colorToUpdate(String runtimeId) {
    final currentColors = state.requireValue.colors;
    return currentColors.firstWhere(
      (e) => e.runtimeId == runtimeId,
    );
  }

  void copyColor(String runtimeId) {
    final toCopy = colorToUpdate(runtimeId);
    final newColor = ArtworkColor.copy(toCopy);
    state = AsyncData(
      state.requireValue.copyWith(
        colors: [
          ...state.requireValue.colors,
          newColor.copyWith(screenAngle: null),
        ],
      ),
    );
  }

  void updateColors(ArtworkColor updatedColor) {
    final currentColors = state.requireValue.colors;
    final updatedColors = currentColors
        .map((e) => e.runtimeId == updatedColor.runtimeId ? updatedColor : e)
        .toList();
    state = AsyncData(state.requireValue.copyWith(colors: updatedColors));
  }

  void addBlankColor() {
    state = AsyncData(
      state.requireValue.copyWith(
        colors: [
          ...state.requireValue.colors,
          ArtworkColor.initialArtworkTemplate(),
        ],
      ),
    );
  }

  void updateColorCustomText(String runtimeId, String? customText) {
    final toUpdate = colorToUpdate(runtimeId);
    final updatedColor = toUpdate.copyWith(customText: customText);
    updateColors(updatedColor);
  }

  void deleteColor(String runtimeId) {
    final currentColorSpecs = state.requireValue.colors;
    final updatedColorSpecs =
        currentColorSpecs.where((e) => e.runtimeId != runtimeId).toList();
    state = AsyncData(
      state.requireValue.copyWith(colors: updatedColorSpecs),
    );
  }

  void updateColorName(String runtimeId, ArtworkColor newColor) {
    final toUpdate = colorToUpdate(runtimeId);
    final updatedColor = toUpdate.copyWith(
      colorName: newColor.colorName,
      colorPalette: newColor.colorPalette,
      color: newColor.color,
    );
    updateColors(updatedColor);
  }

  void resetColorName(String runtimeId) {
    final toUpdate = colorToUpdate(runtimeId);
    final updatedColor = toUpdate.copyWith(
      colorName: '',
      colorPalette: null,
      color: null,
    );
    updateColors(updatedColor);
  }

  void updateColor(ArtworkColor artworkColor) {
    updateColors(artworkColor);
  }

  void updateColorRasterwinkel(
    String runtimeId,
    double? rasterwinkel,
  ) {
    final toUpdate = colorToUpdate(runtimeId);
    final updatedColor = toUpdate.copyWith(
      screenAngle: rasterwinkel,
    );
    updateColors(updatedColor);
  }

  void updateColorScreenLineature(
    String runtimeId,
    double? screenLineature,
  ) {
    final toUpdate = colorToUpdate(runtimeId);
    final updatedColor = toUpdate.copyWith(
      screenLineature: screenLineature,
    );
    updateColors(updatedColor);
  }

  void updateColorScreenAngle(
    String runtimeId,
    double? screenAngle,
  ) {
    final toUpdate = colorToUpdate(runtimeId);
    final updatedColor = toUpdate.copyWith(
      screenAngle: screenAngle,
    );
    updateColors(updatedColor);
  }

  void updateColorType(String runtimeId, ArtworkColorType? colorType) {
    final toUpdate = colorToUpdate(runtimeId);
    final updatedColor = toUpdate.copyWith(
      colorType: colorType,
    );
    updateColors(updatedColor);
  }

  /// En: Update Color Processing Layer
  void updateColorVerarbeitungsEbene(
    String runtimeId,
    ArtworkVerarbeitungsebeneType? verarbeitungsEbene,
  ) {
    final toUpdate = colorToUpdate(runtimeId);
    final updatedColor = toUpdate.copyWith(
      verarbeitungsEbene: verarbeitungsEbene,
    );
    updateColors(updatedColor);
  }

  void updateColorPrintProcess(
    String runtimeId,
    ArtworkColorPrintProcessType? printProcess,
  ) {
    final toUpdate = colorToUpdate(runtimeId);
    final updatedColor = toUpdate.copyWith(
      printProcess: printProcess,
    );
    updateColors(updatedColor);
  }

  void updateColorBoost(String runtimeId, double? boost) {
    final toUpdate = colorToUpdate(runtimeId);
    final updatedColor = toUpdate.copyWith(
      boost: boost,
    );
    updateColors(updatedColor);
  }

  void updateColorScreenPointForm(String runtimeId, String? screenPointForm) {
    final toUpdate = colorToUpdate(runtimeId);
    final updatedColor = toUpdate.copyWith(
      screenPointForm: screenPointForm,
    );
    updateColors(updatedColor);
  }

  void removeColorsWithoutColorPalette() {
    final currentColors = state.requireValue.colors;
    final updatedColors =
        currentColors.where((e) => e.colorPalette != null).toList();
    state = AsyncData(state.requireValue.copyWith(colors: updatedColors));
  }

  void updateColorSpecType(
    String runtimeId,
    ArtworkColorSpecType? colorSpecType,
  ) {
    final toUpdate = colorToUpdate(runtimeId);
    final updatedColor = toUpdate.copyWith(
      colorSpecType: colorSpecType,
    );
    updateColors(updatedColor);
  }

  void moveColorUp(String runtimeId) {
    final currentColors = state.requireValue.colors;
    final indexOfToMove =
        currentColors.indexWhere((e) => e.runtimeId == runtimeId);
    if (indexOfToMove <= 0) return; // Ensure index is valid for moving up
    final updatedColors = [
      ...currentColors.sublist(0, indexOfToMove - 1),
      currentColors[indexOfToMove],
      currentColors[indexOfToMove - 1],
      ...currentColors.sublist(indexOfToMove + 1),
    ];
    state = AsyncData(state.requireValue.copyWith(colors: updatedColors));
  }

  void moveColorDown(String runtimeId) {
    final currentColors = state.requireValue.colors;
    final indexOfToMove =
        currentColors.indexWhere((e) => e.runtimeId == runtimeId);
    if (indexOfToMove >= currentColors.length - 1) {
      return; // Ensure index is valid for moving down
    }
    final updatedColors = [
      ...currentColors.sublist(0, indexOfToMove),
      currentColors[indexOfToMove + 1],
      currentColors[indexOfToMove],
      ...currentColors.sublist(indexOfToMove + 2),
    ];
    state = AsyncData(state.requireValue.copyWith(colors: updatedColors));
  }

  // *
  // * Layers
  // *
  ArtworkLayer layerToUpdate(String runtimeId) {
    final currentLayers = state.requireValue.layers;
    return currentLayers.firstWhere(
      (e) => e.runtimeId == runtimeId,
    );
  }

  void moveLayerUp(String runtimeId) {
    final currentLayers = state.requireValue.layers;
    final indexOfToMove =
        currentLayers.indexWhere((e) => e.runtimeId == runtimeId);
    if (indexOfToMove <= 0) return; // Ensure index is valid for moving up
    final updatedLayers = [
      ...currentLayers.sublist(0, indexOfToMove - 1),
      currentLayers[indexOfToMove],
      currentLayers[indexOfToMove - 1],
      ...currentLayers.sublist(indexOfToMove + 1),
    ];
    state = AsyncData(state.requireValue.copyWith(layers: updatedLayers));
  }

  void moveLayerDown(String runtimeId) {
    final currentLayers = state.requireValue.layers;
    final indexOfToMove =
        currentLayers.indexWhere((e) => e.runtimeId == runtimeId);
    if (indexOfToMove >= currentLayers.length - 1) {
      return; // Ensure index is valid for moving down
    }
    final updatedLayers = [
      ...currentLayers.sublist(0, indexOfToMove),
      currentLayers[indexOfToMove + 1],
      currentLayers[indexOfToMove],
      ...currentLayers.sublist(indexOfToMove + 2),
    ];
    state = AsyncData(state.requireValue.copyWith(layers: updatedLayers));
  }

  void updateLayers(ArtworkLayer updatedLayer) {
    final currentLayers = state.requireValue.layers;
    final updatedLayers = currentLayers
        .map((e) => e.runtimeId == updatedLayer.runtimeId ? updatedLayer : e)
        .toList();
    state = AsyncData(state.requireValue.copyWith(layers: updatedLayers));
  }

  void addBlankLayer() {
    final inital = ArtworkLayer.initial();
    state = AsyncData(
      state.requireValue
          .copyWith(layers: [...state.requireValue.layers, inital]),
    );
  }

  void updateLayerName(String runtimeId, String layerName) {
    final toUpdate = layerToUpdate(runtimeId);
    final updatedLayer = toUpdate.copyWith(layerName: layerName);
    updateLayers(updatedLayer);
  }

  void updateLayerType(String runtimeId, ArtworkLayerType? layerType) {
    final toUpdate = layerToUpdate(runtimeId);
    final updatedLayer = toUpdate.copyWith(layerType: layerType);
    updateLayers(updatedLayer);
  }

  void updateLayerPrintable(String runtimeId, bool printable) {
    final toUpdate = layerToUpdate(runtimeId);
    final updatedLayer = toUpdate.copyWith(printable: printable);
    updateLayers(updatedLayer);
  }

  void updateLayerLocked(String runtimeId, bool locked) {
    final toUpdate = layerToUpdate(runtimeId);
    final updatedLayer = toUpdate.copyWith(locked: locked);
    updateLayers(updatedLayer);
  }

  // *
  // * Artwork Codes
  // *

  void addArtworkCode(ArtworkCodeType type) {
    final codes = state.requireValue.codes;
    var newCode = ArtworkCode.initial(
      type,
    );

    // Determine the correct code model based on the type
    switch (type) {
      case ArtworkCodeType.twoOf5:
        newCode = newCode.copyWith(
          code2of5: TwoOf5Code.initial(),
        );
      case ArtworkCodeType.aztec:
        newCode = newCode.copyWith(
          codeAztec: AztecCode.initial(),
        );
      case ArtworkCodeType.template:
        newCode = newCode.copyWith(
          codeTemplate: TemplateCode.initial(),
        );
    }

    state = AsyncData(
      state.requireValue.copyWith(
        codes: [...codes, newCode],
      ),
    );
  }

  void updateArtworkCode(ArtworkCode code) {
    final codes = state.requireValue.codes;
    final updatedCodes = codes.map((c) {
      if (c.runtimeId == code.runtimeId) {
        return code;
      }
      return c;
    }).toList();

    state = AsyncData(
      state.requireValue.copyWith(codes: updatedCodes),
    );
  }

  void deleteArtworkCode(String runtimeId) {
    final codes = state.requireValue.codes;
    final updatedCodes = codes.where((c) => c.runtimeId != runtimeId).toList();
    state = AsyncData(
      state.requireValue.copyWith(codes: updatedCodes),
    );
  }

  Artwork forSave() {
    removeColorsWithoutColorPalette();
    return state.requireValue;
  }
}

@riverpod
Future<List<ArtworkColor>> watchArtworkColors(
  Ref ref,
  int artworkId,
  String artworkStateSessionId,
) async {
  final currentColors = ref.watch(
    artworkStateProvider(
      artworkId,
      artworkStateSessionId,
    ).select((state) => state.requireValue.colors),
  );
  return currentColors;
}

@riverpod
Future<List<ArtworkColor>> fetchArtworkQuarantineColors(
  Ref ref,
  int artworkQuarantineId,
) async {
  final currentColors = await ref.watch(
    fetchArtworkQuarantineProvider(
      artworkQuarantineId,
    ).selectAsync((state) => state?.artworkData.colors),
  );
  return currentColors ?? [];
}

@riverpod
Future<List<ArtworkLayer>> watchArtworkLayers(
  Ref ref,
  int artworkId,
  String artworkStateSessionId,
) async {
  final currentLayers = ref.watch(
    artworkStateProvider(
      artworkId,
      artworkStateSessionId,
    ).select((state) => state.requireValue.layers),
  );
  return currentLayers;
}
