import 'dart:async';

// import 'dart:io';

import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/elbdesk_crm.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:project_core/src/admin_migration/logic/migration_overlay_controller.dart';
import 'package:project_core/src/admin_migration/logic/migration_overlay_state.dart';
import 'package:project_core/src/admin_migration/logic/migration_providers.dart';
import 'package:project_core/src/admin_migration/mats_person/logic/migration_mats_person_provider.dart';
import 'package:project_core/src/admin_migration/mats_person/models/migration_mats_person.dart';
import 'package:project_core/src/admin_migration/mats_person/widgets/migration_mats_person_table.dart';
import 'package:project_core/src/admin_migration/widgets/migration_action_tile.dart';

/// Page for handling person data migrations
class PersonMigrationPage extends HookConsumerWidget {
  /// Creates a new instance of PersonMigrationPage
  const PersonMigrationPage({
    required this.floatingWindowFocus,
    required this.navigatorKey,
    required this.floatingWindowId,
    super.key,
  });

  /// The focus node for the floating window
  final FocusNode floatingWindowFocus;

  /// The navigator key for the floating window
  final GlobalKey<NavigatorState> navigatorKey;

  /// The id of the floating window
  final String floatingWindowId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = useState<bool>(false);
    final isCancelled = useState<bool>(false);

    return ScrollableCardItem.constrained(
      builder: (context, constraints) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header section
          CardSectionTitle(
            title: 'MATS Personen Migration'.hc,
          ),
          const SizedBox(height: AppSpace.l),

          // Main content
          _PersonFileDropAreaAndActions(
            isLoading: isLoading,
            isCancelled: isCancelled,
          ),

          const SizedBox(height: AppSpace.l),

          // Mats Person table
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 700),
            child: const MigrationMatsPersonTable.standard(),
          ),
        ],
      ),
    );
  }
}

class _PersonFileDropAreaAndActions extends ConsumerWidget {
  const _PersonFileDropAreaAndActions({
    required this.isLoading,
    required this.isCancelled,
  });

  final ValueNotifier<bool> isLoading;
  final ValueNotifier<bool> isCancelled;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(migrationMatsPersonControllerProvider);
    final asyncCounts = ref.watch(migrationCountsProvider);

    /// Imports MATS person data from a CSV file and updates the system
    Future<void> handleFile(XFile file) async {
      isLoading.value = true;
      isCancelled.value = false;

      // Parse CSV and import data
      final result =
          await AsyncHandler.handleAsyncOperation<List<MigrationMatsPerson>>(
        context,
        () async {
          dlog('Pre parsing');

          final persons = await controller.parseCsv(file);

          dlog('Post parsing');

          // Import with progress tracking
          await controller.import(
            persons,
            onProgress: (currentProgress) {
              ref.read(migrationOverlayStateProvider.notifier).updateState(
                    progress: currentProgress,
                    text: 'Importiere ${persons.length} Kontakte...',
                  );
            },
            isCancelled: () => isCancelled.value,
          );

          return persons;
        },
        showErrorNotification: true,
        successMessage: 'Import erfolgreich abgeschlossen'.hc,
      );

      // Handle import result
      if (result.success) {
        final persons = result.data ?? [];
        ref
          ..invalidate(findMigrationMatsPersonsProvider)
          ..invalidate(migrationCountsProvider);
        ref.read(migrationOverlayStateProvider.notifier).updateState(
              progress: 1,
              text: 'Import erfolgreich abgeschlossen\n${persons.length} '
                  'Kontakte importiert',
            );
      } else {
        // Handle cancellation or errors
        if (isCancelled.value) {
          ref
            ..invalidate(findMigrationMatsPersonsProvider)
            ..invalidate(migrationCountsProvider);
          ref.read(migrationOverlayStateProvider.notifier).updateState(
                progress: 0,
                text: 'Import abgebrochen',
              );
        } else {
          ref.read(migrationOverlayStateProvider.notifier).updateState(
                progress: 0,
                text: result.exception
                        .toString()
                        .contains('Missing required headers')
                    ? 'Falsche Header - Möglicherweise falsche Datei '
                        'ausgewählt: Personen / Unternehmen'
                    : 'Import fehlgeschlagen: ${result.exception}',
              );
        }
      }

      // Small delay to ensure all providers are reloaded
      await Future<void>.delayed(const Duration(milliseconds: 500));

      isLoading.value = false;
    }

