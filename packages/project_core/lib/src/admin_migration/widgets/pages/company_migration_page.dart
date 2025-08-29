import 'dart:async';

// import 'dart:io';

import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/elbdesk_crm.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:project_core/src/admin_migration/logic/migration_overlay_controller.dart';
import 'package:project_core/src/admin_migration/logic/migration_overlay_state.dart';
import 'package:project_core/src/admin_migration/logic/migration_providers.dart';
import 'package:project_core/src/admin_migration/mats_company/logic/migration_mats_company_provider.dart';
import 'package:project_core/src/admin_migration/mats_company/models/migration_mats_company.dart';
import 'package:project_core/src/admin_migration/mats_company/widgets/migration_mats_company_table.dart';
import 'package:project_core/src/admin_migration/widgets/migration_action_tile.dart';

/// Page for handling company data migrations
class CompanyMigrationPage extends HookConsumerWidget {
  /// Creates a new instance of CompanyMigrationPage
  const CompanyMigrationPage({
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
    return ScrollableCardItem.constrained(
      builder: (context, constraints) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header section
          CardSectionTitle(
            title: 'MATS Firmen Migration'.hc,
          ),
          const SizedBox(height: AppSpace.l),

          // Main content
          const _CompanyFileDropAreaAndActions(),

          const SizedBox(height: AppSpace.l),

          // Mats Company table
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 700),
            child: const MigrationMatsCompanyTable.standard(),
          ),
        ],
      ),
    );
  }
}

class _CompanyFileDropAreaAndActions extends HookConsumerWidget {
  const _CompanyFileDropAreaAndActions();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(migrationMatsCompanyControllerProvider);
    final asyncCounts = ref.watch(migrationCountsProvider);
    final isLoading = useState<bool>(false);
    final isCancelled = useState<bool>(false);

