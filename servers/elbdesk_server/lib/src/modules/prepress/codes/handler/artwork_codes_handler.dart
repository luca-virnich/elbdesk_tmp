// import 'package:elbdesk_server/src/generated/protocol.dart';
// import 'package:serverpod/serverpod.dart';

// /// Entity type that has associated codes
// enum CodeParentType {
//   artwork,
//   artworkMaster,
// }

// /// Handles operations related to artwork codes
// class ArtworkCodesHandler {
//   /// Private constructor for singleton pattern
//   ArtworkCodesHandler._();

//   /// Singleton instance
//   static final ArtworkCodesHandler instance = ArtworkCodesHandler._();

//   /// Handle artwork codes for any parent entity
//   Future<void> handleCodes<T>({
//     required Session session,
//     required T entity,
//     required int parentId,
//     required CodeParentType parentType,
//     required List<ArtworkCodeDTO>? codes,
//   }) async {
//     // Skip if no codes
//     if (codes == null) return;

//     // 1. Delete codes that are no longer present
//     await _deleteCodes(
//       session,
//       parentId: parentId,
//       parentType: parentType,
//       incomingCodes: codes,
//     );

//     // 2. Create or update codes
//     if (codes.isNotEmpty) {
//       await _createOrUpdateCodes(
//         session,
//         parentId: parentId,
//         parentType: parentType,
//         codes: codes,
//       );
//     }
//   }

//   /// Delete codes that exist in DB but are not in the incoming codes
//   Future<void> _deleteCodes(
//     Session session, {
//     required int parentId,
//     required CodeParentType parentType,
//     required List<ArtworkCodeDTO> incomingCodes,
//   }) async {
//     // Fetch existing codes
//     final existingCodes = await ArtworkCodeDTO.db.find(
//       session,
//       where: parentType == CodeParentType.artwork
//           ? (t) => t.artworkId.equals(parentId)
//           : (t) => t.artworkMasterId.equals(parentId),
//     );

//     // Create a set of incoming code IDs for efficient lookup
//     final incomingCodeIds =
//         incomingCodes.where((c) => c.id != null).map((c) => c.id!).toSet();

//     // Delete codes that are not in the incoming entity
//     for (final existingCode in existingCodes) {
//       if (!incomingCodeIds.contains(existingCode.id)) {
//         // Delete the code's subtype based on its type
//         switch (ArtworkCodeType.fromJson(existingCode.artworkCodeType)) {
//           case ArtworkCodeType.of5:
//             await OFCodeDTO.db.deleteWhere(
//               session,
//               where: (t) => t.artworkCodeId.equals(existingCode.id),
//             );
//           case ArtworkCodeType.aztec:
//             await AztecCodeDTO.db.deleteWhere(
//               session,
//               where: (t) => t.artworkCodeId.equals(existingCode.id),
//             );
//           case ArtworkCodeType.template:
//             await TemplateCodeDTO.db.deleteWhere(
//               session,
//               where: (t) => t.artworkCodeId.equals(existingCode.id),
//             );
//         }

//         // Delete the artwork code itself
//         await ArtworkCodeDTO.db.deleteRow(session, existingCode);
//       }
//     }
//   }

//   /// Create new codes or update existing ones
//   Future<void> _createOrUpdateCodes(
//     Session session, {
//     required int parentId,
//     required CodeParentType parentType,
//     required List<ArtworkCodeDTO> codes,
//   }) async {
//     for (final code in codes) {
//       // Ensure code has a UUID
//       if (code.codeUuid.isEmpty) {
//         code.codeUuid = const Uuid().v4();
//       }

//       // Set the appropriate parent ID based on type
//       if (parentType == CodeParentType.artwork) {
//         code
//           ..artworkId = parentId
//           ..artworkMasterId = null;
//       } else {
//         code
//           ..artworkMasterId = parentId
//           ..artworkId = null;
//       }

//       if (code.id == null) {
//         // Insert new ArtworkCode
//         final createdCode = await ArtworkCodeDTO.db.insertRow(
//           session,
//           code,
//         );

