import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_core/src/service_user/config/floating_service_user_table_window_data.dart';
import 'package:project_core/src/service_user/widgets/service_user_table/service_user_table_card.dart';

class FloatingServiceUserTable extends HookConsumerWidget {
  const FloatingServiceUserTable({required this.data, super.key});

  final FloatingServiceUserTableWindowData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ServiceUserTableCard(
      floatingWindowId: data.floatingWindowId,
      iconData: data.icon,
      floatingWindowType: data.windowType,
    );
  }
}
