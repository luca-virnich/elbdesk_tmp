import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/elbdesk_crm.dart';
import 'package:elbdesk_prepress/elbdesk_prepress.dart';
import 'package:elbdesk_prepress/src/artwork_quarantine/models/artwork_color_specification.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:path/path.dart' as path;

part 'artwork_quarantine.freezed.dart';
part 'artwork_quarantine.g.dart';

@freezed
class ArtworkQuarantine with _$ArtworkQuarantine, HasMetaData {
  const factory ArtworkQuarantine({
    required ArtworkQuarantineGeneral general,
    required ArtworkQuarantineAnalysisData? analysisData,
    required ArtworkQuarantineArtworkData artworkData,
    required int? customerId,
    required Customer? customer,
    required int? groupId,
    required ArtworkQuarantineGroup? group,
    required DataMeta meta,
  }) = _ArtworkQuarantine;

  factory ArtworkQuarantine.fromJson(Map<String, Object?> json) =>
      _$ArtworkQuarantineFromJson(json);

  /// Creates an initial ArtworkQuarantine with default values
  factory ArtworkQuarantine.initial(
    String filePath,
    ArtworkQuarantineGroup group,
  ) {
    final uuid = const Uuid().v4();

    final general = ArtworkQuarantineGeneral(
      description: path.basenameWithoutExtension(filePath),
      quarantineUuid: uuid,
      keywords: null,
      artworkId: null,
      type: group.artworkType,
      status: ArtworkQuarantineGroupStatus.open,
      productType: group.productType,
      printProcessType: group.printProcessType,
    );

    const analysisData = ArtworkQuarantineAnalysisData(
      analysisDate: null,
      note: '',
      fileName: null,
      colorSpecifications: [],
    );

    final artworkData = ArtworkQuarantineArtworkData(
      width: group.width,
      height: group.height,
      cornerRadius: group.cornerRadius,
      originalFilePath: filePath,
      colors: [],
    );

    return ArtworkQuarantine(
      general: general,
      analysisData: analysisData,
      artworkData: artworkData,
      customer: group.customer,
      customerId: group.customerId,
      meta: DataMeta.initial(),
      groupId: group.meta.id,
      group: group,
    );
  }

  /// From DTO with structured subclasses
  factory ArtworkQuarantine.fromDTO(ArtworkQuarantineDTO dto) {
    final meta = DataMeta.fromDTO(dto);

    final general = ArtworkQuarantineGeneral(
      description: dto.description,
      quarantineUuid: dto.quarantineUuid,
      keywords: dto.keywords,
      artworkId: dto.artworkId,
      type: Parser.enumFromString(ArtworkType.values, dto.type),
      status: Parser.enumFromString(
            ArtworkQuarantineGroupStatus.values,
            dto.status,
          ) ??
          ArtworkQuarantineGroupStatus.open,
      productType: Parser.enumFromString(
        ProductType.values,
        dto.productType,
      ),
      printProcessType: Parser.enumFromString(
        ArtworkPrintProcessType.values,
        dto.printProcessType,
      ),
    );

    final artworkData = ArtworkQuarantineArtworkData(
      originalFilePath: dto.originalFilePath,
      width: dto.width,
      height: dto.height,
      cornerRadius: dto.cornerRadius,
      colors: dto.colors?.map(ArtworkColor.fromDTO).toList() ?? [],
    );

    return ArtworkQuarantine(
      general: general,
      analysisData: dto.analysisData != null
          ? ArtworkQuarantineAnalysisData.fromDTO(dto.analysisData!)
          : null,
      artworkData: artworkData,
      customer: dto.customer != null ? Customer.fromDTO(dto.customer!) : null,
      customerId: dto.customerId,
      meta: meta,
      groupId: dto.groupId,
      group:
          dto.group != null ? ArtworkQuarantineGroup.fromDTO(dto.group!) : null,
    );
  }

  /// Constructor
  const ArtworkQuarantine._();

  String dimensions(bool showUnits) {
    return '${artworkData.width} x ${artworkData.height}'
        '${showUnits ? ' mm' : ''}';
  }

  String readableCornerRadius(
    ElbPrepressLocalizations ppL10n,
  ) {
    return '${ppL10n.artwork_corner_radius}: '
        '${artworkData.cornerRadius}';
  }

  /// Gets the filename for this artwork quarantine
  /// Returns the filename from XML data if available, otherwise extracts from
  /// file path
  String? get fileName {
    // Try to get filename from analysis data first
    if (analysisData?.fileName != null) {
      return analysisData?.fileName;
    }

    // Fallback to extracting filename from file path
    final filePath = artworkData.originalFilePath;
    if (filePath != null) {
      return path.basename(filePath);
    }

    return null;
  }

  bool get hasTrimmedAssets {
    return (general.status == ArtworkQuarantineGroupStatus.done ||
            general.status == ArtworkQuarantineGroupStatus.inUse) &&
        analysisData != null;
  }

  /// Get pdf file path
  // String? get artworkPdfFilePath {
  //   // If artwork is not analyzed, we only have access to the original file path
  //   if (general.status == ArtworkQuarantineGroupStatus.open ||
  //       general.status == ArtworkQuarantineGroupStatus.todo) {
  //     return analysisData?.fileName;
  //   }

