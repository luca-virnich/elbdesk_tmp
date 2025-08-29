import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_sales/elbdesk_sales.dart';
import 'package:elbdesk_sales/src/sales_order/_export_sales_order.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Sales Order Card Footer
///
/// The footer of the [SalesOrderCard]
class SalesOrderCardFooter extends ConsumerWidget {
  /// Sales Order Card Footer
  ///
  /// The footer of the [SalesOrderCard]
  const SalesOrderCardFooter({
    required this.isSaving,
    required this.onSavePressed,
    required this.sessionId,
    required this.salesOrderId,
    required this.formKey,
    required this.readOnly,
    required this.navigatorKey,
    required this.floatingWindowId,
    required this.meta,
    required this.savedOrInitialEntity,
    super.key,
  });

  final String sessionId;
  final int salesOrderId;
  final GlobalKey<FormState> formKey;
  final bool readOnly;
  final GlobalKey<NavigatorState> navigatorKey;
  final String? floatingWindowId;
  final DataMeta meta;
  final ValueNotifier<bool> isSaving;
  final Future<void> Function() onSavePressed;
  final ObjectRef<SalesOrder?> savedOrInitialEntity;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;

    return DefaultCardFooter<SalesOrder>(
      onSaveError: null,
      savedOrInitialEntity: savedOrInitialEntity,
      isSaving: isSaving,
      onSavePressed: onSavePressed,
      readOnly: readOnly,
      navigatorKey: navigatorKey,
      hideDeleteButton: true,
      onDeletePressed: () async {
        Future<void> deleteOperation() async {
          await ref.read(salesOrderRepositoryProvider).delete(
                salesOrderId,
                sessionId,
              );
        }

        final (:success, :exception, :data) =
            await AsyncHandler.handleAsyncOperation(
          context,
          deleteOperation,
          successMessage: l10n.gen_saving_success,
          successNavigatorKey: navigatorKey,
          errorNavigatorKey: navigatorKey,
        );

        if (success) {
          ref
            ..invalidate(
              findSalesOrdersProvider,
            )
            ..removeWindow(floatingWindowId!);
        }
      },
      formKey: formKey,
      meta: meta,
      windowId: floatingWindowId,
    );
  }
}
