import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/entity_note/entity_note_notification_handler.dart';
import 'package:serverpod/serverpod.dart';

class EntityNoteAdditionalDataHandler {
  const EntityNoteAdditionalDataHandler._();

  static Future<({String label, String additionalData})> getAdditionalData(
    Session session,
    EntityNoteDTO note,
  ) async {
    final tableType = TableType.values.firstWhereOrNull(
      (e) => e.name == note.tableType,
    );
    if (tableType == null) {
      return (label: note.tableType, additionalData: '{}');
    }
    return switch (tableType) {
      TableType.contact => await contactLabel(session, note.entityId),
      TableType.salesOrder =>
        await salesOrderLabelAndData(session, note.entityId),
      TableType.companyEmployee =>
        await companyEmployeeLabelAndData(session, note.entityId),
      TableType.customer => await customerLabelAndData(session, note.entityId),
      TableType.artworkMaster =>
        await artworkMasterLabelAndData(session, note.entityId, note.hint),
      TableType.soiPrepareArtwork =>
        await soiPrepareArtworkLabelAndData(session, note.entityId),
      TableType.soiConsulting =>
        await soiConsultingLabelAndData(session, note.entityId),
      TableType.soiRequestArtworkApproval =>
        await soiRequestArtworkApprovalLabelAndData(session, note.entityId),
      TableType.soiEinzelformaufbau =>
        await soiEinzelformaufbauLabelAndData(session, note.entityId),
      TableType.productMaster =>
        await productMasterLabelAndData(session, note.entityId, note.hint),
      TableType.artworkQuarantineGroup =>
        await artworkQuarantineGroupLabelAndData(session, note.entityId),
      _ => (label: note.tableType, additionalData: '{}'),
    };
  }

  /// Indiviual Label and Additional Data Handlers
  ///

  static Future<({String label, String additionalData})> contactLabel(
    Session session,
    int id,
  ) async {
    final contact = await ContactDTO.db.findById(session, id);
    final contactType = contact!.type;
    final additionalData = {
      'contactType': contactType,
    };
    final asJsonString = jsonEncode(additionalData);
    final contactName = contact.fullName;
    return (
      label: contactName,
      additionalData: asJsonString,
    );
  }

  static Future<({String label, String additionalData})> salesOrderLabelAndData(
    Session session,
    int id,
  ) async {
    final salesOrder = await SalesOrderDTO.db.findById(
      session,
      id,
      include: SalesOrderDTO.include(
        customer: CustomerDTO.include(
          contact: ContactDTO.include(),
        ),
      ),
    );
    final additionalData = {
      SalesOrderAdditionalDataField.customerName.name:
          salesOrder!.customer!.contact!.fullName,
      SalesOrderAdditionalDataField.customId.name: salesOrder.fullSalesOrderId,
    };
    final asJsonString = jsonEncode(additionalData);

    return (
      label: salesOrder.fullSalesOrderId,
      additionalData: asJsonString,
    );
  }

  static Future<({String label, String additionalData})>
      companyEmployeeLabelAndData(
    Session session,
    int id,
  ) async {
    final companyEmployee = await CompanyEmployeeDTO.db.findById(
      session,
      id,
      include: CompanyEmployeeDTO.include(
        company: ContactDTO.include(),
        employee: ContactDTO.include(),
      ),
    );
    final additionalData = {
      'companyName': companyEmployee?.company?.fullName,
      'employeeName': companyEmployee?.employee?.fullName,
    };
    final asJsonString = jsonEncode(additionalData);

    return (
      label: companyEmployee?.employee?.fullName ?? '',
      additionalData: asJsonString,
    );
  }

  static Future<({String label, String additionalData})> customerLabelAndData(
    Session session,
    int id,
  ) async {
    final customer = await CustomerDTO.db.findById(
      session,
      id,
      include: CustomerDTO.include(
        contact: ContactDTO.include(),
      ),
    );
    final additionalData = {
      'customerName': customer?.contact?.fullName,
    };
    final asJsonString = jsonEncode(additionalData);

    return (
      label: customer?.contact?.fullName ?? '',
      additionalData: asJsonString,
    );
  }

