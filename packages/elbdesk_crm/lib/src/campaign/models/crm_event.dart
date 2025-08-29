import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/elbdesk_crm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'crm_event.freezed.dart';
part 'crm_event.g.dart';

/// CrmEvent
///
/// This is the app side CrmEvent model. It is used to store event information
/// for campaigns during runtime. The CrmEventDTO is fetched from the server and
/// converted to a CrmEvent object.
///
/// To parse the CrmEventDTO to and from a CrmEvent object, the fromDTO and
/// toDTO methods are used.
///
@freezed
class CrmEvent with _$CrmEvent, HasMetaData {
  const factory CrmEvent({
    required DataMeta meta,
    required String name,
    required String description,
    required DateTime startDate,
    required List<Contact> contacts,
    required CrmEventStatus status,
    DateTime? endDate,
    DateTime? executionDate,
  }) = _CrmEvent;

  const CrmEvent._();

  factory CrmEvent.fromJson(Map<String, Object?> json) =>
      _$CrmEventFromJson(json);

  factory CrmEvent.initial() => CrmEvent(
        name: '',
        description: '',
        startDate: DateTime.now(),
        contacts: [],
        status: CrmEventStatus.scheduled,
        meta: DataMeta.initial(),
      );

  factory CrmEvent.fromDTO(CrmEventDTO dto) {
    final dataMeta = DataMeta.fromDTO(dto);

    return CrmEvent(
      name: dto.name,
      description: dto.description,
      startDate: dto.startDate.toLocal(),
      endDate: dto.endDate?.toLocal(),
      executionDate: dto.executionDate?.toLocal(),
      contacts:
          dto.contacts?.map((jt) => Contact.fromDTO(jt.contact!)).toList() ??
              [],
      status: Parser.enumFromString(
            CrmEventStatus.values,
            dto.status,
          ) ??
          CrmEventStatus.scheduled,
      meta: dataMeta,
    );
  }

  CrmEventDTO toDTO() => CrmEventDTO(
        id: meta.id,
        name: name,
        description: description,
        startDate: startDate,
        endDate: endDate,
        executionDate: executionDate,
        contacts: contacts
            .map(
              (c) => CrmEventContactJT(
                crmEventId: meta.id!,
                contactId: c.meta.id!,
              ),
            )
            .toList(),
        status: status.name,
        isDraft: meta.isDraft,
        lastModifiedAt: meta.lastModifiedAt,
        createdAt: meta.createdAt ?? DateTime.now(),
      );
}
