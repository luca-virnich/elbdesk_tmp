import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/elbdesk_crm.dart';
import 'package:elbdesk_crm/src/contact/widgets/contact_table/contact_table_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FloatingContactPersonTable extends HookConsumerWidget {
  const FloatingContactPersonTable({required this.data, super.key});

  final FloatingContactPersonTableWindowData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final floatingWindowFocus =
        ref.watch(windowFocusNodeProvider(data.floatingWindowId));

    useEffect(
      () {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          ref.read(recentWindowsProvider.notifier).insertEntityWindow(
                RecentWindow(
                  type: data.windowType,
                  label: '',
                  entityId: null,
                ),
              );
        });
        return null;
      },
      [],
    );

    return ContactTableCard(
      floatingWindowFocus: floatingWindowFocus,
      type: ContactTableType.persons,
      floatingWindowId: data.floatingWindowId,
    );
  }
}

class FloatingContactCompanyTable extends HookConsumerWidget {
  const FloatingContactCompanyTable({required this.data, super.key});

  final FloatingContactCompanyTableWindowData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final floatingWindowFocus =
        ref.watch(windowFocusNodeProvider(data.floatingWindowId));
    useEffect(
      () {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          ref.read(recentWindowsProvider.notifier).insertEntityWindow(
                RecentWindow(
                  type: data.windowType,
                  label: '',
                  entityId: null,
                ),
              );
        });
        return null;
      },
      [],
    );
    return ContactTableCard(
      floatingWindowFocus: floatingWindowFocus,
      type: ContactTableType.companies,
      floatingWindowId: data.floatingWindowId,
    );
  }
}