  static Future<({String label, String additionalData})>
      soiPrepareArtworkLabelAndData(
    Session session,
    int id,
  ) async {
    final soiPrepareArtwork = await SoiPrepareArtworkDTO.db.findById(
      session,
      id,
      include: SoiPrepareArtworkDTO.include(
        artwork: ArtworkDTO.include(
          customer: CustomerDTO.include(),
          product: ProductDTO.include(),
        ),
      ),
    );

    final artwork = soiPrepareArtwork?.artwork;

    // Generate the full artwork ID
    late final String? fullArtworkId;
    if (artwork?.product != null) {
      late final String layerIdString;
      if (artwork?.layerId == 0) {
        layerIdString = IdPrefixes.bearer;
      } else {
        layerIdString = '${IdPrefixes.layer}${artwork?.layerId}';
      }

      fullArtworkId =
          '${artwork?.product!.productId}-${artwork?.product!.productIndex}_'
          '${artwork?.product!.shortReadableProductType}_'
          '${artwork?.shortReadablePrintProcessType}_${layerIdString}_'
          '${artwork?.shortReadableArtworkType}';
    } else {
      fullArtworkId = null;
    }

    final additionalData = {
      'customerId': artwork?.customer?.id,
      'artworkCustomId': fullArtworkId,
    };
    final asJsonString = jsonEncode(additionalData);

    return (
      // label is applied in the frontend to have l10n support
      label: '',
      additionalData: asJsonString,
    );
  }

  static Future<({String label, String additionalData})>
      soiConsultingLabelAndData(
    Session session,
    int id,
  ) async {
    final soiConsulting = await SoiConsultingDTO.db.findById(
      session,
      id,
      include: SoiConsultingDTO.include(
        salesOrderItem: SalesOrderItemDTO.include(
          salesOrder: SalesOrderDTO.include(),
        ),
      ),
    );

    final fullSalesOrderId =
        soiConsulting?.salesOrderItem?.salesOrder?.fullSalesOrderId;

    final additionalData = {
      'customerId': soiConsulting?.salesOrderItem?.salesOrder?.customerId,
      'salesOrderId': soiConsulting?.salesOrderItem?.salesOrderId,
      'fullSalesOrderId': fullSalesOrderId,
    };
    final asJsonString = jsonEncode(additionalData);

    return (
      // label is applied in the frontend to have l10n support
      label: '',
      additionalData: asJsonString,
    );
  }

  static Future<({String label, String additionalData})>
      soiRequestArtworkApprovalLabelAndData(
    Session session,
    int id,
  ) async {
    final soiRequestArtworkApproval =
        await SoiRequestArtworkApprovalDTO.db.findById(
      session,
      id,
      include: SoiRequestArtworkApprovalDTO.include(
        artwork: ArtworkDTO.include(
          customer: CustomerDTO.include(),
          product: ProductDTO.include(),
        ),
      ),
    );

    final artwork = soiRequestArtworkApproval?.artwork;

    // Generate the full artwork ID
    late final String? fullArtworkId;
    if (artwork?.product != null) {
      late final String layerIdString;
      if (artwork?.layerId == 0) {
        layerIdString = IdPrefixes.bearer;
      } else {
        layerIdString = '${IdPrefixes.layer}${artwork?.layerId}';
      }

      fullArtworkId =
          '${artwork?.product!.productId}-${artwork?.product!.productIndex}_'
          '${artwork?.product!.shortReadableProductType}_'
          '${artwork?.shortReadablePrintProcessType}_${layerIdString}_'
          '${artwork?.shortReadableArtworkType}';
    } else {
      fullArtworkId = null;
    }

    final additionalData = {
      'customerId': artwork?.customer?.id,
      'artworkCustomId': fullArtworkId,
    };
    final asJsonString = jsonEncode(additionalData);

    return (
      // label is applied in the frontend to have l10n support
      label: '',
      additionalData: asJsonString,
    );
  }

  static Future<({String label, String additionalData})>
      soiEinzelformaufbauLabelAndData(
    Session session,
    int id,
  ) async {
    final soiEinzelformaufbau = await SoiEinzelformaufbauDTO.db.findById(
      session,
      id,
      include: SoiEinzelformaufbauDTO.include(
        artwork: ArtworkDTO.include(
          customer: CustomerDTO.include(),
          product: ProductDTO.include(),
        ),
      ),
    );

    final artwork = soiEinzelformaufbau?.artwork;

    // Generate the full artwork ID
    late final String? fullArtworkId;
    if (artwork?.product != null) {
      late final String layerIdString;
      if (artwork?.layerId == 0) {
        layerIdString = IdPrefixes.bearer;
      } else {
        layerIdString = '${IdPrefixes.layer}${artwork?.layerId}';
      }

      fullArtworkId =
          '${artwork?.product!.productId}-${artwork?.product!.productIndex}_'
          '${artwork?.product!.shortReadableProductType}_'
          '${artwork?.shortReadablePrintProcessType}_${layerIdString}_'
          '${artwork?.shortReadableArtworkType}';
    } else {
      fullArtworkId = null;
    }

    final additionalData = {
      'customerId': artwork?.customer?.id,
      'artworkCustomId': fullArtworkId,
    };
    final asJsonString = jsonEncode(additionalData);

    return (
      // label is applied in the frontend to have l10n support
      label: '',
      additionalData: asJsonString,
    );
  }

