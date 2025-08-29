import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/elbdesk_crm.dart';
import 'package:elbdesk_prepress/src/drucklayout/models/drucklayout_pre_selection.dart';
import 'package:elbdesk_prepress/src/drucklayout/models/drucklayout_selection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'drucklayout.freezed.dart';
part 'drucklayout.g.dart';

/// Drucklayout
///
/// This is the frontend Drucklayout model
///
@freezed
class Drucklayout with _$Drucklayout, HasMetaData {
  const factory Drucklayout({
    required String title,
    required DataMeta meta,
    required DrucklayoutPreSelection drucklayoutPreSelection,
    required DrucklayoutSelection drucklayoutSelection,
    required int? preSelectionId,
    required int? selectionId,
    String? description,
    int? customerId,
    Customer? customer,
    int? id,
  }) = _Drucklayout;

  // FromDTO
  factory Drucklayout.fromDTO(DrucklayoutDTO dto) {
    final dataMeta = DataMeta.fromDTO(dto);

    return Drucklayout(
      id: dto.id,
      title: dto.title,
      description: dto.description,
      customerId: dto.customerId,
      customer: dto.customer != null ? Customer.fromDTO(dto.customer!) : null,
      meta: dataMeta,
      drucklayoutPreSelection:
          DrucklayoutPreSelection.fromDTO(dto.drucklayoutPreSelection!),
      drucklayoutSelection:
          DrucklayoutSelection.fromDTO(dto.drucklayoutSelection!),
      preSelectionId: dto.drucklayoutPreSelectionId,
      selectionId: dto.drucklayoutSelectionId,
    );
  }

  const Drucklayout._();

  factory Drucklayout.fromJson(Map<String, Object?> json) =>
      _$DrucklayoutFromJson(json);

  String get formattedId => 'DL-$id';

  DrucklayoutDTO toDTO() {
    return DrucklayoutDTO(
      isDraft: meta.isDraft,
      id: id,
      customerId: customerId,
      title: title,
      description: description,
      createdAt: meta.createdAt!,
      createdById: meta.createdById,
      drucklayoutPreSelectionId: drucklayoutPreSelection.id!,
      drucklayoutSelectionId: drucklayoutSelection.id!,
    );
  }
}

class DrucklayoutAdditionalData implements AdditionalEntityData {
  const DrucklayoutAdditionalData({
    required this.title,
    required this.description,
    required this.customerId,
    required this.salesOrderId,
    required this.preSelectionId,
    required this.selectionId,
  });

  factory DrucklayoutAdditionalData.fromJson(Map<String, dynamic> json) {
    return DrucklayoutAdditionalData(
      title: json['title'] as String,
      description: json['description'] as String?,
      customerId: json['customerId'] as int?,
      salesOrderId: json['salesOrderId'] as int?,
      preSelectionId: json['preSelectionId'] as int?,
      selectionId: json['selectionId'] as int?,
    );
  }

  final String title;
  final String? description;
  final int? customerId;
  final int? salesOrderId;
  final int? preSelectionId;
  final int? selectionId;
  @override
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'customerId': customerId,
      'salesOrderId': salesOrderId,
      'preSelectionId': preSelectionId,
      'selectionId': selectionId,
    };
  }
}
