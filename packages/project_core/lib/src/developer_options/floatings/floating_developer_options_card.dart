import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_core/src/developer_options/config/floating_developer_options_window_data.dart';
import 'package:project_core/src/developer_options/widgets/developer_options_card/developer_options_card.dart';

class FloatingDeveloperOptionsCard extends HookConsumerWidget {
  /// Constructor for the FloatingDeveloperOptionsCard
  const FloatingDeveloperOptionsCard({
    required this.data,
    super.key,
  });

  /// The data for the floating window
  final FloatingDeveloperOptionsWindowData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final floatingWindowFocus =
        ref.watch(windowFocusNodeProvider(data.floatingWindowId));
    return DeveloperOptionsCard(
      floatingWindowId: data.floatingWindowId,
      floatingWindowFocus: floatingWindowFocus,
      floatingWindowType: data.windowType,
    );
  }
}
