import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/prepress/nutzenlayout/endpoints/nutzenlayout_endpoint.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:serverpod/serverpod.dart';

class NutzenlayoutHandler {
  const NutzenlayoutHandler._();

  static Future<void> createSingleNutzenlayoutWithArtworks(
    Session session, {
    required NutzenlayoutDTO singleNutzenlayoutDTO,
    required Set<int> artworkIds,
    required int salesOrderId,
    required bool isInitialNutzenlayout,
  }) async {
    final (:userId, :now) = await CoreUtils.getCurrentTimeAndUser(session);

    final res = await session.db.transaction((transaction) async {
      // * Validating dimensions
      final nutzenlayoutDimensions = singleNutzenlayoutDTO.dimensions.first;
      final artworksMatchNutzenlayoutDimensions =
          await _artworksMatchNutzenlayoutDimensions(
        session,
        artworkIds: artworkIds,
        nutzenlayoutArtworkDimensions: nutzenlayoutDimensions,
        transaction: transaction,
      );
      if (!artworksMatchNutzenlayoutDimensions) {
        throw ElbException(
          message: 'Die Artworks passen nicht in den Nutzenlayout',
          exceptionType: ElbExceptionType.validationFormError,
        );
      }

      var nutzenlayout = singleNutzenlayoutDTO;

      // * create the nutzenlayout
      if (isInitialNutzenlayout) {
        nutzenlayout = await NutzenlayoutDTO.db.insertRow(
          session,
          singleNutzenlayoutDTO.copyWith(
            createdAt: now,
            createdById: userId,
          ),
          transaction: transaction,
        );
      }

      // *create the sales order single nutzenlayout
      final insertedSalesOrderSingleNutzenlayout =
          await SalesOrderSingleNutzenlayoutDTO.db.insertRow(
        session,
        SalesOrderSingleNutzenlayoutDTO(
          salesOrderId: salesOrderId,
          nutzenlayoutId: nutzenlayout.id!,
          createdAt: now,
          isDraft: false,
          createdById: userId,
        ),
        transaction: transaction,
      );

      // *add the artworks to the sales order single nutzenlayout

      // create the junctions
      final listOfJts = artworkIds
          .map(
            (e) => SalesOrderSingleNutzenlayoutArtworkJT(
              artworkId: e,
              salesOrderSingleNutzenlayoutId:
                  insertedSalesOrderSingleNutzenlayout.id!,
            ),
          )
          .toList();
      final insertedJts = await SalesOrderSingleNutzenlayoutArtworkJT.db
          .insert(session, listOfJts, transaction: transaction);
      // attach the artworks to the sales order single nutzenlayout
      await SalesOrderSingleNutzenlayoutDTO.db.attach.artworks(
        session,
        insertedSalesOrderSingleNutzenlayout,
        insertedJts,
        transaction: transaction,
      );

      final asLight = SalesOrderSingleNutzenlayoutLightDTO(
        nutzenlayout: nutzenlayout,
        artworks: artworkIds.toList(),
        salesOrderId: salesOrderId,
        salesOrderSingleNutzenlayoutId:
            insertedSalesOrderSingleNutzenlayout.id!,
      );

      return asLight;
    });
    salesOrderSingleNutzenlayoutLightStreamController.add(res);

    return;
  }

