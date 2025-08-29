// import 'dart:async';

// import 'package:collection/collection.dart';
// import 'package:elbdesk_server/src/expressions/core/filter_expression.dart';
// import 'package:elbdesk_server/src/generated/protocol.dart';
// import 'package:elbdesk_server/src/modules/core/endpoint_utils.dart';
// import 'package:elbdesk_server/src/modules/core/generic_crud.dart';
// import 'package:serverpod/serverpod.dart';

// part 'bearer_endpoint_utils.dart';

// // TODO(mh): Remove type1 and type2

// final bearerStreamController = StreamController<BearerDTO>.broadcast();

// /// Bearer Endpoint
// ///
// class BearerEndpoint extends Endpoint {
//   // ensure that the user is logged in (serverpod functionality)
//   @override
//   bool get requireLogin => true;

//   Stream<BearerDTO> watch(
//     Session session,
//     Stream<BearerDTO> stream, {
//     required String sessionId,
//     required int entityId,
//   }) async* {
//     session.addWillCloseListener((session) {
//       release(session, entityId: entityId, sessionId: sessionId);
//     });

//     yield* bearerStreamController.stream
//         .where((event) => event.id == entityId)
//         .map((event) {
//       return event;
//     });
//   }

//   /// Find Bearer by id
//   ///
//   /// This method is used to find a bearer by its id
//   Future<BearerDTO?> findBearerById(Session session, int id) async {
//     return BearerDTO.db.findById(
//       session,
//       id,
//       include: BearerDTO.include(
//         type1: BearerType1DTO.include(),
//         type2: BearerType2DTO.include(),
//       ),
//     );
//   }

//   /// Get Bearers
//   ///
//   /// This method is used to get all bearers from the database
//   Future<List<BearerDTO>> findBearers(
//     Session session, {
//     Sort? sort,
//     Filter? filter,
//   }) async {
//     return _getBearers(session, sort: sort, filter: filter);
//   }

//   /// Find beaerers by customerId
//   ///
//   /// This method is used to get all bearers related to the customer
//   Future<List<BearerDTO>> findBearersByCustomer(
//     Session session,
//     int customerId,
//   ) async {
//     throw UnimplementedError();
//   }

//   /// Create Bearer
//   ///
//   /// This method is used to create a new bearer
//   Future<BearerDTO> createBearer(
//     Session session,
//     String? sessionId,
//     BearerDTO bearer,
//   ) async {
//     final userId = (await session.authenticated)?.userId;

//     BearerType1DTO? bearerType1;
//     BearerType2DTO? bearerType2;
//     BearerTypeStandardFlexoPrintDTO? bearerStandardFlexoPrint;
//     BearerTypeFlexoPrintMultilayerDTO? bearerFlexoPrintMultilayer;
//     BearerTypeSheetFedPressPlateEqualsSubDTO? bearerSheetFedPressPlateEqualsSub;
//     BearerTypeOffsetPressFixedPlateDTO? bearerOffsetPressFixedPlate;
//     BearerTypeSheetFedPressFixedPlateDTO? bearerSheetFedPressFixedPlate;
//     BearerTypeSheetFedPressMinPlateDTO? bearerSheetFedPressMinPlate;

//     switch (bearer.type) {
//       // Handle Bearer Type 1: Existing Type1
//       case BearerType.type1:
//         session.log(bearer.type1.toString());
//         if (bearer.type1 != null) {
//           bearerType1 =
//               await BearerType1DTO.db.insertRow(session, bearer.type1!);
//         }

//       // Handle Bearer Type 2: Existing Old Type2
//       case BearerType.type2:
//         session.log(bearer.type2.toString());
//         if (bearer.type2 != null) {
//           bearerType2 =
//               await BearerType2DTO.db.insertRow(session, bearer.type2!);
//         }
//       // Handle Standard Flexo Print Bearer Type: sur1
//       case BearerType.standardFlexoPrint:
//         session.log(bearer.typeStandardFlexoPrint.toString());
//         if (bearer.typeStandardFlexoPrint != null) {
//           bearerStandardFlexoPrint = await BearerTypeStandardFlexoPrintDTO.db
//               .insertRow(session, bearer.typeStandardFlexoPrint!);
//         }