//         // Insert the subtype based on code type
//         final codeType = ArtworkCodeType.fromJson(code.artworkCodeType);
//         switch (codeType) {
//           case ArtworkCodeType.of5:
//             if (code.code2of5 != null) {
//               await OFCodeDTO.db.insertRow(
//                 session,
//                 code.code2of5!.copyWith(artworkCodeId: createdCode.id),
//               );
//             }
//           case ArtworkCodeType.aztec:
//             if (code.codeAztec != null) {
//               await AztecCodeDTO.db.insertRow(
//                 session,
//                 code.codeAztec!.copyWith(artworkCodeId: createdCode.id),
//               );
//             }
//           case ArtworkCodeType.template:
//             if (code.codeTemplate != null) {
//               await TemplateCodeDTO.db.insertRow(
//                 session,
//                 code.codeTemplate!.copyWith(artworkCodeId: createdCode.id),
//               );
//             }
//         }
//       } else {
//         // Update existing ArtworkCode
//         await ArtworkCodeDTO.db.updateRow(session, code);

//         // Update the subtype based on code type
//         final codeType = ArtworkCodeType.fromJson(code.artworkCodeType);
//         switch (codeType) {
//           case ArtworkCodeType.of5:
//             if (code.code2of5 != null) {
//               await OFCodeDTO.db.updateRow(session, code.code2of5!);
//             }
//           case ArtworkCodeType.aztec:
//             if (code.codeAztec != null) {
//               await AztecCodeDTO.db.updateRow(session, code.codeAztec!);
//             }
//           case ArtworkCodeType.template:
//             if (code.codeTemplate != null) {
//               await TemplateCodeDTO.db.updateRow(session, code.codeTemplate!);
//             }
//         }
//       }
//     }
//   }

//   /// Helper method for artwork entities
//   Future<void> handleArtworkCodes(
//     Session session,
//     ArtworkDTO entity,
//     ArtworkDTO updated,
//   ) async {
//     await handleCodes(
//       session: session,
//       entity: entity,
//       parentId: updated.id!,
//       parentType: CodeParentType.artwork,
//       codes: entity.codes,
//     );
//   }

//   /// Helper method for artwork master entities
//   Future<void> handleArtworkMasterCodes(
//     Session session,
//     ArtworkMasterDTO entity,
//     ArtworkMasterDTO updated,
//   ) async {
//     await handleCodes(
//       session: session,
//       entity: entity,
//       parentId: updated.id!,
//       parentType: CodeParentType.artworkMaster,
//       codes: entity.codes,
//     );
//   }

//   /// Copy codes from artwork master to new artwork
//   ///
//   /// Creates new code entries for each code in the master artwork,
//   /// pointing to the newly created artwork instead of the master.
//   Future<void> copyCodesFromMaster(
//     Session session,
//     ArtworkMasterDTO artworkMasterDTO,
//     int newArtworkId,
//     int userId,
//     DateTime now,
//   ) async {
//     // Skip if no codes in master
//     if (artworkMasterDTO.codes == null || artworkMasterDTO.codes!.isEmpty) {
//       return;
//     }

//     // Copy each code from the master
//     for (final masterCode in artworkMasterDTO.codes!) {
//       // Create base artwork code, preserving the UUID for tracking
//       final newCode = ArtworkCodeDTO(
//         value: masterCode.value,
//         description: masterCode.description,
//         artworkId: newArtworkId,
//         artworkMasterId: null,
//         artworkCodeType: masterCode.artworkCodeType,
//         codeUuid: masterCode.codeUuid, // Preserve UUID across copies
//         createdAt: now,
//         createdById: userId,
//         isDraft: false,
//       );

//       // Insert the new artwork code
//       final createdCode = await ArtworkCodeDTO.db.insertRow(session, newCode);

//       // Handle specific code type using switch for compile-time checks
//       switch (ArtworkCodeType.fromJson(masterCode.artworkCodeType)) {
//         case ArtworkCodeType.of5:
//           if (masterCode.code2of5 != null) {
//             await OFCodeDTO.db.insertRow(
//               session,
//               OFCodeDTO(
//                 artworkCodeId: createdCode.id!,
//                 barWidthReduction: masterCode.code2of5!.barWidthReduction,
//                 deviceCompensation: masterCode.code2of5!.deviceCompensation,
//                 narrowBarWidth: masterCode.code2of5!.narrowBarWidth,
//                 aspectRatio: masterCode.code2of5!.aspectRatio,
//               ),
//             );
//           }

//         case ArtworkCodeType.aztec:
//           if (masterCode.codeAztec != null) {
//             await AztecCodeDTO.db.insertRow(
//               session,
//               AztecCodeDTO(
//                 artworkCodeId: createdCode.id!,
//                 symbolSize: masterCode.codeAztec!.symbolSize,
//                 errorCorrection: masterCode.codeAztec!.errorCorrection,
//                 deviceCompensation: masterCode.codeAztec!.deviceCompensation,
//                 cellSize: masterCode.codeAztec!.cellSize,
//               ),
//             );
//           }