  static Future<void> addArtworksToSingleNutzenlayout(
    Session session, {
    required NutzenlayoutDTO nutzenlayoutDTO,
    required Set<int> artworkIds,
    required int salesOrderId,
  }) async {
    // * check if we have _this_ nutzenlayout in the sales order
    final salesOrderSingleNutzenlayout =
        await SalesOrderSingleNutzenlayoutDTO.db.findFirstRow(
      session,
      where: (t) =>
          t.nutzenlayoutId.equals(nutzenlayoutDTO.id) &
          t.salesOrderId.equals(salesOrderId),
      include: SalesOrderSingleNutzenlayoutDTO.include(
        nutzenlayout: NutzenlayoutDTO.include(),
        artworks: SalesOrderSingleNutzenlayoutArtworkJT.includeList(
          include: SalesOrderSingleNutzenlayoutArtworkJT.include(
            artwork: ArtworkDTO.include(),
          ),
        ),
      ),
    );
    // * create the nutzenlayout for _this_ sales order
    if (salesOrderSingleNutzenlayout == null) {
      await createSingleNutzenlayoutWithArtworks(
        session,
        singleNutzenlayoutDTO: nutzenlayoutDTO,
        artworkIds: artworkIds,
        salesOrderId: salesOrderId,
        isInitialNutzenlayout: false,
      );
    } else {
      // Check if any of the artworks are already assigned to this nutzenlayout
      final existingArtworkIds = salesOrderSingleNutzenlayout.artworks!
          .map((e) => e.artwork!.id!)
          .toSet();

      // Filter out artworks that are already assigned
      final newArtworkIds = artworkIds.difference(existingArtworkIds);

      // If no new artworks to add, return
      if (newArtworkIds.isEmpty) {
        return;
      }

      final res = await session.db.transaction((transaction) async {
        // * check dimensions
        final nutzenlayoutDimensions = nutzenlayoutDTO.dimensions.first;
        final artworksMatchNutzenlayoutDimensions =
            await _artworksMatchNutzenlayoutDimensions(
          session,
          artworkIds: newArtworkIds,
          nutzenlayoutArtworkDimensions: nutzenlayoutDimensions,
          transaction: transaction,
        );

        if (!artworksMatchNutzenlayoutDimensions) {
          throw ElbException(
            message: 'Die Artworks passen nicht in den Nutzenlayout',
            exceptionType: ElbExceptionType.validationFormError,
          );
        }

        // create the junctions only for new artworks
        final listOfJts = newArtworkIds
            .map(
              (e) => SalesOrderSingleNutzenlayoutArtworkJT(
                artworkId: e,
                salesOrderSingleNutzenlayoutId:
                    salesOrderSingleNutzenlayout.id!,
              ),
            )
            .toList();
        final insertedJts =
            await SalesOrderSingleNutzenlayoutArtworkJT.db.insert(
          session,
          listOfJts,
          transaction: transaction,
        );
        await SalesOrderSingleNutzenlayoutDTO.db.attach.artworks(
          session,
          salesOrderSingleNutzenlayout,
          insertedJts,
          transaction: transaction,
        );
        final allArtworkIds = existingArtworkIds.union(newArtworkIds);
        final asLight = SalesOrderSingleNutzenlayoutLightDTO(
          nutzenlayout: nutzenlayoutDTO,
          artworks: allArtworkIds.toList(),
          salesOrderId: salesOrderId,
          salesOrderSingleNutzenlayoutId: salesOrderSingleNutzenlayout.id!,
        );
        return asLight;
      });

      salesOrderSingleNutzenlayoutLightStreamController.add(res);
    }
  }