  //   return null;
  // }

  /// Get trimmed PDF filename for this artwork quarantine
  String trimmedPdfPath(String quarantineBaseFolderPath) {
    // Return production filename with UUID
    return path.join(
      quarantineBaseFolderPath,
      groupId.toString(),
      '${general.quarantineUuid}_trimmed.pdf',
    );
  }

  /// Get thumbnail filename for this artwork quarantine
  String trimmedThumbnailPath(String quarantineBaseFolderPath) {
    // if (useMockData) {
    //   // Return debug filename for testing
    //   return 'coe_thumbnail.png';
    // }

    // Return production filename with UUID
    return path.join(
      quarantineBaseFolderPath,
      groupId.toString(),
      '${general.quarantineUuid}_trimmed.jpg',
    );
  }

  /// Get result XML filename for this artwork quarantine

  ArtworkQuarantineDTO toDTO() {
    return ArtworkQuarantineDTO(
      isDraft: meta.isDraft,
      // General fields
      quarantineUuid: general.quarantineUuid,
      originalFilePath: artworkData.originalFilePath,
      keywords: general.keywords,
      type: general.type?.name,
      artworkId: general.artworkId,
      description: general.description,
      status: general.status.name,
      productType: general.productType?.name,
      printProcessType: general.printProcessType?.name,
      analysisData: analysisData?.toDTO(),
      id: meta.id,

      // Artwork data fields
      width: artworkData.width,
      height: artworkData.height,
      cornerRadius: artworkData.cornerRadius,

      // Other fields
      customerId: customerId,
      colors: artworkData.colors.map((e) => e.toDTO()).toList(),
      createdAt: meta.createdAt!,
      createdById: meta.createdById,
      deletedAt: meta.deletedAt,
      deletedById: meta.deletedById,
      groupId: groupId!,
    );
  }
}

/// General information about the artwork quarantine
@freezed
class ArtworkQuarantineGeneral with _$ArtworkQuarantineGeneral {
  const factory ArtworkQuarantineGeneral({
    required String description,
    required String quarantineUuid,
    required String? keywords,
    required int? artworkId,
    required ArtworkType? type,
    required ArtworkQuarantineGroupStatus status,
    required ProductType? productType,
    required ArtworkPrintProcessType? printProcessType,
  }) = _ArtworkQuarantineGeneral;

  const ArtworkQuarantineGeneral._();

  factory ArtworkQuarantineGeneral.fromJson(Map<String, Object?> json) =>
      _$ArtworkQuarantineGeneralFromJson(json);
}

/// XML and analysis data from the artwork
@freezed
class ArtworkQuarantineAnalysisData with _$ArtworkQuarantineAnalysisData {
  const factory ArtworkQuarantineAnalysisData({
    required String? fileName,
    required DateTime? analysisDate,
    required String note,
    required List<ArtworkColorSpecification>? colorSpecifications,
  }) = _ArtworkQuarantineAnalysisData;

  factory ArtworkQuarantineAnalysisData.fromJson(Map<String, Object?> json) =>
      _$ArtworkQuarantineAnalysisDataFromJson(json);

  const ArtworkQuarantineAnalysisData._();

  factory ArtworkQuarantineAnalysisData.fromDTO(
    ArtworkQuarantineAnalysisDataDTO dto,
  ) {
    return ArtworkQuarantineAnalysisData(
      fileName: dto.fileName,
      analysisDate: dto.analysisDate,
      note: dto.note,
      colorSpecifications: dto.colorSpecifications
          .map(ArtworkColorSpecification.fromDTO)
          .toList(),
    );
  }

  ArtworkQuarantineAnalysisDataDTO toDTO() {
    return ArtworkQuarantineAnalysisDataDTO(
      fileName: fileName,
      analysisDate: analysisDate,
      note: note,
      colorSpecifications:
          colorSpecifications?.map((e) => e.toDTO()).toList() ?? [],
    );
  }
}

/// Artwork file and dimension data
@freezed
class ArtworkQuarantineArtworkData with _$ArtworkQuarantineArtworkData {
  const factory ArtworkQuarantineArtworkData({
    required double? width,
    required double? height,
    required double? cornerRadius,
    required String? originalFilePath,
    required List<ArtworkColor> colors,
  }) = _ArtworkQuarantineArtworkData;

  const ArtworkQuarantineArtworkData._();

  factory ArtworkQuarantineArtworkData.fromJson(Map<String, Object?> json) =>
      _$ArtworkQuarantineArtworkDataFromJson(json);
}

class ArtworkQuarantineAdditionalData implements AdditionalEntityData {
  const ArtworkQuarantineAdditionalData({
    required this.customerId,
    required this.artworkQuarantineId,
    required this.description,
  });

  factory ArtworkQuarantineAdditionalData.fromJson(Map<String, dynamic> json) {
    return ArtworkQuarantineAdditionalData(
      customerId: json['customerId'] as int?,
      artworkQuarantineId: json['artworkQuarantineId'] as int,
      description: json['description'] as String,
    );
  }

  final int? customerId;
  final int artworkQuarantineId;
  final String description;

  @override
  Map<String, dynamic> toJson() {
    return {
      'customerId': customerId,
      'artworkQuarantineId': artworkQuarantineId,
      'description': description,
    };
  }
}
