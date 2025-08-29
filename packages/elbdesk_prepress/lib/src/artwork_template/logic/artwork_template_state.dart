import 'dart:async';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/artwork/models/artwork_layer.dart';
import 'package:elbdesk_prepress/src/artwork_color/models/artwork_color.dart';
import 'package:elbdesk_prepress/src/artwork_template/logic/artwork_template_provider.dart';
import 'package:elbdesk_prepress/src/artwork_template/models/artwork_template.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_core/project_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'artwork_template_state.g.dart';

/// Contact State
///
/// This state is used to manage and update the contact details
@riverpod
class ArtworkTemplateState extends _$ArtworkTemplateState
    implements EntityState<ArtworkTemplate> {
  ///@nodoc
  ArtworkTemplateState() {
    _initializeStateManager();
  }
  late final EntityStateManager<ArtworkTemplate> _stateManager;

  void _initializeStateManager() {
    _stateManager = EntityStateManager<ArtworkTemplate>(
      setLoadingState: () => state = const AsyncLoading(),
      setDataState: (ArtworkTemplate artworkTemplate) =>
          state = AsyncData(artworkTemplate),
      setErrorState: (Object error, StackTrace stackTrace) =>
          state = AsyncError(error, stackTrace),
      fetchAndLockFn: () => ref
          .read(artworkTemplateRepositoryProvider)
          .fetchAndLock(entityId, sessionId),
      releaseFn: () => ref
          .read(artworkTemplateRepositoryProvider)
          .release(entityId, sessionId),
      fetchByIdFn: () =>
          ref.read(artworkTemplateRepositoryProvider).fetchById(entityId),
      updateWithReleaseFn: () =>
          ref.read(artworkTemplateRepositoryProvider).update(
                entity: state.requireValue,
                release: true,
                sessionId: sessionId,
              ),
    );
  }

  @override
  Future<ArtworkTemplate> build(int entityId, String sessionId) async {
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

  void updateDescription(String description) {
    state = AsyncData(state.requireValue.copyWith(description: description));
  }

  void updateTrappingNormal(double trappNormal) {
    state = AsyncData(
      state.requireValue.copyWith(
        trapping:
            state.requireValue.trapping.copyWith(trappNormal: trappNormal),
      ),
    );
  }

  void updateTrappingBlack(double trappBlack) {
    state = AsyncData(
      state.requireValue.copyWith(
        trapping: state.requireValue.trapping.copyWith(trappBlack: trappBlack),
      ),
    );
  }

  void updateTrappingBilder(double trappBilder) {
    state = AsyncData(
      state.requireValue.copyWith(
        trapping:
            state.requireValue.trapping.copyWith(trappBilder: trappBilder),
      ),
    );
  }

  void updateTrappingSonderfarben(double trappSonderfarben) {
    state = AsyncData(
      state.requireValue.copyWith(
        trapping: state.requireValue.trapping
            .copyWith(trappSonderfarben: trappSonderfarben),
      ),
    );
  }

  void updateTrappingRueckzug(double trappRueckzug) {
    state = AsyncData(
      state.requireValue.copyWith(
        trapping:
            state.requireValue.trapping.copyWith(trappRueckzug: trappRueckzug),
      ),
    );
  }

  void updateAnschnitt(double anschnitt) {
    state = AsyncData(state.requireValue.copyWith(anschnitt: anschnitt));
  }

  void updateColorCustomText(String runtimeId, String? customText) {
    final toUpdate = colorToUpdate(runtimeId);
    final updatedColor = toUpdate.copyWith(customText: customText);
    updateColors(updatedColor);
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
          newColor,
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

  void deleteColor(String runtimeId) {
    final currentColorSpecs = state.requireValue.colors;
    final updatedColorSpecs =
        currentColorSpecs.where((e) => e.runtimeId != runtimeId).toList();
    state = AsyncData(
      state.requireValue.copyWith(colors: updatedColorSpecs),
    );
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

  ArtworkTemplate forSave() {
    removeColorsWithoutColorPalette();
    return state.requireValue;
  }
}

@riverpod
Future<List<ArtworkColor>> watchArtworkTemplateColors(
  Ref ref,
  int artworkTemplateId,
  String artworkTemplateStateSessionId,
) async {
  final currentColors = ref.watch(
    artworkTemplateStateProvider(
      artworkTemplateId,
      artworkTemplateStateSessionId,
    ).select((state) => state.requireValue.colors),
  );
  return currentColors;
}

@riverpod
Future<List<ArtworkLayer>> watchArtworkTemplateLayers(
  Ref ref,
  int artworkTemplateId,
  String artworkTemplateStateSessionId,
) async {
  final currentLayers = ref.watch(
    artworkTemplateStateProvider(
      artworkTemplateId,
      artworkTemplateStateSessionId,
    ).select((state) => state.requireValue.layers),
  );
  return currentLayers;
}
