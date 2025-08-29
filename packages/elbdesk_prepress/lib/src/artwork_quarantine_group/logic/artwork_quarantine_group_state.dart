import 'dart:async';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/elbdesk_crm.dart';
import 'package:elbdesk_prepress/elbdesk_prepress.dart';
import 'package:elbdesk_prepress/src/artwork_quarantine_group/logic/data_import_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_core/project_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'artwork_quarantine_group_state.g.dart';

/// Stream controller for duplicate attachment notifications
///
/// Broadcasts notifications when duplicate files are detected while adding
/// attachments to the group.
/// Used to trigger color animation highlight in attachment tiles.
/// This way the user can see which attachment is the duplicate.
@riverpod
StreamController<({String uuid, List<String> paths})>
    artworkQuarantineGroupDuplicateAttachmentsController(
  Ref ref,
  int entityId,
  String sessionId,
) {
  final controller =
      StreamController<({String uuid, List<String> paths})>.broadcast();

  // Proper disposal when provider is disposed
  ref.onDispose(controller.close);

  return controller;
}

/// Artwork Quarantine Group State
///
/// This state is used to manage artwork quarantine group items
@riverpod
class ArtworkQuarantineGroupState extends _$ArtworkQuarantineGroupState
    implements EntityState<ArtworkQuarantineGroup> {
  ///@nodoc
  ArtworkQuarantineGroupState();

  late final EntityStateManager<ArtworkQuarantineGroup> _stateManager;

  void _initializeStateManager(int entityId, String sessionId) {
    _stateManager = EntityStateManager<ArtworkQuarantineGroup>(
      setLoadingState: () => state = const AsyncLoading(),
      setDataState: (ArtworkQuarantineGroup group) => state = AsyncData(group),
      setErrorState: (Object error, StackTrace stackTrace) =>
          state = AsyncError(error, stackTrace),
      fetchAndLockFn: () => ref
          .read(artworkQuarantineGroupRepositoryProvider)
          .fetchAndLock(entityId, sessionId),
      releaseFn: () => ref
          .read(artworkQuarantineGroupRepositoryProvider)
          .release(entityId, sessionId),
      fetchByIdFn: () => ref
          .read(artworkQuarantineGroupRepositoryProvider)
          .fetchById(entityId),
      updateWithReleaseFn: () =>
          ref.read(artworkQuarantineGroupRepositoryProvider).update(
                entity: state.requireValue,
                release: true,
                sessionId: sessionId,
              ),
    );
  }

  @override
  Future<ArtworkQuarantineGroup> build(int entityId, String sessionId) async {
    _initializeStateManager(entityId, sessionId);

    // Listen to duplicate notifications stream for proper lifecycle management
    ref.listen(
      artworkQuarantineGroupDuplicateAttachmentsControllerProvider(
        entityId,
        sessionId,
      ),
      (previous, next) {
        // The stream controller is available, but we don't need to do anything
        // here as we access it directly in the methods that need it
      },
    );

    return _stateManager.build(
      id: entityId,
      sessionId: sessionId,
      ref: ref,
    );
  }

  @override
  Future<void> refetchWithLock() {
    return _stateManager.refetchWithLock();
  }

  @override
  Future<void> refetchWithoutLock() {
    return _stateManager.refetchWithoutLock();
  }

  @override
  Future<void> saveAndUnlockAndRefetch() async {
    return _stateManager.saveAndUnlockAndRefetch();
  }

  @override
  void updateMetaAfterSave() {
    final userId = ref.read(authUserStateProvider)!.id!;
    state = AsyncData(
      state.requireValue.copyWith(
        meta: state.requireValue.meta.copyWith(
          lastModifiedAt: DateTime.now(),
          lastModifiedById: userId,
          isDraft: false,
        ),
      ),
    );
  }

  // ==========================================================================
  // DATA IMPORT FUNCTIONALITY
  // ==========================================================================

  /// Update customer info
  Future<void> updateCustomer(int customerId) async {
    final customer =
        await ref.read(fetchCustomerProvider(customerId: customerId).future);

    final group = state.requireValue;
    final updatedGroup = group.copyWith(customer: customer);
    state = AsyncData(updatedGroup);
  }

  /// Update group description
  void updateGroupDescription(String description) {
    final group = state.requireValue;
    final updatedGroup = group.copyWith(description: description);
    state = AsyncData(updatedGroup);
  }

  /// Update group width (template for new artworks)
  void updateGroupWidth(double width) {
    final group = state.requireValue;
    final updatedGroup = group.copyWith(width: width);
    state = AsyncData(updatedGroup);
  }

  /// Update group height (template for new artworks)
  void updateGroupHeight(double height) {
    final group = state.requireValue;
    final updatedGroup = group.copyWith(height: height);
    state = AsyncData(updatedGroup);
  }

  /// Update group corner radius (template for new artworks)
  void updateGroupCornerRadius(double? cornerRadius) {
    final group = state.requireValue;
    final updatedGroup = group.copyWith(cornerRadius: cornerRadius);
    state = AsyncData(updatedGroup);
  }

  /// Update group print process type (template for new artworks)
  void updateGroupPrintProcessType(ArtworkPrintProcessType? printProcessType) {
    final group = state.requireValue;
    final updatedGroup = group.copyWith(printProcessType: printProcessType);
    state = AsyncData(updatedGroup);
  }

  /// Update group artwork type
  void updateGroupType(ArtworkType? artworkType) {
    final group = state.requireValue;
    final updatedGroup = group.copyWith(artworkType: artworkType);
    state = AsyncData(updatedGroup);
  }

  /// Update group assigned user
  void updateAssignedUser(LightUser? user) {
    final group = state.requireValue;
    final updatedGroup = group.copyWith(assignedUser: user);
    state = AsyncData(updatedGroup);
  }

  /// Apply group settings to all child artworks
  void applyGroupSettingsToAllArtworks() {
    final group = state.requireValue;
    final artworks = group.artworkQuarantines ?? <ArtworkQuarantine>[];

    // Only apply to artworks with status 'open'
    for (final artwork in artworks) {
      if (artwork.general.status == ArtworkQuarantineGroupStatus.open) {
        final updatedArtwork = artwork.copyWith(
          general: artwork.general.copyWith(
            type: group.artworkType,
            printProcessType: group.printProcessType,
            productType: group.productType,
          ),
          artworkData: artwork.artworkData.copyWith(
            width: group.width,
            height: group.height,
            cornerRadius: group.cornerRadius,
          ),
        );
        updateArtwork(artwork.general.quarantineUuid, updatedArtwork);
      }
    }
  }

  /// Update after group was sent to AE
  ///
  /// This updates the groups and the sent artwork quarantines status and some
  /// upload metadata.
  ///
  /// The updated group and quarantines are now awaiting the result from the
  /// AE -> This is being awaited.
  /// The group status will automatically be updated when all quarantines
  /// receive their new status "done".
  void updateAfterAeUpload(List<ArtworkQuarantine> sentQuarantines) {
    final group = state.requireValue;

    // Update group status and upload metadata
    final updatedGroup = group.copyWith(
      sendToAeAt: DateTime.now(),
      sendToAeBy: ref.read(authUserStateProvider)?.id,
      status: ArtworkQuarantineGroupStatus.todo,
    );

    state = AsyncData(updatedGroup);

    // Update artworks quarantines that are in the sentQuarantines list
    // to status "todo"
    // These were actually sent to the AE and are now awaiting analysis
    final artworks = group.artworkQuarantines ?? <ArtworkQuarantine>[];
    final sentQuarantineUuids = sentQuarantines
        .map((quarantine) => quarantine.general.quarantineUuid)
        .toSet();

    for (final artwork in artworks) {
      if (sentQuarantineUuids.contains(artwork.general.quarantineUuid)) {
        final updatedArtwork = artwork.copyWith(
          general: artwork.general
              .copyWith(status: ArtworkQuarantineGroupStatus.todo),
        );
        updateArtwork(artwork.general.quarantineUuid, updatedArtwork);
      }
    }
  }

  /// * Artwork Management *

  /// Add artworks to state
  void addArtworks(List<ArtworkQuarantine> artworks) {
    if (artworks.isEmpty) return;

    final group = state.requireValue;
    final existingArtworks = group.artworkQuarantines ?? <ArtworkQuarantine>[];

    // Check for duplicate filenames
    for (final newArtwork in artworks) {
      final newFileName = newArtwork.fileName;
      if (newFileName != null) {
        final isDuplicate = existingArtworks.any((existing) {
          final existingFileName = existing.fileName;
          return existingFileName != null &&
              existingFileName == newFileName &&
              existing.meta.deletedAt == null;
        });

        if (isDuplicate) {
          throw ElbException(
            exceptionType: ElbExceptionType.conflict,
            message: 'File "$newFileName" already exists in the group',
          );
        }
      }
    }

    final updatedArtworks = [
      ...existingArtworks,
      ...artworks,
    ];
    final updatedGroup = group.copyWith(artworkQuarantines: updatedArtworks);
    state = AsyncData(updatedGroup);
  }

  /// Add single artwork to state
  void addArtwork(ArtworkQuarantine artwork) {
    addArtworks([artwork]);
  }

  /// Update single artwork in state
  void updateArtwork(String uuid, ArtworkQuarantine updatedArtwork) {
    final group = state.requireValue;
    final artworks = [...(group.artworkQuarantines ?? <ArtworkQuarantine>[])];
    final index = artworks.indexWhere((a) => a.general.quarantineUuid == uuid);

    if (index != -1) {
      artworks[index] = updatedArtwork;
      final updatedGroup = group.copyWith(artworkQuarantines: artworks);
      state = AsyncData(updatedGroup);
    }
  }

  /// Process files and add them to state using the new architecture
  Future<void> processAndAddFiles(
    List<String> filePaths, {
    SystemFileAttachmentType? attachmentType,
  }) async {
    if (filePaths.isEmpty) return;

    try {
      final controller = await ref.read(dataImportControllerProvider.future);
      final group = state.requireValue;

      // 1. Use controller to process files into data
      final processedData = await controller.processFiles(
        filePaths,
        group,
        attachmentType: attachmentType,
      );

      // 2. Add artworks to state
      if (processedData.artworks.isNotEmpty) {
        addArtworks(processedData.artworks);
      }

      // 4. Add attachments to state
      if (processedData.attachments.isNotEmpty) {
        addAttachments(processedData.attachments);
      }
    } catch (e) {
      dlog('Error processing files: $e');
      rethrow;
    }
  }

  /// Updates artwork type
  void updateArtworkType(String quarantineUuid, ArtworkType? type) {
    _updateArtworkField(
      quarantineUuid,
      (artwork) =>
          artwork.copyWith(general: artwork.general.copyWith(type: type)),
    );
  }

  /// Updates artwork keywords
  void updateArtworkKeywords(String quarantineUuid, String keywords) {
    _updateArtworkField(
      quarantineUuid,
      (artwork) => artwork.copyWith(
        general: artwork.general.copyWith(keywords: keywords),
      ),
    );
  }

  /// Updates artwork description
  void updateArtworkDescription(String quarantineUuid, String description) {
    _updateArtworkField(
      quarantineUuid,
      (artwork) => artwork.copyWith(
        general: artwork.general.copyWith(description: description),
      ),
    );
  }

  /// Updates artwork width
  void updateArtworkWidth(String quarantineUuid, double? width) {
    _updateArtworkField(
      quarantineUuid,
      (artwork) => artwork.copyWith(
        artworkData: artwork.artworkData.copyWith(width: width),
      ),
    );
  }

  /// Updates artwork height
  void updateArtworkHeight(String quarantineUuid, double? height) {
    _updateArtworkField(
      quarantineUuid,
      (artwork) => artwork.copyWith(
        artworkData: artwork.artworkData.copyWith(height: height),
      ),
    );
  }

  /// Updates artwork corner radius
  void updateArtworkCornerRadius(String quarantineUuid, double? cornerRadius) {
    _updateArtworkField(
      quarantineUuid,
      (artwork) => artwork.copyWith(
        artworkData: artwork.artworkData.copyWith(cornerRadius: cornerRadius),
      ),
    );
  }

  /// Updates artwork print process type
  void updateArtworkPrintProcessType(
    String quarantineUuid,
    ArtworkPrintProcessType? printProcessType,
  ) {
    _updateArtworkField(
      quarantineUuid,
      (artwork) => artwork.copyWith(
        general: artwork.general.copyWith(printProcessType: printProcessType),
      ),
    );
  }

  /// Updates artwork product type
  void updateArtworkProductType(
    String quarantineUuid,
    ProductType? productType,
  ) {
    _updateArtworkField(
      quarantineUuid,
      (artwork) => artwork.copyWith(
        general: artwork.general.copyWith(productType: productType),
      ),
    );
  }

  /// Generic method to update artwork field
  void _updateArtworkField(
    String quarantineUuid,
    ArtworkQuarantine Function(ArtworkQuarantine) updateFn,
  ) {
    final group = state.requireValue;
    final artworks = [...(group.artworkQuarantines ?? <ArtworkQuarantine>[])];
    final index =
        artworks.indexWhere((a) => a.general.quarantineUuid == quarantineUuid);

    if (index != -1) {
      artworks[index] = updateFn(artworks[index]);
      final updatedGroup = group.copyWith(artworkQuarantines: artworks);
      state = AsyncData(updatedGroup);
    }
  }

  /// Removes an artwork from the group
  void removeArtwork(String quarantineUuid) {
    final group = state.requireValue;
    final artworks = group.artworkQuarantines ?? <ArtworkQuarantine>[];

    // Find the artwork to remove
    final artworkIndex = artworks.indexWhere(
      (a) => a.general.quarantineUuid == quarantineUuid,
    );

    if (artworkIndex == -1) return;

    final artwork = artworks[artworkIndex];

    // Check if artwork is established in DB (has meta.id)
    if (artwork.meta.id != null) {
      // Mark as deleted by setting deletedAt
      // When saving the group, the quarantines will be checked for this and
      // then properly set to deleted in the backend as well (time and userId)
      final updatedArtwork = artwork.copyWith(
        meta: artwork.meta.copyWith(
          deletedAt: DateTime.now(),
        ),
      );

      // Update the artwork in the list
      final updatedArtworks = [...artworks];
      updatedArtworks[artworkIndex] = updatedArtwork;

      final updatedGroup = group.copyWith(artworkQuarantines: updatedArtworks);
      state = AsyncData(updatedGroup);
    } else {
      // Remove from state if not yet established in DB
      final updatedArtworks = artworks
          .where((a) => a.general.quarantineUuid != quarantineUuid)
          .toList();

      final updatedGroup = group.copyWith(artworkQuarantines: updatedArtworks);
      state = AsyncData(updatedGroup);
    }
  }

  /// Get artwork by UUID
  ArtworkQuarantine? getArtwork(String uuid) {
    final artworks =
        state.valueOrNull?.artworkQuarantines ?? <ArtworkQuarantine>[];
    try {
      return artworks.firstWhere((a) => a.general.quarantineUuid == uuid);
    } catch (_) {
      return null;
    }
  }

  /// * Attachment Management *

  /// Add attachments to state
  void addAttachments(List<SystemFile> attachments) {
    if (attachments.isEmpty) return;

    final group = state.requireValue;
    final currentAttachments = group.attachments ?? <SystemFile>[];

    // Get the duplicate notifications controller
    final duplicatesController = ref.read(
      artworkQuarantineGroupDuplicateAttachmentsControllerProvider(
        entityId,
        sessionId,
      ),
    );

    // Check for duplicates and filter them out
    final newAttachments = attachments.where((attachment) {
      final isDuplicate = currentAttachments
          .any((existing) => existing.path == attachment.path);
      if (isDuplicate) {
        duplicatesController
            .add((uuid: const Uuid().v4(), paths: [attachment.path]));
      }
      return !isDuplicate;
    }).toList();

    if (newAttachments.isNotEmpty) {
      final updatedAttachments = [...currentAttachments, ...newAttachments];
      final updatedGroup = group.copyWith(attachments: updatedAttachments);
      state = AsyncData(updatedGroup);
    }
  }

  /// Add single attachment to state
  void addAttachment(SystemFile attachment) {
    final group = state.requireValue;
    final currentAttachments = group.attachments ?? <SystemFile>[];

    final isDuplicate =
        currentAttachments.any((existing) => existing.path == attachment.path);
    if (isDuplicate) {
      ref
          .read(
        artworkQuarantineGroupDuplicateAttachmentsControllerProvider(
          entityId,
          sessionId,
        ),
      )
          .add((uuid: const Uuid().v4(), paths: [attachment.path]));
      return;
    }

    addAttachments([attachment]);
  }

  /// Removes an attachment from the group
  void removeAttachment(SystemFile file) {
    final group = state.requireValue;
    final currentAttachments = group.attachments ?? <SystemFile>[];

    final updatedAttachments = currentAttachments
        .where((attachment) => attachment.id != file.id)
        .toList();

    final updatedGroup = group.copyWith(attachments: updatedAttachments);
    state = AsyncData(updatedGroup);
  }

  /// * Group Settings *

  /// Updates group type setting
  void updateType(ArtworkQuarantineGroupType type) {
    final group = state.requireValue;
    final updatedGroup = group.copyWith(type: type);
    state = AsyncData(updatedGroup);
  }

  /// Update group product type
  void updateProductType(ProductType? type) {
    final group = state.requireValue;
    final updatedGroup = group.copyWith(productType: type);
    state = AsyncData(updatedGroup);
  }

  /// Sets the selected product series
  void setSelectedProductSeries(int? productSeriesId) {
    final group = state.requireValue;
    final updatedGroup =
        group.copyWith(selectedProductSeriesId: productSeriesId);
    state = AsyncData(updatedGroup);
  }

  /// Updates the status of the group
  void updateStatus(ArtworkQuarantineGroupStatus status) {
    final group = state.requireValue;
    final updatedGroup = group.copyWith(status: status);
    state = AsyncData(updatedGroup);
  }

  /// Updates the artwork type of the group
  void updateAllArtworkTypes(ArtworkType type) {
    final group = state.requireValue;
    final artworks = group.artworkQuarantines ?? <ArtworkQuarantine>[];
    final updatedArtworks = artworks
        .map((a) => a.copyWith(general: a.general.copyWith(type: type)))
        .toList();
    final updatedGroup = group.copyWith(artworkQuarantines: updatedArtworks);
    state = AsyncData(updatedGroup);
  }

  /// Get all artwork types
  ///
  /// Returns the type of the group if its uniform. Otherwise returns null.
  ArtworkType? getAllArtworkTypes() {
    final group = state.requireValue;
    final artworks = group.artworkQuarantines ?? <ArtworkQuarantine>[];
    final types = artworks.map((a) => a.general.type).toList();
    if (types.every((t) => t == types.first)) {
      return types.firstOrNull;
    }
    return null;
  }

  /// Get Artwork Type utility
  ArtworkType? getArtworkType(String uuid) {
    final artworks =
        state.valueOrNull?.artworkQuarantines ?? <ArtworkQuarantine>[];
    final artwork =
        artworks.firstWhere((a) => a.general.quarantineUuid == uuid);
    return artwork.general.type;
  }

  /// * State Management *

  /// Clears all artworks and attachments but keeps group settings
  void clear() {
    final group = state.requireValue;
    final clearedGroup = group.copyWith(
      artworkQuarantines: <ArtworkQuarantine>[],
      attachments: <SystemFile>[],
    );
    state = AsyncData(clearedGroup);
  }

  /// Update state with a new group (useful after file operations)
  void updateFromGroup(ArtworkQuarantineGroup updatedGroup) {
    state = AsyncData(updatedGroup);
  }
}