//       // Handle Flexo Print Multilayer Bearer Type: sur6
//       case BearerType.flexoPrintMultilayer:
//         session.log(bearer.typeFlexoPrintMultilayer.toString());
//         if (bearer.typeFlexoPrintMultilayer != null) {
//           bearerFlexoPrintMultilayer = await BearerTypeFlexoPrintMultilayerDTO
//               .db
//               .insertRow(session, bearer.typeFlexoPrintMultilayer!);
//         }

//       // Handle Sheet Fed Press Minimum Plate Bearer Type: sur2
//       case BearerType.sheetFedPressMinPlate:
//         session.log(bearer.typeSheetFedPressMinPlate.toString());
//         if (bearer.typeSheetFedPressMinPlate != null) {
//           bearerSheetFedPressMinPlate = await BearerTypeSheetFedPressMinPlateDTO
//               .db
//               .insertRow(session, bearer.typeSheetFedPressMinPlate!);
//         }

//       // Handle Sheet Fed Press Plate Equals Substrate Bearer Type: sur3
//       case BearerType.sheetFedPressPlateEqualsSub:
//         session.log(bearer.typeSheetFedPressPlateEqualsSub.toString());
//         if (bearer.typeSheetFedPressPlateEqualsSub != null) {
//           bearerSheetFedPressPlateEqualsSub =
//               await BearerTypeSheetFedPressPlateEqualsSubDTO.db
//                   .insertRow(session, bearer.typeSheetFedPressPlateEqualsSub!);
//         }

//       // Handle Offset Press Fixed Plate Bearer Type: sur4
//       case BearerType.offsetPressFixedPlate:
//         session.log(bearer.typeOffsetPressFixedPlate.toString());
//         if (bearer.typeOffsetPressFixedPlate != null) {
//           bearerOffsetPressFixedPlate = await BearerTypeOffsetPressFixedPlateDTO
//               .db
//               .insertRow(session, bearer.typeOffsetPressFixedPlate!);
//         }

//       // Handle Sheet Fed Press Fixed Plate Bearer Type: sur5
//       case BearerType.sheetFedPressFixedPlate:
//         session.log(bearer.typeSheetFedPressFixedPlate.toString());
//         if (bearer.typeSheetFedPressFixedPlate != null) {
//           bearerSheetFedPressFixedPlate =
//               await BearerTypeSheetFedPressFixedPlateDTO.db
//                   .insertRow(session, bearer.typeSheetFedPressFixedPlate!);
//         }

//       // Optional: Handle unexpected or undefined bearer types
//       case BearerType.none:
//         session.log('Unhandled BearerType: ${bearer.type}');

//       // default:
//       //   session.log('Unhandled BearerType: ${bearer.type}');
//       //   break;
//     }

//     final createdBearer = await BearerDTO.db.insertRow(
//       session,
//       bearer.copyWith(
//         createdAt: DateTime.now(),
//         createdById: userId,
//         editingSession: null,
//         type1Id: bearerType1?.id,
//         type2Id: bearerType2?.id,
//         typeStandardFlexoPrintId: bearerStandardFlexoPrint?.id,
//         typeFlexoPrintMultilayerId: bearerFlexoPrintMultilayer?.id,
//         typeSheetFedPressMinPlateId: bearerSheetFedPressMinPlate?.id,
//         typeSheetFedPressPlateEqualsSubId:
//             bearerSheetFedPressPlateEqualsSub?.id,
//         typeOffsetPressFixedPlateId: bearerOffsetPressFixedPlate?.id,
//         typeSheetFedPressFixedPlateId: bearerSheetFedPressFixedPlate?.id,
//       ),
//     );

//     return createdBearer;
//   }

//   /// Delete Bearer
//   ///
//   /// Delete Bearer based on the provided bearerId and sessionId
//   Future<bool> deleteBearer(
//     Session session, {
//     required int bearerId,
//     required String sessionId,
//   }) async {
//     final bearer = await findBearerById(session, bearerId);
//     if (bearer == null) {
//       return false;
//     }