//         case ArtworkCodeType.template:
//           if (masterCode.codeTemplate != null) {
//             await TemplateCodeDTO.db.insertRow(
//               session,
//               TemplateCodeDTO(
//                 artworkCodeId: createdCode.id!,
//                 codeSize: masterCode.codeTemplate!.codeSize,
//                 errorCorrection: masterCode.codeTemplate!.errorCorrection,
//                 outputResolution: masterCode.codeTemplate!.outputResolution,
//                 barWidthReduction: masterCode.codeTemplate!.barWidthReduction,
//                 deviceCompensation: masterCode.codeTemplate!.deviceCompensation,
//                 narrowBarWidth: masterCode.codeTemplate!.narrowBarWidth,
//                 cellSize: masterCode.codeTemplate!.cellSize,
//                 magnification: masterCode.codeTemplate!.magnification,
//                 aspectRatio: masterCode.codeTemplate!.aspectRatio,
//               ),
//             );
//           }
//       }
//     }
//   }

//   /// Sync codes from an artwork to its master
//   ///
//   /// Updates the master's codes to match those in the artwork
//   Future<void> syncCodesFromArtworkToMaster(
//     Session session,
//     ArtworkDTO artwork,
//     ArtworkMasterDTO master,
//     int userId,
//     DateTime now,
//   ) async {
//     // Get current master codes with their subtypes
//     final masterCodesWithTypes = await ArtworkCodeDTO.db.find(
//       session,
//       where: (t) => t.artworkMasterId.equals(master.id),
//       include: ArtworkCodeDTO.include(
//         code2of5: OFCodeDTO.include(),
//         codeAztec: AztecCodeDTO.include(),
//         codeTemplate: TemplateCodeDTO.include(),
//       ),
//     );

//     // Organize by UUID for easier lookup
//     final masterCodesByUuid = {
//       for (final code in masterCodesWithTypes) code.codeUuid: code,
//     };

//     // Get current artwork codes with their subtypes
//     final artworkCodesWithTypes = artwork.codes ?? [];

//     // 1. Add new codes and update existing ones
//     for (final artworkCode in artworkCodesWithTypes) {
//       // Skip codes without UUID (shouldn't happen in normal operation)
//       if (artworkCode.codeUuid.isEmpty) {
//         continue;
//       }

//       final matchingMasterCode = masterCodesByUuid[artworkCode.codeUuid];

//       if (matchingMasterCode == null) {
//         // This is a new code not yet in the master - create it
//         final newMasterCode = ArtworkCodeDTO(
//           value: artworkCode.value,
//           description: artworkCode.description,
//           artworkId: null,
//           artworkMasterId: master.id,
//           artworkCodeType: artworkCode.artworkCodeType,
//           codeUuid: artworkCode.codeUuid, // Preserve UUID
//           createdAt: now,
//           createdById: userId,
//           isDraft: false,
//         );

//         final createdMasterCode =
//             await ArtworkCodeDTO.db.insertRow(session, newMasterCode);

//         // Handle specific code type using switch
//         switch (ArtworkCodeType.fromJson(artworkCode.artworkCodeType)) {
//           case ArtworkCodeType.of5:
//             if (artworkCode.code2of5 != null) {
//               await OFCodeDTO.db.insertRow(
//                 session,
//                 OFCodeDTO(
//                   artworkCodeId: createdMasterCode.id!,
//                   barWidthReduction: artworkCode.code2of5!.barWidthReduction,
//                   deviceCompensation: artworkCode.code2of5!.deviceCompensation,
//                   narrowBarWidth: artworkCode.code2of5!.narrowBarWidth,
//                   aspectRatio: artworkCode.code2of5!.aspectRatio,
//                 ),
//               );
//             }

//           case ArtworkCodeType.aztec:
//             if (artworkCode.codeAztec != null) {
//               await AztecCodeDTO.db.insertRow(
//                 session,
//                 AztecCodeDTO(
//                   artworkCodeId: createdMasterCode.id!,
//                   symbolSize: artworkCode.codeAztec!.symbolSize,
//                   errorCorrection: artworkCode.codeAztec!.errorCorrection,
//                   deviceCompensation: artworkCode.codeAztec!.deviceCompensation,
//                   cellSize: artworkCode.codeAztec!.cellSize,
//                 ),
//               );
//             }