  static Future<void> detachArtworksFromSalesOrderSingleNutzenlayout(
    Session session, {
    required int salesOrderId,
    required int nutzenlayoutId,
    required Set<int> artworkIds,
  }) async {
    final salesOrderSingleNutzenlayout =
        await SalesOrderSingleNutzenlayoutDTO.db.findFirstRow(
      session,
      where: (t) =>
          t.nutzenlayoutId.equals(nutzenlayoutId) &
          t.salesOrderId.equals(salesOrderId),
      include: SalesOrderSingleNutzenlayoutDTO.include(
        nutzenlayout: NutzenlayoutDTO.include(),
        artworks: SalesOrderSingleNutzenlayoutArtworkJT.includeList(
          include: SalesOrderSingleNutzenlayoutArtworkJT.include(
            artwork: ArtworkDTO.include(),
          ),
        ),
      ),
    );
    if (salesOrderSingleNutzenlayout == null) {
      throw Exception('Nutzenlayout not found');
    }

    final res = await session.db.transaction((transaction) async {
      // detach the artworks
      final listOfJts = artworkIds
          .map(
            (e) => SalesOrderSingleNutzenlayoutArtworkJT(
              id: salesOrderSingleNutzenlayout.artworks!
                  .firstWhere((element) => element.artwork!.id == e)
                  .id,
              artworkId: e,
              salesOrderSingleNutzenlayoutId: salesOrderSingleNutzenlayout.id!,
            ),
          )
          .toList();
      await SalesOrderSingleNutzenlayoutArtworkJT.db.delete(
        session,
        listOfJts,
        transaction: transaction,
      );

      final remainingArtworkIds = salesOrderSingleNutzenlayout.artworks!
          .map((e) => e.artwork!.id!)
          .toSet()
          .difference(artworkIds);
      if (remainingArtworkIds.isEmpty) {
        await SalesOrderSingleNutzenlayoutDTO.db.deleteRow(
          session,
          salesOrderSingleNutzenlayout,
          transaction: transaction,
        );
      }

      final asLight = SalesOrderSingleNutzenlayoutLightDTO(
        nutzenlayout: salesOrderSingleNutzenlayout.nutzenlayout!,
        artworks: remainingArtworkIds.toList(),
        salesOrderId: salesOrderId,
        salesOrderSingleNutzenlayoutId: salesOrderSingleNutzenlayout.id!,
      );
      return asLight;
    });

    salesOrderSingleNutzenlayoutLightStreamController.add(res);
  }

  static Future<bool> hasArtworkNutzenlayout(
    Session session, {
    required int artworkId,
  }) async {
    final nutzenlayoutArtwork =
        await SalesOrderSingleNutzenlayoutDTO.db.findFirstRow(
      session,
      where: (t) => t.artworks.any((e) => e.artworkId.equals(artworkId)),
    );
    return nutzenlayoutArtwork != null;
  }

  static Future<void> createMultiNutzenlayoutWithArtworks(
    Session session, {
    required NutzenlayoutDTO multiNutzenlayoutDTO,
    required Set<int> artworkIds,
    required int salesOrderId,
    required Set<NutzenlayoutArtworkDimensions> dimensions,
    required bool isExistingNutzenlayout,
  }) async {
    final (:userId, :now) = await CoreUtils.getCurrentTimeAndUser(session);

    final res = await session.db.transaction((transaction) async {
      // * create the nutzenlayout

      final cellsWithoutArtworkId = multiNutzenlayoutDTO.nutzenlayoutColumns
          .expand((e) => e.cells.where((e) => e.artworkId == null))
          .toList();
      if (cellsWithoutArtworkId.isNotEmpty) {
        throw ElbException(
          message: 'Alle Zellen müssen ein Artwork zugewiesen haben',
          exceptionType: ElbExceptionType.validationFormError,
        );
      }

      final nutzenlayoutWithResettedCells = multiNutzenlayoutDTO.copyWith(
        nutzenlayoutColumns: multiNutzenlayoutDTO.nutzenlayoutColumns
            .map(
              (e) => e.copyWith(
                cells: e.cells
                    .map(
                      (e) => e.copyWith(
                        artworkId: null,
                        artworkMasterId: null,
                      ),
                    )
                    .toList(),
              ),
            )
            .toList(), // Ensure it's a List for copyWith
      );

      var nutzenlayout = multiNutzenlayoutDTO;

      if (!isExistingNutzenlayout) {
        nutzenlayout = await NutzenlayoutDTO.db.insertRow(
          session,
          nutzenlayoutWithResettedCells.copyWith(
            createdAt: now,
            createdById: userId,
            dimensions: dimensions.toList(),
          ),
          transaction: transaction,
        );
      }

      final columnCellsToCellArtworks = multiNutzenlayoutDTO.nutzenlayoutColumns
          .map(
            (e) => e.cells.map(
              (e) => ArtworkArtworkMaster(
                artworkId: e.artworkId!,
                artworkMasterId: e.artworkMasterId!,
              ),
            ),
          )
          .toList()
          .expand((x) => x)
          .toList();

      // *create the sales order multi nutzenlayout
      final insertedSalesOrderMultiNutzenlayout =
          await SalesOrderMultiNutzenlayoutDTO.db.insertRow(
        session,
        SalesOrderMultiNutzenlayoutDTO(
          salesOrderId: salesOrderId,
          nutzenlayoutId: nutzenlayout.id!,
          createdAt: now,
          isDraft: false,
          createdById: userId,
          cellArtworkAssignments: columnCellsToCellArtworks,
        ),
        transaction: transaction,
      );

      // *add the artworks to the sales order single nutzenlayout

      // create the junctions
      final listOfJts = artworkIds
          .map(
            (e) => SalesOrderMultiNutzenlayoutArtworkJT(
              artworkId: e,
              salesOrderMultiNutzenlayoutId:
                  insertedSalesOrderMultiNutzenlayout.id!,
            ),
          )
          .toList();
      await SalesOrderMultiNutzenlayoutArtworkJT.db
          .insert(session, listOfJts, transaction: transaction);
      // attach the artworks to the sales order single nutzenlayout

      final asLight = SalesOrderMultiNutzenlayoutLightDTO(
        nutzenlayout: nutzenlayoutWithCellArtworkAssignments(
          nutzenlayout,
          insertedSalesOrderMultiNutzenlayout.cellArtworkAssignments,
        ),
        artworks: artworkIds.toList(),
        salesOrderId: salesOrderId,
        salesOrderMultiNutzenlayoutId: insertedSalesOrderMultiNutzenlayout.id!,
      );

      return asLight;
    });
    salesOrderMultiNutzenlayoutLightStreamController.add(res);

    return;
  }