//     if (bearer.editingSession != sessionId) {
//       return false;
//     }

//     final userId = (await session.authenticated)?.userId;

//     final deletedBearer = bearer.copyWith(
//       deletedAt: DateTime.now(),
//       deletedById: userId,
//     );

//     await BearerDTO.db.deleteRow(session, deletedBearer);

//     return true;
//   }

//   /// Fetch and Lock Bearer
//   ///
//   /// Used when opening this object for edit. If the object is already
//   /// being edited, the same object is returned. If the object is not
//   /// being edited, the object is updated with the sessionId and userId
//   /// and returned.
//   ///
//   /// The update happens inside of the unsafeQuery method
//   Future<BearerDTO?> fetchAndLockBearer(
//     Session session, {
//     required int id,
//     required String sessionId,
//   }) async {
//     final userId = (await session.authenticated)?.userId;

//     // Fetch and Lock with SQL query
//     final result = await session.db.unsafeQuery(
//       lockEditSessionQuery(
//         tableName: BearerDTOTable().tableName,
//       ),
//       parameters: QueryParameters.named({
//         'id': id,
//         'editingSessionValue': sessionId,
//         'editingByIdValue': userId,
//       }),
//     );

//     if (result.isNotEmpty) {
//       //Refetch DTO to include relations
//       final product = await findBearerById(session, id);

//       return product;
//     }

//     return null;
//   }

//   /// Update Bearer
//   ///
//   /// This method updates the Bearer object and returns the updated object.
//   /// It manages the creation and updating of related BearerType1DTO and
//   /// BearerType2DTO objects.
//   ///
//   /// The `deleteOldType` parameter determines whether the old type should be
//   /// deleted when the type changes.
//   /// - If `deleteOldType` is `true` (default), the old type entry and its
//   /// relation are deleted.
//   /// - If `deleteOldType` is `false`, the old type entry and its relation
//   /// remain intact.
//   Future<BearerDTO> updateBearer(
//     Session session,
//     BearerDTO bearer,
//     String sessionId, {
//     bool deleteOldType = true,
//   }) async {
//     final userId = (await session.authenticated)?.userId;

//     // Validate Bearer existence
//     final serverBearer = await findBearerById(
//       session,
//       bearer.id!,
//     );
//     if (serverBearer == null) {
//       throw Exception('Bearer not found');
//     }

//     // Validate session ownership
//     if (serverBearer.editingSession != sessionId) {
//       throw Exception('Invalid session!');
//     }

//     // Check for concurrent modifications
//     final now = DateTime.now();
//     if (serverBearer.editingSince != null &&
//         serverBearer.editingSince!.isAfter(now)) {
//       throw Exception('Bearer has been modified by another user');
//     }

//     // Determine if the BearerType has changed
//     final oldType = serverBearer.type;
//     final newType = bearer.type;

//     BearerType1DTO? bearerType1;
//     BearerType2DTO? bearerType2;
//     BearerTypeStandardFlexoPrintDTO? bearerTypeStandardFlexoPrint;
//     BearerTypeFlexoPrintMultilayerDTO? bearerTypeFlexoPrintMultilayer;
//     BearerTypeSheetFedPressMinPlateDTO? bearerTypeSheetFedPressMinPlate;
//     BearerTypeSheetFedPressPlateEqualsSubDTO?
//         bearerTypeSheetFedPressPlateEqualsSub;
//     BearerTypeOffsetPressFixedPlateDTO? bearerTypeOffsetPressFixedPlate;
//     BearerTypeSheetFedPressFixedPlateDTO? bearerTypeSheetFedPressFixedPlate;

