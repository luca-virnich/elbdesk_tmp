import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_core/src/admin_migration/mats_person/widgets/migration_mats_person_table.dart';

/// Page that displays the MigrationMatsPerson table
class MigrationMatsPersonTablePage extends HookConsumerWidget {
  /// Creates a new instance of MigrationMatsPersonTablePage
  const MigrationMatsPersonTablePage({
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
    return const CardTablePadding(
      child: MigrationMatsPersonTable.standard(),
    );
  }
}
