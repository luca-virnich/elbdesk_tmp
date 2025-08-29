import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'entity_assignment.freezed.dart';

@freezed
class EntityAssignment with _$EntityAssignment {
  const factory EntityAssignment({
    required int entityId,
    required String additionalData,
    required String tableType,
    DateTime? deadline,
  }) = _EntityAssignment;

  const EntityAssignment._();

  factory EntityAssignment.fromDTO(EntityAssignmentDTO dto) {
    return EntityAssignment(
      entityId: dto.entityId,
      additionalData: dto.additionalData ?? '',
      tableType: dto.tableType,
      deadline: dto.deadline?.toLocal(),
    );
  }
}