//     // Handle type changes based on deleteOldType flag
//     // TODO(all): If we want to delete the old type we would probably have to
//     // delete the relation before actually deleting the old row. So the type id
//     // would have to be set to null previously.
//     // Instead of actually deleting the rows we could also introduce a deletedAt
//     // field in the Bearer type tables.
//     if (oldType != newType) {
//       if (deleteOldType) {
//         // Optionally delete the old type entry if required
//         // Since you want to never delete, this block can be removed or
//         //commented out
//         /*
//         switch (oldType) {
//           case BearerType.type1:
//             if (serverBearer.type1Id != null) {
//               await BearerType1DTO.db.deleteRow(transaction, 
//               serverBearer.type1Id!);
//             }
//             break;
//           case BearerType.type2:
//             if (serverBearer.type2Id != null) {
//               await BearerType2DTO.db.deleteRow(transaction, 
//               serverBearer.type2Id!);
//             }
//             break;
//           case BearerType.none:
//             // No action needed
//             break;
//         }
//         */
//       }
//       // If deleteOldType is false, retain the old type entries and relations
//     }

//     // Handle new type: create or update
//     switch (newType) {
//       case BearerType.none:
//         bearerType1 = null;
//         bearerType2 = null;
//       case BearerType.type1:
//         if (bearer.type1 != null) {
//           if (serverBearer.type1Id != null) {
//             // Update existing BearerType1DTO
//             bearerType1 = await BearerType1DTO.db.updateRow(
//               session,
//               bearer.type1!.copyWith(id: serverBearer.type1Id),
//             );
//           } else {
//             // Create new BearerType1DTO
//             bearerType1 =
//                 await BearerType1DTO.db.insertRow(session, bearer.type1!);
//           }
//         }
//       case BearerType.type2:
//         if (bearer.type2 != null) {
//           if (serverBearer.type2Id != null) {
//             // Update existing BearerType2DTO
//             bearerType2 = await BearerType2DTO.db.updateRow(
//               session,
//               bearer.type2!.copyWith(id: serverBearer.type2Id),
//             );
//           } else {
//             // Create new BearerType2DTO
//             bearerType2 =
//                 await BearerType2DTO.db.insertRow(session, bearer.type2!);
//           }
//         }
//       case BearerType.standardFlexoPrint:
//         if (bearer.typeStandardFlexoPrint != null) {
//           if (serverBearer.typeStandardFlexoPrintId != null) {
//             // Update existing BearerTypeStandardFlexoPrintDTO
//             bearerTypeStandardFlexoPrint =
//                 await BearerTypeStandardFlexoPrintDTO.db.updateRow(
//               session,
//               bearer.typeStandardFlexoPrint!
//                   .copyWith(id: serverBearer.typeStandardFlexoPrintId),
//             );
//           } else {
//             // Create new BearerTypeStandardFlexoPrintDTO
//             bearerTypeStandardFlexoPrint = await BearerTypeStandardFlexoPrintDTO
//                 .db
//                 .insertRow(session, bearer.typeStandardFlexoPrint!);
//           }
//         }
//       case BearerType.flexoPrintMultilayer:
//         if (bearer.typeFlexoPrintMultilayer != null) {
//           if (serverBearer.typeFlexoPrintMultilayerId != null) {
//             // Update existing BearerTypeFlexoPrintMultilayerDTO
//             bearerTypeFlexoPrintMultilayer =
//                 await BearerTypeFlexoPrintMultilayerDTO.db.updateRow(
//               session,
//               bearer.typeFlexoPrintMultilayer!
//                   .copyWith(id: serverBearer.typeFlexoPrintMultilayerId),
//             );
//           } else {
//             // Create new BearerTypeFlexoPrintMultilayerDTO
//             bearerTypeFlexoPrintMultilayer =
//                 await BearerTypeFlexoPrintMultilayerDTO.db
//                     .insertRow(session, bearer.typeFlexoPrintMultilayer!);
//           }
//         }
//       case BearerType.sheetFedPressMinPlate:
//         if (bearer.typeSheetFedPressMinPlate != null) {
//           if (serverBearer.typeSheetFedPressMinPlateId != null) {
//             // Update existing BearerTypeSheetFedPressMinPlateDTO
//             bearerTypeSheetFedPressMinPlate =
//                 await BearerTypeSheetFedPressMinPlateDTO.db.updateRow(
//               session,
//               bearer.typeSheetFedPressMinPlate!.copyWith(
//                 id: serverBearer.typeSheetFedPressMinPlateId,
//               ),
//             );
//           } else {
//             // Create new BearerTypeSheetFedPressMinPlateDTO
//             bearerTypeSheetFedPressMinPlate =
//                 await BearerTypeSheetFedPressMinPlateDTO.db
//                     .insertRow(session, bearer.typeSheetFedPressMinPlate!);
//           }
//         }
//       case BearerType.sheetFedPressPlateEqualsSub:
//         if (bearer.typeSheetFedPressPlateEqualsSub != null) {
//           if (serverBearer.typeSheetFedPressPlateEqualsSubId != null) {
//             // Update existing BearerTypeSheetFedPressPlateEqualsSubDTO
//             bearerTypeSheetFedPressPlateEqualsSub =
//                 await BearerTypeSheetFedPressPlateEqualsSubDTO.db.updateRow(
//               session,
//               bearer.typeSheetFedPressPlateEqualsSub!.copyWith(
//                 id: serverBearer.typeSheetFedPressPlateEqualsSubId,
//               ),
//             );
//           } else {
//             // Create new BearerTypeSheetFedPressPlateEqualsSubDTO
//             bearerTypeSheetFedPressPlateEqualsSub =
//                 await BearerTypeSheetFedPressPlateEqualsSubDTO.db.insertRow(
//               session,
//               bearer.typeSheetFedPressPlateEqualsSub!,
//             );
//           }
//         }
//       case BearerType.offsetPressFixedPlate:
//         if (bearer.typeOffsetPressFixedPlate != null) {
//           if (serverBearer.typeOffsetPressFixedPlateId != null) {
//             // Update existing BearerTypeOffsetPressFixedPlateDTO
//             bearerTypeOffsetPressFixedPlate =
//                 await BearerTypeOffsetPressFixedPlateDTO.db.updateRow(
//               session,
//               bearer.typeOffsetPressFixedPlate!.copyWith(
//                 id: serverBearer.typeOffsetPressFixedPlateId,
//               ),
//             );
//           } else {
//             // Create new BearerTypeOffsetPressFixedPlateDTO
//             bearerTypeOffsetPressFixedPlate =
//                 await BearerTypeOffsetPressFixedPlateDTO.db
//                     .insertRow(session, bearer.typeOffsetPressFixedPlate!);
//           }
//         }
//       case BearerType.sheetFedPressFixedPlate:
//         if (bearer.typeSheetFedPressFixedPlate != null) {
//           if (serverBearer.typeSheetFedPressFixedPlateId != null) {
//             // Update existing BearerTypeSheetFedPressFixedPlateDTO
//             bearerTypeSheetFedPressFixedPlate =
//                 await BearerTypeSheetFedPressFixedPlateDTO.db.updateRow(
//               session,
//               bearer.typeSheetFedPressFixedPlate!.copyWith(
//                 id: serverBearer.typeSheetFedPressFixedPlateId,
//               ),
//             );
//           } else {
//             // Create new BearerTypeSheetFedPressFixedPlateDTO
//             bearerTypeSheetFedPressFixedPlate =
//                 await BearerTypeSheetFedPressFixedPlateDTO.db
//                     .insertRow(session, bearer.typeSheetFedPressFixedPlate!);
//           }
//         }
//     }
//     // If the type hasn't changed, ensure existing types are updated or created
//     // if necessary
//     if (oldType == newType) {
//       switch (newType) {
//         case BearerType.none:
//           // No action needed
//           break;
//         case BearerType.type1:
//           if (bearer.type1 != null) {
//             if (serverBearer.type1Id != null) {
//               // Update existing BearerType1DTO
//               bearerType1 = await BearerType1DTO.db.updateRow(
//                 session,
//                 bearer.type1!.copyWith(id: serverBearer.type1Id),
//               );
//             } else {
//               // Create new BearerType1DTO
//               bearerType1 =
//                   await BearerType1DTO.db.insertRow(session, bearer.type1!);
//             }
//           } else {
//             // If type1 is set but no type1 data is provided, handle accordingly
//             if (serverBearer.type1Id != null && deleteOldType) {
//               await BearerType1DTO.db.deleteRow(session, serverBearer.type1!);
//             }
//           }
//         case BearerType.type2:
//           if (bearer.type2 != null) {
//             if (serverBearer.type2Id != null) {
//               // Update existing BearerType2DTO
//               bearerType2 = await BearerType2DTO.db.updateRow(
//                 session,
//                 bearer.type2!.copyWith(id: serverBearer.type2Id),
//               );
//             } else {
//               // Create new BearerType2DTO
//               bearerType2 =
//                   await BearerType2DTO.db.insertRow(session, bearer.type2!);
//             }
//           } else {
//             // If type2 is set but no type2 data is provided, handle accordingly
//             if (serverBearer.type2Id != null && deleteOldType) {
//               await BearerType2DTO.db.deleteRow(session, serverBearer.type2!);
//             }
//           }
//         case BearerType.standardFlexoPrint:
//           if (bearer.typeStandardFlexoPrint != null) {
//             if (serverBearer.typeStandardFlexoPrintId != null) {
//               // Update existing BearerTypeStandardFlexoPrintDTO
//               bearerTypeStandardFlexoPrint =
//                   await BearerTypeStandardFlexoPrintDTO.db.updateRow(
//                 session,
//                 bearer.typeStandardFlexoPrint!
//                     .copyWith(id: serverBearer.typeStandardFlexoPrintId),
//               );
//             } else {
//               // Create new BearerTypeStandardFlexoPrintDTO
//               bearerTypeStandardFlexoPrint =
//                   await BearerTypeStandardFlexoPrintDTO.db
//                       .insertRow(session, bearer.typeStandardFlexoPrint!);
//             }
//           } else {
//             // If standardFlexoPrint is set but no standardFlexoPrint data is
//             //provided, handle accordingly
//             if (serverBearer.typeStandardFlexoPrintId != null &&
//                 deleteOldType) {
//               await BearerTypeStandardFlexoPrintDTO.db
//                   .deleteRow(session, serverBearer.typeStandardFlexoPrint!);
//             }
//           }
//         case BearerType.flexoPrintMultilayer:
//           if (bearer.typeFlexoPrintMultilayer != null) {
//             if (serverBearer.typeFlexoPrintMultilayerId != null) {
//               // Update existing BearerTypeFlexoPrintMultilayerDTO
//               bearerTypeFlexoPrintMultilayer =
//                   await BearerTypeFlexoPrintMultilayerDTO.db.updateRow(
//                 session,
//                 bearer.typeFlexoPrintMultilayer!.copyWith(
//                   id: serverBearer.typeFlexoPrintMultilayerId,
//                 ),
//               );
//             } else {
//               // Create new BearerTypeFlexoPrintMultilayerDTO
//               bearerTypeFlexoPrintMultilayer =
//                   await BearerTypeFlexoPrintMultilayerDTO.db
//                       .insertRow(session, bearer.typeFlexoPrintMultilayer!);
//             }
//           } else {
//             // If flexoPrintMultilayer is set but no flexoPrintMultilayer data
//             // is provided, handle accordingly
//             if (serverBearer.typeFlexoPrintMultilayerId != null &&
//                 deleteOldType) {
//               await BearerTypeFlexoPrintMultilayerDTO.db
//                   .deleteRow(session, serverBearer.typeFlexoPrintMultilayer!);
//             }
//           }
//         case BearerType.sheetFedPressMinPlate:
//           if (bearer.typeSheetFedPressMinPlate != null) {
//             if (serverBearer.typeSheetFedPressMinPlateId != null) {
//               // Update existing BearerTypeSheetFedPressMinPlateDTO
//               bearerTypeSheetFedPressMinPlate =
//                   await BearerTypeSheetFedPressMinPlateDTO.db.updateRow(
//                 session,
//                 bearer.typeSheetFedPressMinPlate!.copyWith(
//                   id: serverBearer.typeSheetFedPressMinPlateId,
//                 ),
//               );
//             } else {
//               // Create new BearerTypeSheetFedPressMinPlateDTO
//               bearerTypeSheetFedPressMinPlate =
//                   await BearerTypeSheetFedPressMinPlateDTO.db
//                       .insertRow(session, bearer.typeSheetFedPressMinPlate!);
//             }
//           } else {
//             // If sheetFedPressMinPlate is set but no sheetFedPressMinPlate
//             //data is provided, handle accordingly
//             if (serverBearer.typeSheetFedPressMinPlateId != null &&
//                 deleteOldType) {
//               await BearerTypeSheetFedPressMinPlateDTO.db
//                   .deleteRow(session, serverBearer.typeSheetFedPressMinPlate!);
//             }
//           }
//         case BearerType.sheetFedPressPlateEqualsSub:
//           if (bearer.typeSheetFedPressPlateEqualsSub != null) {
//             if (serverBearer.typeSheetFedPressPlateEqualsSubId != null) {
//               // Update existing BearerTypeSheetFedPressPlateEqualsSubDTO
//               bearerTypeSheetFedPressPlateEqualsSub =
//                   await BearerTypeSheetFedPressPlateEqualsSubDTO.db.updateRow(
//                 session,
//                 bearer.typeSheetFedPressPlateEqualsSub!.copyWith(
//                   id: serverBearer.typeSheetFedPressPlateEqualsSubId,
//                 ),
//               );
//             } else {
//               // Create new BearerTypeSheetFedPressPlateEqualsSubDTO
//               bearerTypeSheetFedPressPlateEqualsSub =
//                   await BearerTypeSheetFedPressPlateEqualsSubDTO.db.insertRow(
//                 session,
//                 bearer.typeSheetFedPressPlateEqualsSub!,
//               );
//             }
//           } else {
//             // If sheetFedPressPlateEqualsSub is set but no
//             // sheetFedPressPlateEqualsSub data is provided, handle accordingly
//             if (serverBearer.typeSheetFedPressPlateEqualsSubId != null &&
//                 deleteOldType) {
//               await BearerTypeSheetFedPressPlateEqualsSubDTO.db.deleteRow(
//                 session,
//                 serverBearer.typeSheetFedPressPlateEqualsSub!,
//               );
//             }
//           }
//         case BearerType.offsetPressFixedPlate:
//           if (bearer.typeOffsetPressFixedPlate != null) {
//             if (serverBearer.typeOffsetPressFixedPlateId != null) {
//               // Update existing BearerTypeOffsetPressFixedPlateDTO
//               bearerTypeOffsetPressFixedPlate =
//                   await BearerTypeOffsetPressFixedPlateDTO.db.updateRow(
//                 session,
//                 bearer.typeOffsetPressFixedPlate!.copyWith(
//                   id: serverBearer.typeOffsetPressFixedPlateId,
//                 ),
//               );
//             } else {
//               // Create new BearerTypeOffsetPressFixedPlateDTO
//               bearerTypeOffsetPressFixedPlate =
//                   await BearerTypeOffsetPressFixedPlateDTO.db
//                       .insertRow(session, bearer.typeOffsetPressFixedPlate!);
//             }
//           } else {
//             // If offsetPressFixedPlate is set but no offsetPressFixedPlate
//             // data is provided, handle accordingly
//             if (serverBearer.typeOffsetPressFixedPlateId != null &&
//                 deleteOldType) {
//               await BearerTypeOffsetPressFixedPlateDTO.db
//                   .deleteRow(session, serverBearer.typeOffsetPressFixedPlate!);
//             }
//           }
//         case BearerType.sheetFedPressFixedPlate:
//           if (bearer.typeSheetFedPressFixedPlate != null) {
//             if (serverBearer.typeSheetFedPressFixedPlateId != null) {
//               // Update existing BearerTypeSheetFedPressFixedPlateDTO
//               bearerTypeSheetFedPressFixedPlate =
//                   await BearerTypeSheetFedPressFixedPlateDTO.db.updateRow(
//                 session,
//                 bearer.typeSheetFedPressFixedPlate!.copyWith(
//                   id: serverBearer.typeSheetFedPressFixedPlateId,
//                 ),
//               );
//             } else {
//               // Create new BearerTypeSheetFedPressFixedPlateDTO
//               bearerTypeSheetFedPressFixedPlate =
//                   await BearerTypeSheetFedPressFixedPlateDTO.db
//                       .insertRow(session, bearer.typeSheetFedPressFixedPlate!);
//             }
//           } else {
//             // If sheetFedPressFixedPlate is set but no sheetFedPressFixedPlate
//             // data is provided, handle accordingly
//             if (serverBearer.typeSheetFedPressFixedPlateId != null &&
//                 deleteOldType) {
//               await BearerTypeSheetFedPressFixedPlateDTO.db.deleteRow(
//                 session,
//                 serverBearer.typeSheetFedPressFixedPlate!,
//               );
//             }
//           }
//       }
//     }

