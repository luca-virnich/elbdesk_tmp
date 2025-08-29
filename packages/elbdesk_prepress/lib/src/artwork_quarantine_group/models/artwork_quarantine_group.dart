import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/elbdesk_crm.dart';
import 'package:elbdesk_prepress/elbdesk_prepress.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'artwork_quarantine_group.freezed.dart';
part 'artwork_quarantine_group.g.dart';

@freezed
class ArtworkQuarantineGroup with _$ArtworkQuarantineGroup, HasMetaData {
  const factory ArtworkQuarantineGroup({
    required int? customerId,
    required Customer? customer,
    required ArtworkType? artworkType,
    required ArtworkQuarantineGroupStatus status,
    required ArtworkQuarantineGroupType? type,
    required ProductType? productType,
    required ArtworkPrintProcessType? printProcessType,
    required int? selectedProductSeriesId,
    required double? width,
    required double? height,
    required double? cornerRadius,
    required String? outputPath,
    required String description,
    required List<SystemFile>? attachments,
    required List<ArtworkQuarantine>? artworkQuarantines,
    required LightUser? assignedUser,
    required DateTime? sendToAeAt,
    required int? sendToAeBy,
    required DataMeta meta,
  }) = _ArtworkQuarantineGroup;

  /// Constructor
  const ArtworkQuarantineGroup._();

  factory ArtworkQuarantineGroup.fromJson(Map<String, Object?> json) =>
      _$ArtworkQuarantineGroupFromJson(json);

  /// From DTO
  factory ArtworkQuarantineGroup.fromDTO(ArtworkQuarantineGroupDTO dto) {
    final meta = DataMeta.fromDTO(dto);
    return ArtworkQuarantineGroup(
      customer: dto.customer != null ? Customer.fromDTO(dto.customer!) : null,
      artworkQuarantines:
          dto.artworkQuarantines?.map(ArtworkQuarantine.fromDTO).toList(),
      customerId: dto.customerId,
      artworkType: Parser.enumFromString(
        ArtworkType.values,
        dto.artworkType,
      ),
      status: Parser.enumFromString(
            ArtworkQuarantineGroupStatus.values,
            dto.status,
          ) ??
          ArtworkQuarantineGroupStatus.open,
      type: Parser.enumFromString(
        ArtworkQuarantineGroupType.values,
        dto.type,
      ),
      productType: Parser.enumFromString(
        ProductType.values,
        dto.productType,
      ),
      printProcessType: Parser.enumFromString(
        ArtworkPrintProcessType.values,
        dto.printProcessType,
      ),
      width: dto.width,
      height: dto.height,
      cornerRadius: dto.cornerRadius,
      description: dto.description,
      assignedUser: dto.assignedUser != null
          ? LightUser.fromDTO(dto.assignedUser!)
          : null,
      selectedProductSeriesId: dto.selectedProductSeriesId,
      outputPath: dto.outputPath,
      attachments: dto.attachments?.map(SystemFile.fromDTO).toList(),
      sendToAeAt: dto.sendToAeAt?.toLocal(),
      sendToAeBy: dto.sendToAeBy,
      meta: meta,
    );
  }

  /// To DTO
  ArtworkQuarantineGroupDTO toDTO() {
    return ArtworkQuarantineGroupDTO(
      id: meta.id,
      isDraft: meta.isDraft,
      printProcessType: printProcessType?.name,
      artworkType: artworkType?.name,
      width: width,
      height: height,
      cornerRadius: cornerRadius,
      description: description,
      assignedUserId: assignedUser?.lightUserId,
      artworkQuarantines:
          artworkQuarantines?.map((artwork) => artwork.toDTO()).toList(),
      customerId: customerId,
      status: status.name,
      type: type?.name,
      productType: productType?.name,
      selectedProductSeriesId: selectedProductSeriesId,
      outputPath: outputPath,
      attachments: attachments?.map((file) => file.toDTO()).toList(),
      createdAt: meta.createdAt!,
      createdById: meta.createdById,
      sendToAeAt: sendToAeAt,
      sendToAeBy: sendToAeBy,
    );
  }
}

class ArtworkQuarantineGroupAdditionalData implements AdditionalEntityData {
  const ArtworkQuarantineGroupAdditionalData({
    required this.customerId,
    required this.artworkQuarantineGroupId,
    required this.description,
  });

  factory ArtworkQuarantineGroupAdditionalData.fromJson(
    Map<String, dynamic> json,
  ) {
    return ArtworkQuarantineGroupAdditionalData(
      customerId: json['customerId'] as int?,
      artworkQuarantineGroupId: json['artworkQuarantineGroupId'] as int,
      description: json['description'] as String? ?? '',
    );
  }

  final int? customerId;
  final int artworkQuarantineGroupId;
  final String description;

  @override
  Map<String, dynamic> toJson() {
    return {
      'customerId': customerId,
      'artworkQuarantineGroupId': artworkQuarantineGroupId,
      'description': description,
    };
  }
}