    /// Imports MATS company data from a CSV file and updates the system
    Future<void> handleFile(XFile file) async {
      isLoading.value = true;
      isCancelled.value = false;

      // Parse CSV and import data
      final result =
          await AsyncHandler.handleAsyncOperation<List<MigrationMatsCompany>>(
        context,
        () async {
          final companies = await controller.parseCsv(file);

          // Import with progress tracking
          await controller.import(
            companies,
            onProgress: (currentProgress) {
              ref.read(migrationOverlayStateProvider.notifier).updateState(
                    progress: currentProgress,
                    text: 'Importiere ${companies.length} Firmen...',
                  );
            },
            isCancelled: () => isCancelled.value,
          );

          return companies;
        },
        showErrorNotification: true,
        successMessage: 'Import erfolgreich abgeschlossen'.hc,
      );

      // Handle import result
      if (result.success) {
        final companies = result.data ?? [];
        ref
          ..invalidate(findMigrationMatsCompaniesProvider)
          ..invalidate(migrationCountsProvider);
        ref.read(migrationOverlayStateProvider.notifier).updateState(
              progress: 1,
              text: 'Import erfolgreich abgeschlossen\n${companies.length} '
                  'Firmen importiert',
            );
      } else {
        // Handle cancellation or errors
        if (isCancelled.value) {
          ref
            ..invalidate(findMigrationMatsCompaniesProvider)
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

    /// Migrates MATS companies to Contacts in the db
    Future<void> handleMigration(MigrationCounts counts) async {
      if (isLoading.value) return;

      isLoading.value = true;
      isCancelled.value = false;

      final result = await AsyncHandler.handleAsyncOperation<List<Contact>>(
        context,
        () async {
          final contacts = await controller.migrateToContacts(
            totalCount: counts.notMigratedCompanyCount,
            onProgress: (currentProgress) {
              ref.read(migrationOverlayStateProvider.notifier).updateState(
                    progress: currentProgress,
                    text:
                        'Migriere ${counts.notMigratedCompanyCount} Firmen...\n'
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
          ..invalidate(findMigrationMatsCompaniesProvider)
          ..invalidate(migrationCountsProvider);
        ref.read(migrationOverlayStateProvider.notifier).updateState(
              progress: 1,
              text: 'Migration erfolgreich abgeschlossen\n${contacts.length} '
                  'Firmen migriert',
            );
      } else {
        // Handle cancellation or errors
        if (isCancelled.value) {
          ref
            ..invalidate(findMigrationMatsCompaniesProvider)
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

    /// Creates customers from MATS companies
    Future<void> handleCustomers(MigrationCounts counts) async {
      if (isLoading.value) return;

      isLoading.value = true;
      isCancelled.value = false;

      final result = await AsyncHandler.handleAsyncOperation<List<Customer>>(
        context,
        () async {
          final customers = await controller.migrateToCustomers(
            totalCount: counts.migratedCompanyCount,
            onProgress: (currentProgress) {
              ref.read(migrationOverlayStateProvider.notifier).updateState(
                    progress: currentProgress,
                    text:
                        'Erstelle Debitoren für ${counts.migratedCompanyCount} '
                        'Firmen...\nDies kann einige Minuten dauern.',
                  );
            },
            isCancelled: () => isCancelled.value,
          );

          return customers;
        },
        showErrorNotification: true,
        successMessage: 'Debitoren erfolgreich erstellt'.hc,
      );

      // Handle customer creation result
      if (result.success) {
        final customers = result.data ?? [];
        ref
          ..invalidate(findMigrationMatsCompaniesProvider)
          ..invalidate(migrationCountsProvider);
        ref.read(migrationOverlayStateProvider.notifier).updateState(
              progress: 1,
              text: 'Migration erfolgreich abgeschlossen\n${customers.length} '
                  'Debitoren erstellt',
            );
      } else {
        // Handle cancellation or errors
        if (isCancelled.value) {
          ref
            ..invalidate(findMigrationMatsCompaniesProvider)
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

    /// Assigns employees to companies
    Future<void> handleEmployeeAssignment(MigrationCounts counts) async {
      if (isLoading.value) return;

      isLoading.value = true;
      isCancelled.value = false;

      final result = await AsyncHandler.handleAsyncOperation<int>(
        context,
        () async {
          final assignmentCount = await controller.assignEmployeesToCompanies(
            availableCompanyCount: counts.migratedCompanyCount,
            availablePersonCount: counts.migratedPersonCount,
            onProgress: (currentProgress) {
              ref.read(migrationOverlayStateProvider.notifier).updateState(
                    progress: currentProgress,
                    text:
                        'Ordne Mitarbeiter den ${counts.migratedCompanyCount} '
                        'Unternehmen zu...\nDies kann einige Minuten dauern.',
                  );
            },
            isCancelled: () => isCancelled.value,
          );

          return assignmentCount;
        },
        showErrorNotification: true,
        successMessage: 'Mitarbeiter erfolgreich zugeordnet'.hc,
      );

      // Handle employee assignment result
      if (result.success) {
        final assignmentCount = result.data ?? 0;
        ref
          ..invalidate(findMigrationMatsCompaniesProvider)
          ..invalidate(migrationCountsProvider);
        ref.read(migrationOverlayStateProvider.notifier).updateState(
              progress: 1,
              text: 'Zuordnung erfolgreich abgeschlossen\n$assignmentCount '
                  'Mitarbeiter zugeordnet',
            );
      } else {
        // Handle cancellation or errors
        if (isCancelled.value) {
          ref
            ..invalidate(findMigrationMatsCompaniesProvider)
            ..invalidate(migrationCountsProvider);
          ref.read(migrationOverlayStateProvider.notifier).updateState(
                progress: 0,
                text: 'Zuordnung abgebrochen',
              );
        } else {
          ref.read(migrationOverlayStateProvider.notifier).updateState(
                progress: 0,
                text: 'Zuordnung fehlgeschlagen: ${result.exception}',
              );
        }
      }

      // Small delay to ensure all providers are reloaded
      await Future<void>.delayed(const Duration(milliseconds: 500));

      isLoading.value = false;
    }

    Future<void> handleCompanyDepartments(MigrationCounts counts) async {
      if (isLoading.value) return;

      isLoading.value = true;
      isCancelled.value = false;

      final result = await AsyncHandler.handleAsyncOperation<int>(
        context,
        () async {
          final departmentCount = await controller.createDepartments(
            availableDepartmentCount: counts.departmentCount,
            onProgress: (currentProgress) {
              ref.read(migrationOverlayStateProvider.notifier).updateState(
                    progress: currentProgress,
                    text: 'Erstelle Abteilungen aus ${counts.departmentCount} '
                        'Einträgen...\nDies kann einige Minuten dauern.',
                  );
            },
            isCancelled: () => isCancelled.value,
          );

          return departmentCount;
        },
        showErrorNotification: true,
        successMessage: 'Abteilungen erfolgreich erstellt'.hc,
      );

      // Handle department creation result
      if (result.success) {
        final departmentCount = result.data ?? 0;
        ref
          ..invalidate(findMigrationMatsCompaniesProvider)
          ..invalidate(migrationCountsProvider);
        ref.read(migrationOverlayStateProvider.notifier).updateState(
              progress: 1,
              text: 'Abteilungen erfolgreich erstellt\n$departmentCount '
                  'Abteilungen erstellt',
            );
      } else {
        // Handle cancellation or errors
        if (isCancelled.value) {
          ref
            ..invalidate(findMigrationMatsCompaniesProvider)
            ..invalidate(migrationCountsProvider);
          ref.read(migrationOverlayStateProvider.notifier).updateState(
                progress: 0,
                text: 'Abteilungen erstellen abgebrochen',
              );
        } else {
          ref.read(migrationOverlayStateProvider.notifier).updateState(
                progress: 0,
                text:
                    'Abteilungen erstellen fehlgeschlagen: ${result.exception}',
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
                  'Import Firmen'.hc,
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
                  'Import Firmen'.hc,
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

          // Company info and actions section
          AppText(
            'Verfügbare Firmen: ${counts.totalCompanyCount} '
                    '(${counts.notMigratedCompanyCount} nicht migriert, '
                    '${counts.migratedCompanyCount} migriert)'
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
                    description: 'Konvertiert MATS Firmen zu Kontakten'.hc,
                    icon: AppIcons.contact,
                    isEnabled:
                        !isLoading.value && counts.notMigratedCompanyCount > 0,
                    isLoading: isLoading.value,
                    onTap: () async {
                      await ref
                          .read(migrationOverlayControllerProvider)
                          .showMigrationOverlay(
                            context,
                            'Migration Firmen'.hc,
                            () => handleMigration(counts),
                            isLoading,
                            isCancelled,
                          );
                    },
                  ),
                  const SizedBox(width: AppSpace.m),
                  MigrationActionTile(
                    title: 'Debitoren erstellen'.hc,
                    description: 'Erstellt Debitoren aus MATS Firmen'.hc,
                    icon: AppIcons.customer,
                    isEnabled:
                        !isLoading.value && counts.migratedCompanyCount > 0,
                    isLoading: isLoading.value,
                    onTap: () async {
                      await ref
                          .read(migrationOverlayControllerProvider)
                          .showMigrationOverlay(
                            context,
                            'Debitoren erstellen'.hc,
                            () => handleCustomers(counts),
                            isLoading,
                            isCancelled,
                          );
                    },
                  ),
                  const SizedBox(width: AppSpace.m),
                  MigrationActionTile(
                    title: 'Abteilungen erstellen'.hc,
                    description: 'Erstellt Abteilungen aus MATS Einträgen'.hc,
                    icon: AppIcons.folder,
                    isEnabled:
                        !isLoading.value && counts.migratedCompanyCount > 0,
                    isLoading: isLoading.value,
                    onTap: () async {
                      await ref
                          .read(migrationOverlayControllerProvider)
                          .showMigrationOverlay(
                            context,
                            'Abteilungen erstellen'.hc,
                            () => handleCompanyDepartments(counts),
                            isLoading,
                            isCancelled,
                          );
                    },
                  ),
                  const SizedBox(width: AppSpace.m),
                  MigrationActionTile(
                    title: 'Mitarbeiter zuordnen'.hc,
                    description: 'Ordnet Mitarbeiter den Firmen zu'.hc,
                    icon: AppIcons.employee,
                    isEnabled: !isLoading.value &&
                        counts.migratedCompanyCount > 0 &&
                        counts.migratedPersonCount > 0,
                    isLoading: isLoading.value,
                    onTap: () async {
                      await ref
                          .read(migrationOverlayControllerProvider)
                          .showMigrationOverlay(
                            context,
                            'Mitarbeiter zuordnen'.hc,
                            () => handleEmployeeAssignment(counts),
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
      ),
    );
  }
}