  static Future<({String label, String additionalData})>
      artworkMasterLabelAndData(
    Session session,
    int id,
    String? hint,
  ) async {
    session.log('hint: $hint');
    final artworkMaster = await ArtworkMasterDTO.db.findById(
      session,
      id,
      include: ArtworkMasterDTO.include(
        customer: CustomerDTO.include(
          contact: ContactDTO.include(),
        ),
        product: ProductMasterDTO.include(),
      ),
    );

    final salesOrderIdFromString = int.tryParse(hint!.split('-').last);

    final salesOrder = await SalesOrderDTO.db.findFirstRow(
      session,
      include: SalesOrderDTO.include(),
      where: (t) => t.customId.equals(salesOrderIdFromString),
    );

    final artworkFromSalesOrder = await ArtworkDTO.db.findFirstRow(
      session,
      include: ArtworkDTO.include(
        salesOrder: SalesOrderDTO.include(),
      ),
      where: (t) =>
          t.artworkMasterId.equals(id) & t.salesOrderId.equals(salesOrder!.id),
    );

    // Generate the full artwork ID
    late final String? fullArtworkId;
    if (artworkMaster?.product != null) {
      late final String layerIdString;
      if (artworkMaster?.layerId == 0) {
        layerIdString = IdPrefixes.bearer;
      } else {
        layerIdString = '${IdPrefixes.layer}${artworkMaster?.layerId}';
      }

      fullArtworkId =
          '${artworkMaster?.product!.productId}-${artworkMaster?.product!.productIndex}_'
          '${artworkMaster?.product!.shortReadableProductType}_'
          '${artworkMaster?.shortReadablePrintProcessType}_${layerIdString}_'
          '${artworkMaster?.shortReadableArtworkType}';
    } else {
      fullArtworkId = null;
    }

    final additionalData = {
      'customerId': artworkMaster?.customer?.id,
      'customSalesOrderId': hint,
      'artworkId': artworkFromSalesOrder!.id,
    };
    final asJsonString = jsonEncode(additionalData);

    return (
      label: fullArtworkId ?? artworkMaster?.description ?? '',
      additionalData: asJsonString,
    );
  }

  static Future<({String label, String additionalData})>
      productMasterLabelAndData(
    Session session,
    int id,
    String? hint,
  ) async {
    final productMaster = await ProductMasterDTO.db.findById(
      session,
      id,
      include: ProductMasterDTO.include(),
    );

    final salesOrderIdFromString = int.tryParse(hint!.split('-').last);
    final salesOrder = await SalesOrderDTO.db.findFirstRow(
      session,
      include: SalesOrderDTO.include(),
      where: (t) => t.customId.equals(salesOrderIdFromString),
    );

    final productFromSalesOrder = await ProductDTO.db.findFirstRow(
      session,
      include: ProductDTO.include(
        salesOrder: SalesOrderDTO.include(),
      ),
      where: (t) => t.salesOrderId.equals(salesOrder!.id),
    );
    final salesOrderId = productFromSalesOrder!.salesOrder!.id;

    final additionalData = {
      'salesOrderId': salesOrderId,
      'customSalesOrderId': hint,
      'productId': productFromSalesOrder.id,
    };
    final asJsonString = jsonEncode(additionalData);

    return (
      label: productMaster?.fullProductId ?? productMaster?.description ?? '',
      additionalData: asJsonString,
    );
  }

  // Artwork Quarantine Group
  static Future<({String label, String additionalData})>
      artworkQuarantineGroupLabelAndData(
    Session session,
    int id,
  ) async {
    final artworkQuarantineGroup =
        await ArtworkQuarantineGroupDTO.db.findById(session, id);

    final additionalData = {
      'artworkQuarantineGroupId': artworkQuarantineGroup?.id,
    };
    final asJsonString = jsonEncode(additionalData);

    return (label: 'Dateneingang $id', additionalData: asJsonString);
  }
}

extension SalesOrderDTOExt on SalesOrderDTO {
  String get fullSalesOrderId {
    return 'VA-$customId';
  }
}

