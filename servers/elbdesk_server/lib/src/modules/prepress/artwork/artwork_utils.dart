import 'package:collection/collection.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/entity_note/entity_note_additional_data_handler.dart';
import 'package:elbdesk_server/src/modules/core/entity_note/entity_note_notification_handler.dart';
import 'package:serverpod/serverpod.dart';

class ArtworkUtils {
  const ArtworkUtils._();

  static const tableType = TableType.artwork;

  static Expression<dynamic>? buildExpression(Filter? filter) {
    return buildFilterExpression<ArtworkDTOTable, ArtworkField>(
      table: ArtworkDTOTable(),
      filter: filter,
      enumFromString: (String fieldKey) =>
          ArtworkField.values.firstWhereOrNull((e) => e.name == fieldKey),
      getDbField: (table, field) => dbFieldFromEnum(field)(table),
    );
  }

  static ArtworkDTOInclude get includeAll => ArtworkDTO.include(
        customer: CustomerDTO.include(
          contact: ContactDTO.include(),
        ),
        salesOrder: SalesOrderDTO.include(),
        artworkMaster: ArtworkMasterDTO.include(),
        product: ProductDTO.include(),
      );

  static String getArtworkCustomId({
    required ArtworkDTO artwork,
    required ProductDTO product,
  }) {
    late final String layerIdString;
    if (artwork.layerId == 0) {
      layerIdString = IdPrefixes.bearer;
    } else {
      layerIdString = '${IdPrefixes.layer}${artwork.layerId}';
    }

    final fullArtworkId =
        '${artwork.product!.productId}-${artwork.product!.productIndex}_'
        '${artwork.product!.shortReadableProductType}_'
        '${artwork.shortReadablePrintProcessType}_${layerIdString}_'
        '${artwork.shortReadableArtworkType}';

    return fullArtworkId;
  }

  static Column<dynamic> Function(ArtworkDTOTable) dbFieldFromEnum(
    ArtworkField sortFieldEnum,
  ) {
    switch (sortFieldEnum) {
      case ArtworkField.reference:
        return (ArtworkDTOTable t) => t.reference;
      case ArtworkField.artworkType:
        return (ArtworkDTOTable t) => t.artworkType;
      case ArtworkField.printProcessType:
        return (ArtworkDTOTable t) => t.printProcessType;
      case ArtworkField.customerId:
        return (ArtworkDTOTable t) => t.customerId;
      case ArtworkField.actions:
        return (ArtworkDTOTable t) => t.id;
      case ArtworkField.description:
        return (ArtworkDTOTable t) => t.description;
      case ArtworkField.customer:
        return (ArtworkDTOTable t) => t.customer.contact.fullName;

      case ArtworkField.salesOrderId:
        return (ArtworkDTOTable t) => t.salesOrderId;

      case ArtworkField.width:
        return (ArtworkDTOTable t) => t.width;
      case ArtworkField.height:
        return (ArtworkDTOTable t) => t.height;
      case ArtworkField.colors:
        return (ArtworkDTOTable t) => t.colors;
      case ArtworkField.id:
        return (ArtworkDTOTable t) => t.id;
      case ArtworkField.createdAt:
        return (ArtworkDTOTable t) => t.createdAt;
      case ArtworkField.createdBy:
        return (ArtworkDTOTable t) => t.createdById;

      case ArtworkField.lastModifiedAt:
        return (ArtworkDTOTable t) => t.lastModifiedAt;
      case ArtworkField.lastModifiedBy:
        return (ArtworkDTOTable t) => t.lastModifiedById;
      case ArtworkField.trappNormal:
        return (ArtworkDTOTable t) => t.trapping;
      case ArtworkField.trappBlack:
        return (ArtworkDTOTable t) => t.trapping;
      case ArtworkField.trappBilder:
        return (ArtworkDTOTable t) => t.trapping;
      case ArtworkField.trappSonderfarben:
        return (ArtworkDTOTable t) => t.trapping;
      case ArtworkField.trappRueckzug:
        return (ArtworkDTOTable t) => t.trapping;

      case ArtworkField.anschnitt:
        return (ArtworkDTOTable t) => t.anschnitt;
      case ArtworkField.layers:
        return (ArtworkDTOTable t) => t.layers;
      case ArtworkField.deletedAt:
        return (ArtworkDTOTable t) => t.deletedAt;
      case ArtworkField.isDraft:
        return (ArtworkDTOTable t) => t.isDraft;

      case ArtworkField.layerId:
        return (ArtworkDTOTable t) => t.layerId;
      case ArtworkField.codes:
        return (ArtworkDTOTable t) => t.codes;
      case ArtworkField.version:
        return (ArtworkDTOTable t) => t.version;
      case ArtworkField.abzug:
        return (ArtworkDTOTable t) => t.abzug;
      case ArtworkField.cornerRadius:
        return (ArtworkDTOTable t) => t.cornerRadius;
      case ArtworkField.dieCutterType:
        return (ArtworkDTOTable t) => t.dieCutterType;
    }
  }
}