//           case ArtworkCodeType.template:
//             if (artworkCode.codeTemplate != null) {
//               await TemplateCodeDTO.db.insertRow(
//                 session,
//                 TemplateCodeDTO(
//                   artworkCodeId: createdMasterCode.id!,
//                   codeSize: artworkCode.codeTemplate!.codeSize,
//                   errorCorrection: artworkCode.codeTemplate!.errorCorrection,
//                   outputResolution: artworkCode.codeTemplate!.outputResolution,
//                   barWidthReduction:
//                       artworkCode.codeTemplate!.barWidthReduction,
//                   deviceCompensation:
//                       artworkCode.codeTemplate!.deviceCompensation,
//                   narrowBarWidth: artworkCode.codeTemplate!.narrowBarWidth,
//                   cellSize: artworkCode.codeTemplate!.cellSize,
//                   magnification: artworkCode.codeTemplate!.magnification,
//                   aspectRatio: artworkCode.codeTemplate!.aspectRatio,
//                 ),
//               );
//             }
//         }
//       } else {
//         // This code exists in the master - update it
//         final updatedMasterCode = matchingMasterCode.copyWith(
//           value: artworkCode.value,
//           description: artworkCode.description,
//           // Don't update ID, UUID, or artworkMasterId
//         );

//         await ArtworkCodeDTO.db.updateRow(session, updatedMasterCode);

//         // Update the specific code type using switch
//         switch (ArtworkCodeType.fromJson(artworkCode.artworkCodeType)) {
//           case ArtworkCodeType.of5:
//             if (artworkCode.code2of5 != null &&
//                 matchingMasterCode.code2of5 != null) {
//               await OFCodeDTO.db.updateRow(
//                 session,
//                 matchingMasterCode.code2of5!.copyWith(
//                   barWidthReduction: artworkCode.code2of5!.barWidthReduction,
//                   deviceCompensation: artworkCode.code2of5!.deviceCompensation,
//                   narrowBarWidth: artworkCode.code2of5!.narrowBarWidth,
//                   aspectRatio: artworkCode.code2of5!.aspectRatio,
//                 ),
//               );
//             }

//           case ArtworkCodeType.aztec:
//             if (artworkCode.codeAztec != null &&
//                 matchingMasterCode.codeAztec != null) {
//               await AztecCodeDTO.db.updateRow(
//                 session,
//                 matchingMasterCode.codeAztec!.copyWith(
//                   symbolSize: artworkCode.codeAztec!.symbolSize,
//                   errorCorrection: artworkCode.codeAztec!.errorCorrection,
//                   deviceCompensation: artworkCode.codeAztec!.deviceCompensation,
//                   cellSize: artworkCode.codeAztec!.cellSize,
//                 ),
//               );
//             }

//           case ArtworkCodeType.template:
//             if (artworkCode.codeTemplate != null &&
//                 matchingMasterCode.codeTemplate != null) {
//               await TemplateCodeDTO.db.updateRow(
//                 session,
//                 matchingMasterCode.codeTemplate!.copyWith(
//                   codeSize: artworkCode.codeTemplate!.codeSize,
//                   errorCorrection: artworkCode.codeTemplate!.errorCorrection,
//                   outputResolution: artworkCode.codeTemplate!.outputResolution,
//                   barWidthReduction:
//                       artworkCode.codeTemplate!.barWidthReduction,
//                   deviceCompensation:
//                       artworkCode.codeTemplate!.deviceCompensation,
//                   narrowBarWidth: artworkCode.codeTemplate!.narrowBarWidth,
//                   cellSize: artworkCode.codeTemplate!.cellSize,
//                   magnification: artworkCode.codeTemplate!.magnification,
//                   aspectRatio: artworkCode.codeTemplate!.aspectRatio,
//                 ),
//               );
//             }
//         }
//       }
//     }

//     // 2. Remove codes from master that no longer exist in artwork
//     final artworkCodeUuids =
//         artworkCodesWithTypes.map((c) => c.codeUuid).toSet();
//     for (final masterCode in masterCodesWithTypes) {
//       if (!artworkCodeUuids.contains(masterCode.codeUuid)) {
//         // Delete specific code type
//         switch (ArtworkCodeType.fromJson(masterCode.artworkCodeType)) {
//           case ArtworkCodeType.of5:
//             await OFCodeDTO.db.deleteWhere(
//               session,
//               where: (t) => t.artworkCodeId.equals(masterCode.id),
//             );
//           case ArtworkCodeType.aztec:
//             await AztecCodeDTO.db.deleteWhere(
//               session,
//               where: (t) => t.artworkCodeId.equals(masterCode.id),
//             );
//           case ArtworkCodeType.template:
//             await TemplateCodeDTO.db.deleteWhere(
//               session,
//               where: (t) => t.artworkCodeId.equals(masterCode.id),
//             );
//         }