//     // Update the main BearerDTO with references to the updated or created types
//     final updatedBearer = bearer.copyWith(
//       editingSession: serverBearer.editingSession,
//       editingSince: now,
//       editingById: userId,
//       createdById: serverBearer.createdById,
//       type1Id: bearerType1?.id,
//       type2Id: bearerType2?.id,
//       typeStandardFlexoPrintId: bearerTypeStandardFlexoPrint?.id,
//       typeFlexoPrintMultilayerId: bearerTypeFlexoPrintMultilayer?.id,
//       typeSheetFedPressMinPlateId: bearerTypeSheetFedPressMinPlate?.id,
//       typeSheetFedPressPlateEqualsSubId:
//           bearerTypeSheetFedPressPlateEqualsSub?.id,
//       typeOffsetPressFixedPlateId: bearerTypeOffsetPressFixedPlate?.id,
//       typeSheetFedPressFixedPlateId: bearerTypeSheetFedPressFixedPlate?.id,
//     );

//     // Update the BearerDTO in the database
//     await BearerDTO.db.updateRow(session, updatedBearer);

//     // Fetch the updated BearerDTO with related data
//     final fetchedBearer = await BearerDTO.db.findById(
//       session,
//       updatedBearer.id!,
//       include: BearerDTO.include(
//         type1: BearerType1DTO.include(),
//         type2: BearerType2DTO.include(),
//       ),
//     );

