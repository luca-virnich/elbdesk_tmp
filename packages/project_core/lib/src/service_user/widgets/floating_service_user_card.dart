import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_core/src/service_user/config/floating_service_user_window_data.dart';
import 'package:project_core/src/service_user/widgets/service_user_card/service_user_card.dart';

/// Floating ServiceUser Card
///
/// This widget is used to display the ServiceUser information in a floating window
/// It is e.g. called from a button in the ServiceUserTable
/// The definition of the FloatingCard is done in the DashboardScreen
class FloatingServiceUserCard extends HookConsumerWidget {
  /// Constructor for the FloatingServiceUserCard
  const FloatingServiceUserCard({
    required this.data,
    super.key,
  });

  /// The data for the floating window
  final FloatingServiceUserWindowData data;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ServiceUserCard(
      floatingWindowId: data.floatingWindowId,
      serviceUserId: data.serviceUserId,
      floatingWindowType: data.windowType,
    );
  }
}
