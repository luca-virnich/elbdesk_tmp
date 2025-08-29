import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_core/src/app_user/config/floating_app_user_window_data.dart';
import 'package:project_core/src/app_user/widgets/app_user_card/app_user_card.dart';

/// Floating AppUser Card
///
/// This widget is used to display the AppUser information in a floating window
/// It is e.g. called from a button in the AppUserTable
/// The definition of the FloatingCard is done in the DashboardScreen
class FloatingAppUserCard extends HookConsumerWidget {
  /// Constructor for the FloatingAppUserCard
  const FloatingAppUserCard({
    required this.data,
    super.key,
  });

  /// The data for the floating window
  final FloatingAppUserWindowData data;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final floatingWindowFocus =
        ref.watch(windowFocusNodeProvider(data.floatingWindowId));
    return AppUserCard(
      floatingWindowType: data.windowType,
      floatingWindowId: data.floatingWindowId,
      appUserId: data.appUserId,
      floatingWindowFocus: floatingWindowFocus,
    );
  }
}