//     if (fetchedBearer == null) {
//       throw Exception('Failed to fetch updated Bearer');
//     }

//     return fetchedBearer;
//   }

//   /// Release Bearer
//   ///
//   /// This method should be called when releasing/disposing a bearer
//   Future<void> release(
//     Session session, {
//     required int entityId,
//     required String sessionId,
//   }) async {
//     await GenericCrud.releaseEntity<BearerDTO>(
//       session,
//       entityId: entityId,
//       sessionId: sessionId,
//       fetchById: findBearerById,
//       updateEntity: BearerDTO.db.updateRow,
//       tableType: TableType.bearer,
//       streamController: bearerStreamController,
//       deleteDraft: BearerDTO.db.deleteRow,
//     );
//   }

//   /// Save and release Bearer
//   ///
//   /// This method is used to save and release a bearer
//   Future<BearerDTO> saveAndReleaseBearer(
//     Session session, {
//     required BearerDTO bearer,
//     required String sessionId,
//   }) async {
//     final userId = (await session.authenticated)?.userId;
//     final serverBearer = await findBearerById(session, bearer.id!);
//     if (serverBearer!.editingSession != sessionId) {
//       throw Exception('Invalid session!');
//     } else {
//       final now = DateTime.now();
//       final updatedBearer = bearer.copyWith(
//         editingSession: null,
//         editingSince: now,
//         editingById: userId,
//       );
//       return BearerDTO.db.updateRow(session, updatedBearer);
//     }
//   }

//   Future<List<EntityLockDTO>> findEntityLocks(Session session) async {
//     final entities = await BearerDTO.db.find(
//       session,
//       where: (t) =>
//           t.editingSession.notEquals(null as String?) &
//           t.editingSession.notEquals(''),
//     );

//     return entities
//         .map(
//           (e) => EntityLockDTO(
//             entityType: TableType.bearer,
//             entityId: e.id!,
//             editingSessionId: e.editingSession!,
//             lockedAt: e.editingSince!,
//             userId: e.editingById,
//           ),
//         )
//         .toList();
//   }
// }
