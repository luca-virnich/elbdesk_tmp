import 'dart:async';

import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_core/src/admin_migration/widgets/migration_loading_overlay.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'migration_overlay_controller.g.dart';

/// Table Controller Provider
@riverpod
MigrationOverlayController migrationOverlayController(Ref ref) {
  return const MigrationOverlayController();
}

/// Controller for handling migration overlays
class MigrationOverlayController {
  /// Creates a new instance of MigrationOverlayController
  const MigrationOverlayController();

  /// Shows the migration overlay and executes the given migration method
  Future<void> showMigrationOverlay(
    BuildContext context,
    String title,
    Future<void> Function() migrationMethod,
    ValueNotifier<bool> isMigrating,
    ValueNotifier<bool> isCancelled,
  ) async {
    unawaited(
      showElbDialog<void>(
        context: context,
        navigatorKey: AppNavigatorKeys.appRootNavigatorKey,
        isDismissible: false,
        child: MigrationLoadingOverlay(
          title: title,
          onCancelled: () {
            isCancelled.value = true;
            isMigrating.value = false;
          },
        ),
      ),
    );

    await migrationMethod();
    if (context.mounted) {
      Navigator.of(context).pop();
    }
  }
}
