import 'dart:convert';
import 'dart:ui';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/prepress_color_palette/models/prepress_color_palette.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'artwork_color.freezed.dart';
part 'artwork_color.g.dart';

/// ArtworkColor
///
/// The ArtworkColor model is our client model for the ArtworkColorDTO
///
@freezed
class ArtworkColor with _$ArtworkColor, HasMetaData {
  /// Color constructor
  const factory ArtworkColor({
    required String colorName,
    required String shortName,
    required double l,
    required double a,
    required double b,
    @ColorConverter() required Color? color,
    required PrepressColorPalette? colorPalette,
    required ArtworkColorType? colorType,
    required ArtworkColorSpecType? colorSpecType,
    required ArtworkVerarbeitungsebeneType? verarbeitungsEbene,
    required ArtworkColorPrintProcessType? printProcess,
    required String? screenPointForm,
    required double? screenLineature,
    required double? screenAngle,
    required double? boost,
    required String? customText,
    required DataMeta meta,
    required String runtimeId,
  }) = _ArtworkColor;

  const ArtworkColor._();

  factory ArtworkColor.fromJson(Map<String, Object?> json) =>
      _$ArtworkColorFromJson(json);

  /// Color from DTO
  factory ArtworkColor.fromDTO(ArtworkColorDTO dto) {
    final dataMeta = DataMeta.fromDTO(dto);

    return ArtworkColor(
      customText: dto.customText,
      colorName: dto.colorName,
      runtimeId: const Uuid().v4(),
      shortName: dto.shortName,
      l: dto.l,
      a: dto.a,
      b: dto.b,
      colorType: Parser.enumFromString(
        ArtworkColorType.values,
        dto.colorType,
      ),
      colorSpecType: Parser.enumFromString(
        ArtworkColorSpecType.values,
        dto.colorSpecType,
      ),
      verarbeitungsEbene: Parser.enumFromString(
        ArtworkVerarbeitungsebeneType.values,
        dto.verarbeitungsEbene,
      ),
      printProcess: Parser.enumFromString(
        ArtworkColorPrintProcessType.values,
        dto.printProcess,
      ),
      screenPointForm: dto.screenPointForm,
      screenLineature: dto.screenLineature,
      screenAngle: dto.screenAngle,
      boost: dto.boost,
      color: dto.color?.radixDbToColor,
      colorPalette: dto.colorPalette != null
          ? PrepressColorPalette.fromDTO(dto.colorPalette!)
          : null,
      meta: dataMeta,
    );
  }

  factory ArtworkColor.initial1() {
    return ArtworkColor(
      customText: null,
      colorSpecType: null,
      verarbeitungsEbene: null,
      printProcess: null,
      screenPointForm: null,
      screenLineature: null,
      screenAngle: null,
      boost: null,
      colorType: null,
      runtimeId: const Uuid().v4(),
      colorName: '',
      shortName: '',
      l: 0,
      a: 0,
      b: 0,
      color: null,
      colorPalette: null,
      meta: DataMeta.initial(),
    );
  }
  factory ArtworkColor.copy(ArtworkColor color) {
    return color.copyWith(
      runtimeId: const Uuid().v4(),
      colorName: '',
      shortName: '',
      l: 0,
      a: 0,
      b: 0,
      color: null,
      colorPalette: null,
    );
  }

  factory ArtworkColor.initialArtworkTemplate() {
    return ArtworkColor(
      customText: null,
      colorSpecType: null,
      colorType: null,
      verarbeitungsEbene: null,
      printProcess: null,
      screenPointForm: null,
      screenLineature: null,
      screenAngle: null,
      boost: null,
      runtimeId: const Uuid().v4(),
      colorName: '',
      shortName: '',
      l: 0,
      a: 0,
      b: 0,
      color: null,
      colorPalette: null,
      meta: DataMeta(
        id: 0,
        createdAt: DateTime.now(),
        lastModifiedAt: null,
        lastModifiedById: null,
        isDraft: false,
        editingSessionId: null,
        createdById: null,
        editingSince: null,
        editingById: null,
        deletedById: null,
        deletedAt: null,
      ),
    );
  }
  factory ArtworkColor.fromLogString(String logString) {
    final map = jsonDecode(logString) as Map<String, dynamic>;
    return ArtworkColor(
      colorName: map['colorName'] as String,
      shortName: map['shortName'] as String,
      l: map['l'] as double,
      a: map['a'] as double,
      b: map['b'] as double,
      color: null,
      colorType: null,
      customText: null,
      colorSpecType: null,
      verarbeitungsEbene: null,
      printProcess: null,
      screenPointForm: null,
      screenLineature: null,
      screenAngle: null,
      boost: null,
      colorPalette: null,
      meta: DataMeta.initial(),
      runtimeId: const Uuid().v4(),
    );
  }

  /// Color to DTO
  ArtworkColorDTO toDTO() {
    return ArtworkColorDTO(
      id: meta.id,
      colorName: colorName,
      shortName: shortName,
      color: color!.toRadixDbString,
      colorSpecType: colorSpecType?.name,
      verarbeitungsEbene: verarbeitungsEbene?.name,
      printProcess: printProcess?.name,
      screenPointForm: screenPointForm,
      screenLineature: screenLineature,
      screenAngle: screenAngle,
      boost: boost,
      l: l,
      a: a,
      b: b,
      colorPalette: colorPalette?.toDTO(),
      customText: customText,
      colorPaletteId: colorPalette?.meta.id,
      createdAt: meta.createdAt!,
      isDraft: meta.isDraft,
      lastModifiedAt: meta.lastModifiedAt,
      colorType: colorType?.name,
    );
  }
}

/// A JsonConverter for handling Flutter's Color class in JSON serialization
class ColorConverter implements JsonConverter<Color?, String?> {
  const ColorConverter();

  @override
  Color? fromJson(String? json) {
    if (json == null) return null;
    return Color(int.parse(json.substring(1), radix: 16));
  }

  @override
  String? toJson(Color? color) {
    if (color == null) return null;
    return '#${color.value.toRadixString(16).padLeft(8, '0')}';
  }
}

/// Extension for Color to provide string conversion