    /// Migrates MATS persons to Contacts in the db
    Future<void> handleMigration(MigrationCounts counts) async {
      if (isLoading.value) return;

      isLoading.value = true;
      isCancelled.value = false;

      // Start migration process
      final result = await AsyncHandler.handleAsyncOperation<List<Contact>>(
        context,
        () async {
          // Migrate with progress tracking and cancellation support
          final contacts = await controller.migrateToContacts(
            totalCount: counts.notMigratedPersonCount,
            onProgress: (currentProgress) {
              ref.read(migrationOverlayStateProvider.notifier).updateState(
                    progress: currentProgress,
                    text: 'Migriere ${counts.notMigratedPersonCount} '
                        'Kontakte...\n'
                        'Dies kann einige Minuten dauern.',
                  );
            },
            isCancelled: () => isCancelled.value,
          );

          return contacts;
        },
        showErrorNotification: true,
        successMessage: 'Migration erfolgreich abgeschlossen'.hc,
      );

      // Handle migration result
      if (result.success) {
        final contacts = result.data ?? [];
        ref
          ..invalidate(findMigrationMatsPersonsProvider)
          ..invalidate(migrationCountsProvider);
        ref.read(migrationOverlayStateProvider.notifier).updateState(
              progress: 1,
              text: 'Migration erfolgreich abgeschlossen\n${contacts.length} '
                  'Kontakte migriert',
            );
      } else {
        // Handle cancellation or errors
        if (isCancelled.value) {
          ref
            ..invalidate(findMigrationMatsPersonsProvider)
            ..invalidate(migrationCountsProvider);
          ref.read(migrationOverlayStateProvider.notifier).updateState(
                progress: 0,
                text: 'Migration abgebrochen',
              );
        } else {
          ref.read(migrationOverlayStateProvider.notifier).updateState(
                progress: 0,
                text: 'Migration fehlgeschlagen: ${result.exception}',
              );
        }
      }

      // Small delay to ensure all providers are reloaded
      await Future<void>.delayed(const Duration(milliseconds: 500));

      isLoading.value = false;
    }

    return asyncCounts.fastWhen(
      data: (counts) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // File upload section
          AppFileDropArea(
            height: 120,
            backgroundColor: context.appTheme.generalColors.background,
            icon: AppIcons.upload_file,
            isEnabled: !isLoading.value,
            onDragDone: (details) async {
              if (details.files.isNotEmpty) {
                await ref
                    .read(migrationOverlayControllerProvider)
                    .showMigrationOverlay(
                  context,
                  'Import Kontakte'.hc,
                  () async {
                    await handleFile(XFile(details.files.first.path));
                  },
                  isLoading,
                  isCancelled,
                );
              }
            },
            onPressed: () async {
              final filePickerController =
                  ref.read(filePickerControllerProvider);
              final file = await filePickerController.pickCsvFile();
              if (file != null && context.mounted) {
                await ref
                    .read(migrationOverlayControllerProvider)
                    .showMigrationOverlay(
                  context,
                  'Import Kontakte'.hc,
                  () async {
                    await handleFile(XFile(file.path));
                  },
                  isLoading,
                  isCancelled,
                );
              }
            },
            title1: 'Zum Hochladen klicken'.hc,
            title2: 'oder per Drag & Drop'.hc,
            subTitle: 'Nur .csv Dateien werden akzeptiert'.hc,
            isLoading: isLoading.value,
          ),
          const SizedBox(height: AppSpace.l),

          // Person info and actions section
          if (counts.notMigratedPersonCount > 0 ||
              counts.migratedPersonCount > 0) ...[
            AppText(
              'Verfügbare Kontakte: ${counts.notMigratedPersonCount + counts.migratedPersonCount} '
                      '(${counts.notMigratedPersonCount} nicht migriert,'
                      ' ${counts.migratedPersonCount} migriert)'
                  .hc,
              style: context.appTheme.textStyles.h3,
            ),
            const SizedBox(height: AppSpace.m),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 1,
                itemBuilder: (context, index) => Row(
                  children: [
                    MigrationActionTile(
                      title: 'Zu Kontakten migrieren'.hc,
                      description: 'Konvertiert MATS Personen zu Kontakten'.hc,
                      icon: AppIcons.contact,
                      isEnabled:
                          !isLoading.value && counts.notMigratedPersonCount > 0,
                      isLoading: isLoading.value,
                      onTap: () async {
                        await ref
                            .read(migrationOverlayControllerProvider)
                            .showMigrationOverlay(
                              context,
                              'Migration Kontakte'.hc,
                              () => handleMigration(counts),
                              isLoading,
                              isCancelled,
                            );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