extension ProductTypeMasterDTOExt on ProductMasterDTO {
  /// Short Readable Product Type
  ///
  /// Should probably not be translated, these will be part of the filename
  String get shortReadableProductType {
    final asEnum = CoreUtils.enumFromString(
      ProductType.values,
      productType,
    );
    if (asEnum == null) {
      return 'UNKOWN';
    }
    return switch (asEnum) {
      ProductType.vorderseite => 'VS',
      ProductType.rueckseite => 'RS',
      ProductType.banderole => 'BA',
      ProductType.deckel => 'DE',
      ProductType.boden => 'BO',
      ProductType.kit => 'KIT',
      ProductType.vorlageDigitaldruck => 'VD',
      ProductType.multilayer => 'ML',
    };
  }

  String get productId {
    return '${IdPrefixes.product}-$serienId';
  }

  String get productIndex {
    return serienIndex.toString().padLeft(3, '0');
  }

  String get fullProductId {
    return '$productId-${productIndex}_$shortReadableProductType';
  }
}

extension ProductTypeDTOExt on ProductDTO {
  /// Short Readable Product Type
  ///
  /// Should probably not be translated, these will be part of the filename
  String get shortReadableProductType {
    final asEnum = CoreUtils.enumFromString(
      ProductType.values,
      productType,
    );
    if (asEnum == null) {
      return 'UNKOWN';
    }
    return switch (asEnum) {
      ProductType.vorderseite => 'VS',
      ProductType.rueckseite => 'RS',
      ProductType.banderole => 'BA',
      ProductType.deckel => 'DE',
      ProductType.boden => 'BO',
      ProductType.kit => 'KIT',
      ProductType.vorlageDigitaldruck => 'VD',
      ProductType.multilayer => 'ML',
    };
  }

  String get productId {
    return '${IdPrefixes.product}-$serienId';
  }

  String get productIndex {
    return serienIndex.toString().padLeft(3, '0');
  }

  String get fullProductId {
    return '$productId-${productIndex}_$shortReadableProductType';
  }
}

extension ArtworkMasterDTOExt on ArtworkMasterDTO {
  /// Short Readable Print Process Type
  ///
  /// Should probably not be translated, these will be part of the filename
  String get shortReadablePrintProcessType {
    final printProcessTypeEnum = CoreUtils.enumFromString(
      ArtworkPrintProcessType.values,
      printProcessType,
    );
    if (printProcessTypeEnum == null) {
      return 'UNKOWN';
    }

    return switch (printProcessTypeEnum) {
      ArtworkPrintProcessType.flexodruck => 'FL',
      ArtworkPrintProcessType.digitaldruck => 'DI',
      ArtworkPrintProcessType.buchdruck => 'BD',
      ArtworkPrintProcessType.offsetdruck => 'OF',
      ArtworkPrintProcessType.siebdruck => 'SI',
    };
  }

  /// Short Readable Artwork Type
  ///
  /// Should probably not be translated, these will be part of the filename
  String get shortReadableArtworkType {
    final asEnum = CoreUtils.enumFromString(
      ArtworkType.values,
      artworkType,
    );
    if (asEnum == null) {
      return 'UNKOWN';
    }
    return switch (asEnum) {
      ArtworkType.front => 'F',
      ArtworkType.back => 'B',
    };
  }
}

extension ArtworkDTOExt on ArtworkDTO {
  /// Short Readable Print Process Type
  ///
  /// Should probably not be translated, these will be part of the filename
  String get shortReadablePrintProcessType {
    final printProcessTypeEnum = CoreUtils.enumFromString(
      ArtworkPrintProcessType.values,
      printProcessType,
    );
    if (printProcessTypeEnum == null) {
      return 'UNKOWN';
    }

    return switch (printProcessTypeEnum) {
      ArtworkPrintProcessType.flexodruck => 'FL',
      ArtworkPrintProcessType.digitaldruck => 'DI',
      ArtworkPrintProcessType.buchdruck => 'BD',
      ArtworkPrintProcessType.offsetdruck => 'OF',
      ArtworkPrintProcessType.siebdruck => 'SI',
    };
  }

  /// Short Readable Artwork Type
  ///
  /// Should probably not be translated, these will be part of the filename
  String get shortReadableArtworkType {
    final asEnum = CoreUtils.enumFromString(
      ArtworkType.values,
      artworkType,
    );
    if (asEnum == null) {
      return 'UNKOWN';
    }
    return switch (asEnum) {
      ArtworkType.front => 'F',
      ArtworkType.back => 'B',
    };
  }
}
