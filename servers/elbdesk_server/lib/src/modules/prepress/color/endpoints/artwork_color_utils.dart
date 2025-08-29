import 'package:collection/collection.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/entity_log/entity_log_endpoint.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:serverpod/serverpod.dart';

class ArtworkColorUtils {
  const ArtworkColorUtils._();

  static const tableType = TableType.artworkColor;

  static ArtworkColorDTOInclude get includeAll => ArtworkColorDTO.include(
        colorPalette: PrepressColorPaletteDTO.include(),
      );

  static Expression<dynamic>? buildExpression(Filter? filter) {
    return buildFilterExpression<ArtworkColorDTOTable, ArtworkColorField>(
      table: ArtworkColorDTOTable(),
      filter: filter,
      enumFromString: (String fieldKey) =>
          ArtworkColorField.values.firstWhereOrNull((e) => e.name == fieldKey),
      getDbField: (table, field) => dbFieldFromEnum(field)(table),
    );
  }

  static Column<dynamic> Function(ArtworkColorDTOTable) orderBy(
    ArtworkColorField? sortByField,
  ) {
    if (sortByField == null) {
      return dbFieldFromEnum(ArtworkColorField.colorName);
    }
    return dbFieldFromEnum(sortByField);
  }

  static List<LogField<ArtworkColorDTO>> getLogFields() {
    return ArtworkColorField.values
        .map((field) {
          switch (field) {
            case ArtworkColorField.id:
              return LogField<ArtworkColorDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.id?.toString() ?? '',
              );
            case ArtworkColorField.colorName:
              return LogField<ArtworkColorDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.colorName,
              );
            case ArtworkColorField.shortName:
              return LogField<ArtworkColorDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.shortName,
              );
            case ArtworkColorField.color:
              return LogField<ArtworkColorDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.color,
              );
            case ArtworkColorField.colorPalette:
              return LogField<ArtworkColorDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.colorPalette?.paletteName ?? '',
              );
            case ArtworkColorField.customText:
              return LogField<ArtworkColorDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.customText ?? '',
              );
            // Skip metadata fields
            case ArtworkColorField.createdAt:
            case ArtworkColorField.createdBy:
            case ArtworkColorField.lastModifiedAt:
            case ArtworkColorField.lastModifiedBy:
            case ArtworkColorField.deletedAt:
            case ArtworkColorField.isDraft:
            case ArtworkColorField.l:
            case ArtworkColorField.a:
            case ArtworkColorField.b:
            case ArtworkColorField.colorSpecType:
            case ArtworkColorField.colorType:
            case ArtworkColorField.verarbeitungsEbene:
            case ArtworkColorField.printProcess:
            case ArtworkColorField.screenLineature:
            case ArtworkColorField.screenAngle:
            case ArtworkColorField.screenPointForm:
            case ArtworkColorField.boost:
            case ArtworkColorField.actions:
            case ArtworkColorField.move:
              return null;
          }
        })
        .whereType<LogField<ArtworkColorDTO>>()
        .toList();
  }

  static Column<dynamic> Function(ArtworkColorDTOTable) dbFieldFromEnum(
    ArtworkColorField sortFieldEnum,
  ) {
    switch (sortFieldEnum) {
      case ArtworkColorField.customText:
        return (ArtworkColorDTOTable t) => t.customText;
      case ArtworkColorField.id:
        return (ArtworkColorDTOTable t) => t.id;
      case ArtworkColorField.colorName:
        return (ArtworkColorDTOTable t) => t.colorName;
      case ArtworkColorField.shortName:
        return (ArtworkColorDTOTable t) => t.shortName;
      case ArtworkColorField.color:
        return (ArtworkColorDTOTable t) => t.color;
      case ArtworkColorField.colorPalette:
        return (ArtworkColorDTOTable t) => t.colorPaletteId;
      case ArtworkColorField.createdAt:
        return (ArtworkColorDTOTable t) => t.createdAt;
      case ArtworkColorField.createdBy:
        return (ArtworkColorDTOTable t) => t.createdById;
      case ArtworkColorField.lastModifiedAt:
        return (ArtworkColorDTOTable t) => t.lastModifiedAt;
      case ArtworkColorField.lastModifiedBy:
        return (ArtworkColorDTOTable t) => t.lastModifiedById;
      case ArtworkColorField.deletedAt:
        return (ArtworkColorDTOTable t) => t.deletedAt;
      case ArtworkColorField.isDraft:
        return (ArtworkColorDTOTable t) => t.isDraft;
      case ArtworkColorField.l:
        return (ArtworkColorDTOTable t) => t.l;
      case ArtworkColorField.a:
        return (ArtworkColorDTOTable t) => t.a;
      case ArtworkColorField.b:
        return (ArtworkColorDTOTable t) => t.b;
      case ArtworkColorField.colorSpecType:
        return (ArtworkColorDTOTable t) => t.colorSpecType;
      case ArtworkColorField.colorType:
        return (ArtworkColorDTOTable t) => t.colorType;
      case ArtworkColorField.verarbeitungsEbene:
        return (ArtworkColorDTOTable t) => t.verarbeitungsEbene;
      case ArtworkColorField.printProcess:
        return (ArtworkColorDTOTable t) => t.printProcess;
      case ArtworkColorField.screenLineature:
        return (ArtworkColorDTOTable t) => t.screenLineature;
      case ArtworkColorField.screenAngle:
        return (ArtworkColorDTOTable t) => t.screenAngle;
      case ArtworkColorField.screenPointForm:
        return (ArtworkColorDTOTable t) => t.screenPointForm;
      case ArtworkColorField.boost:
        return (ArtworkColorDTOTable t) => t.boost;
      case ArtworkColorField.actions:
        return (ArtworkColorDTOTable t) => t.id;
      case ArtworkColorField.move:
        return (ArtworkColorDTOTable t) => t.id;
    }
  }

  static ArtworkColorDTO initialDTO({
    required int userId,
    required String sessionId,
    required int colorPaletteId,
    required DateTime now,
  }) {
    return ArtworkColorDTO(
      colorName: '',
      shortName: '',
      color: 'FF000000',
      colorPaletteId: colorPaletteId,
      createdAt: now,
      isDraft: true,
      createdById: userId,
      editingSince: null,
      editingById: null,
      deletedAt: null,
      deletedById: null,
      lastModifiedAt: null,
      lastModifiedById: null,
      editingSession: sessionId,
      l: 0,
      a: 0,
      b: 0,
    );
  }
}