//         // Delete the artwork code itself
//         await ArtworkCodeDTO.db.deleteRow(session, masterCode);
//       }
//     }
//   }

//   /// Mark codes as deleted when parent entity is soft-deleted
//   Future<void> markCodesAsDeletedForParent(
//     Session session, {
//     required int parentId,
//     required CodeParentType parentType,
//     required int userId,
//     required DateTime deletedAt,
//   }) async {
//     // Fetch all codes for the parent entity
//     final codes = await ArtworkCodeDTO.db.find(
//       session,
//       where: parentType == CodeParentType.artwork
//           ? (t) =>
//               t.artworkId.equals(parentId) &
//               t.deletedAt.equals(null as DateTime?)
//           : (t) =>
//               t.artworkMasterId.equals(parentId) &
//               t.deletedAt.equals(null as DateTime?),
//     );

//     // Mark each code as deleted
//     for (final code in codes) {
//       await ArtworkCodeDTO.db.updateRow(
//         session,
//         code.copyWith(
//           deletedAt: deletedAt,
//           deletedById: userId,
//         ),
//       );
//     }
//   }

//   /// Process codes for a newly created artwork
//   ///
//   /// Ensures codes have the correct artworkId and no artworkMasterId
//   Future<void> processNewArtworkCodes(
//     Session session,
//     ArtworkDTO artwork,
//     int userId,
//     DateTime now,
//   ) async {
//     if (artwork.codes == null || artwork.codes!.isEmpty) {
//       return;
//     }

//     for (final code in artwork.codes!) {
//       // Create a clean code record linked to the artwork
//       final newCode = ArtworkCodeDTO(
//         value: code.value,
//         description: code.description,
//         artworkId: artwork.id, // Set to the artwork ID
//         artworkMasterId: null, // Remove master reference
//         artworkCodeType: code.artworkCodeType,
//         codeUuid: code.codeUuid, // Preserve UUID for tracking
//         createdAt: now,
//         createdById: userId,
//         isDraft: false,
//       );

//       // Insert the new artwork code
//       final createdCode = await ArtworkCodeDTO.db.insertRow(session, newCode);

//       // Create the appropriate subtype record based on code type
//       switch (ArtworkCodeType.fromJson(code.artworkCodeType)) {
//         case ArtworkCodeType.of5:
//           if (code.code2of5 != null) {
//             await OFCodeDTO.db.insertRow(
//               session,
//               OFCodeDTO(
//                 artworkCodeId: createdCode.id!,
//                 barWidthReduction: code.code2of5!.barWidthReduction,
//                 deviceCompensation: code.code2of5!.deviceCompensation,
//                 narrowBarWidth: code.code2of5!.narrowBarWidth,
//                 aspectRatio: code.code2of5!.aspectRatio,
//               ),
//             );
//           }
//         case ArtworkCodeType.aztec:
//           if (code.codeAztec != null) {
//             await AztecCodeDTO.db.insertRow(
//               session,
//               AztecCodeDTO(
//                 artworkCodeId: createdCode.id!,
//                 symbolSize: code.codeAztec!.symbolSize,
//                 errorCorrection: code.codeAztec!.errorCorrection,
//                 deviceCompensation: code.codeAztec!.deviceCompensation,
//                 cellSize: code.codeAztec!.cellSize,
//               ),
//             );
//           }
//         case ArtworkCodeType.template:
//           if (code.codeTemplate != null) {
//             await TemplateCodeDTO.db.insertRow(
//               session,
//               TemplateCodeDTO(
//                 artworkCodeId: createdCode.id!,
//                 codeSize: code.codeTemplate!.codeSize,
//                 errorCorrection: code.codeTemplate!.errorCorrection,
//                 outputResolution: code.codeTemplate!.outputResolution,
//                 barWidthReduction: code.codeTemplate!.barWidthReduction,
//                 deviceCompensation: code.codeTemplate!.deviceCompensation,
//                 narrowBarWidth: code.codeTemplate!.narrowBarWidth,
//                 cellSize: code.codeTemplate!.cellSize,
//                 magnification: code.codeTemplate!.magnification,
//                 aspectRatio: code.codeTemplate!.aspectRatio,
//               ),
//             );
//           }
//       }
//     }
//   }
// }
