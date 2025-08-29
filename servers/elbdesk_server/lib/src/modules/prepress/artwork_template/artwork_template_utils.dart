import 'package:collection/collection.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:serverpod/serverpod.dart';

class ArtworkTemplateUtils {
  const ArtworkTemplateUtils._();

  static const tableType = TableType.artworkTemplate;

  static ArtworkTemplateDTOInclude get includeAll => ArtworkTemplateDTO.include(
        customer: CustomerDTO.include(
          contact: ContactDTO.include(),
        ),
        artworkTemplatePreSelection: ArtworkTemplatePreSelectionDTO.include(),
        artworkTemplateSelection: ArtworkTemplateSelectionDTO.include(),
      );

  static Expression<dynamic>? buildExpression(Filter? filter) {
    return buildFilterExpression<ArtworkTemplateDTOTable, ArtworkTemplateField>(
      table: ArtworkTemplateDTOTable(),
      filter: filter,
      enumFromString: (String fieldKey) => ArtworkTemplateField.values
          .firstWhereOrNull((e) => e.name == fieldKey),
      getDbField: (table, field) => dbFieldFromEnum(field)(table),
    );
  }

  static Column<dynamic> Function(ArtworkTemplateDTOTable) orderBy(
    ArtworkTemplateField? sortByField,
  ) {
    if (sortByField == null) {
      return dbFieldFromEnum(ArtworkTemplateField.description);
    }
    return dbFieldFromEnum(sortByField);
  }

  static ArtworkTemplateDTO getInitialDTO({
    required int userId,
    required String sessionId,
    required int? customerId,
    required int preSelectionId,
    required int selectionId,
    required DateTime now,
  }) {
    return ArtworkTemplateDTO(
      description: '',
      artworkTemplateSelectionId: selectionId,
      artworkTemplatePreSelectionId: preSelectionId,
      trapping: TrappingDTO(
        trappNormal: 0,
        trappBlack: 0,
        trappBilder: 0,
        trappSonderfarben: 0,
        trappRueckzug: 0,
      ),
      layers: [
        for (var i = 0; i < 4; i++)
          ArtworkLayerDTO(
            layerType: null,
            layerName: '',
            printable: true,
            locked: false,
          ),
      ],
      anschnitt: 0,
      colors: [
        for (var i = 0; i < 4; i++)
          ArtworkColorDTO(
            id: 0,
            colorName: '',
            shortName: '',
            l: 0,
            a: 0,
            b: 0,
            color: null,
            createdAt: now,
            isDraft: false,
            colorPalette: null,
            colorSpecType: null,
            colorType: null,
            verarbeitungsEbene: null,
            printProcess: null,
            screenPointForm: i == 0 ? null : null,
            screenLineature: i == 0 ? null : null,
            screenAngle: i == 0 ? null : null,
            boost: i == 0 ? null : null,
          ),
      ],
      createdAt: DateTime.now(),
      customerId: customerId,
      isDraft: true,
      createdById: userId,
      editingSince: null,
      editingById: null,
      deletedAt: null,
      deletedById: null,
      lastModifiedAt: null,
      lastModifiedById: null,
      editingSession: null,
    );
  }

  static Column<dynamic> Function(ArtworkTemplateDTOTable) dbFieldFromEnum(
    ArtworkTemplateField sortFieldEnum,
  ) {
    switch (sortFieldEnum) {
      case ArtworkTemplateField.description:
        return (ArtworkTemplateDTOTable t) => t.description;
      case ArtworkTemplateField.customer:
        return (ArtworkTemplateDTOTable t) => t.customerId;
      case ArtworkTemplateField.templateType:
        return (ArtworkTemplateDTOTable t) => t.customerId;
      case ArtworkTemplateField.id:
        return (ArtworkTemplateDTOTable t) => t.id;
      case ArtworkTemplateField.createdAt:
        return (ArtworkTemplateDTOTable t) => t.createdAt;
      case ArtworkTemplateField.createdBy:
        return (ArtworkTemplateDTOTable t) => t.createdById;
      case ArtworkTemplateField.lastModifiedAt:
        return (ArtworkTemplateDTOTable t) => t.lastModifiedAt;
      case ArtworkTemplateField.lastModifiedBy:
        return (ArtworkTemplateDTOTable t) => t.lastModifiedById;
      case ArtworkTemplateField.deletedAt:
        return (ArtworkTemplateDTOTable t) => t.deletedAt;
      case ArtworkTemplateField.isDraft:
        return (ArtworkTemplateDTOTable t) => t.isDraft;
      case ArtworkTemplateField.trappNormal:
        return (ArtworkTemplateDTOTable t) => t.trapping;
      case ArtworkTemplateField.trappBlack:
        return (ArtworkTemplateDTOTable t) => t.trapping;
      case ArtworkTemplateField.trappBilder:
        return (ArtworkTemplateDTOTable t) => t.trapping;
      case ArtworkTemplateField.trappSonderfarben:
        return (ArtworkTemplateDTOTable t) => t.trapping;
      case ArtworkTemplateField.trappRueckzug:
        return (ArtworkTemplateDTOTable t) => t.trapping;
      case ArtworkTemplateField.anschnitt:
        return (ArtworkTemplateDTOTable t) => t.anschnitt;
      case ArtworkTemplateField.layers:
        return (ArtworkTemplateDTOTable t) => t.layers;
      case ArtworkTemplateField.artworkTemplateSelection:
        return (ArtworkTemplateDTOTable t) => t.artworkTemplateSelectionId;
      case ArtworkTemplateField.artworkTemplatePreSelection:
        return (ArtworkTemplateDTOTable t) => t.artworkTemplatePreSelectionId;
    }
  }
}