  static NutzenlayoutDTO nutzenlayoutWithCellArtworkAssignments(
    NutzenlayoutDTO nutzenlayoutDTO,
    List<ArtworkArtworkMaster> cellArtworkAssignments,
  ) {
    var assignmentIndex = 0;
    final originalColumns = nutzenlayoutDTO.nutzenlayoutColumns;
    final updatedColumns = originalColumns.map((column) {
      final originalCells = column.cells;
      final updatedCells = originalCells.map((cell) {
        // Ensure we don't go out of bounds
        if (assignmentIndex >= cellArtworkAssignments.length) {
          // Consider throwing an error or logging if the lengths don't match
          // as this indicates a data inconsistency issue.
          throw StateError(
            'Mismatch between the number of cells and artwork assignments. '
            'Attempted to access assignment index $assignmentIndex, but only '
            '${cellArtworkAssignments.length} assignments are available.',
          );
        }
        final assignment = cellArtworkAssignments[assignmentIndex];
        assignmentIndex++; // Increment after using the current index for a cell
        return cell.copyWith(
          artworkId: assignment.artworkId,
          artworkMasterId: assignment.artworkMasterId,
        );
      }).toList();
      // assignmentIndex++; // Remove increment here, moved inside inner map
      return column.copyWith(cells: updatedCells);
    }).toList();
    return nutzenlayoutDTO.copyWith(nutzenlayoutColumns: updatedColumns);
  }

  static Future<bool> _artworksMatchNutzenlayoutDimensions(
    Session session, {
    required Set<int> artworkIds,
    required NutzenlayoutArtworkDimensions nutzenlayoutArtworkDimensions,
    required Transaction transaction,
  }) async {
    final serverArtworks = await ArtworkDTO.db.find(
      session,
      where: (t) => t.id.inSet(artworkIds),
      transaction: transaction,
    );
    final artworkWidths = serverArtworks.map((e) => e.width).toList();
    final artworkHeights = serverArtworks.map((e) => e.height).toList();
    final artworksMatchNutzenlayoutDimensions = artworkWidths
            .every((e) => e == nutzenlayoutArtworkDimensions.width) &&
        artworkHeights.every((e) => e == nutzenlayoutArtworkDimensions.height);
    return artworksMatchNutzenlayoutDimensions;
  }
}
