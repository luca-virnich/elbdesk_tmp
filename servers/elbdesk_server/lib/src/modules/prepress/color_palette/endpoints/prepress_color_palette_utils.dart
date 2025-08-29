import 'package:collection/collection.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class PrepressColorPaletteUtils {
  const PrepressColorPaletteUtils._();

  static const tableType = TableType.prepressColorPalette;

  static PrepressColorPaletteDTOInclude get includeAll =>
      PrepressColorPaletteDTO.include(
        colors: ArtworkColorDTO.includeList(),
        customer: CustomerDTO.include(
          contact: ContactDTO.include(),
        ),
      );

  static Expression<dynamic>? buildExpression(Filter? filter) {
    return buildFilterExpression<PrepressColorPaletteDTOTable,
        PrepressColorPaletteField>(
      table: PrepressColorPaletteDTOTable(),
      filter: filter,
      enumFromString: (String fieldKey) => PrepressColorPaletteField.values
          .firstWhereOrNull((e) => e.name == fieldKey),
      getDbField: (table, field) => dbFieldFromEnum(field)(table),
    );
  }

  static Column<dynamic> Function(PrepressColorPaletteDTOTable) orderBy(
    PrepressColorPaletteField? sortField,
  ) {
    if (sortField == null) {
      return (PrepressColorPaletteDTOTable t) => t.paletteName;
    }
    return dbFieldFromEnum(sortField);
  }

  static PrepressColorPaletteDTO initialDTO({
    required int userId,
    required String sessionId,
    required int? customerId,
  }) {
    return PrepressColorPaletteDTO(
      paletteName: '',
      description: '',
      colors: [],
      customerId: customerId,
      createdAt: DateTime.now(),
      isDraft: true,
      createdById: userId,
      editingSince: null,
      editingById: null,
      deletedAt: null,
      deletedById: null,
      lastModifiedAt: null,
      lastModifiedById: null,
      editingSession: sessionId,
    );
  }

  static Column<dynamic> Function(PrepressColorPaletteDTOTable) dbFieldFromEnum(
    PrepressColorPaletteField sortFieldEnum,
  ) {
    switch (sortFieldEnum) {
      case PrepressColorPaletteField.id:
        return (PrepressColorPaletteDTOTable t) => t.id;
      case PrepressColorPaletteField.paletteName:
        return (PrepressColorPaletteDTOTable t) => t.paletteName;
      case PrepressColorPaletteField.description:
        return (PrepressColorPaletteDTOTable t) => t.description;
      case PrepressColorPaletteField.createdAt:
        return (PrepressColorPaletteDTOTable t) => t.createdAt;
      case PrepressColorPaletteField.createdBy:
        return (PrepressColorPaletteDTOTable t) => t.createdById;
      case PrepressColorPaletteField.lastModifiedAt:
        return (PrepressColorPaletteDTOTable t) => t.lastModifiedAt;
      case PrepressColorPaletteField.lastModifiedBy:
        return (PrepressColorPaletteDTOTable t) => t.lastModifiedById;
      case PrepressColorPaletteField.customer:
        return (PrepressColorPaletteDTOTable t) => t.customer.contact.fullName;
      case PrepressColorPaletteField.customerId:
        return (PrepressColorPaletteDTOTable t) => t.customerId;
      case PrepressColorPaletteField.deletedAt:
        return (PrepressColorPaletteDTOTable t) => t.deletedAt;
      case PrepressColorPaletteField.isDraft:
        return (PrepressColorPaletteDTOTable t) => t.isDraft;
    }
  }
}
