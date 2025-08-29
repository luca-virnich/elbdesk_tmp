import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/elbdesk_prepress.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_core/project_core.dart';

class CustomerDrucklayoutsRibbon extends HookConsumerWidget {
  const CustomerDrucklayoutsRibbon({
    required this.customerId,
    required this.sessionId,
    required this.floatingWindowId,
    required this.navigatorKey,
    super.key,
  });
  final int customerId;
  final String sessionId;
  final GlobalKey<NavigatorState> navigatorKey;

  final String floatingWindowId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final floatingWindowFocus = ref.watch(
      windowFocusNodeProvider(floatingWindowId),
    );
    final ppL10n = context.prepressL10n;
    return Ribbon(
      floatingWindowId: floatingWindowId,
      floatingWindowType: FloatingWindowType.customer.name,
      onPressed: () async {
        await showElbDialog<void>(
          context: context,
          child: _CustomerDrucklayoutsCard(
            customerId: customerId,
            sessionId: sessionId,
            navigatorKey: navigatorKey,
            floatingWindowFocus: floatingWindowFocus,
            floatingWindowId: floatingWindowId,
          ),
        );
      },
      label: ppL10n.drucklayout_plural,
      icon: AppIcons.drucklayout,
    );
  }
}

class _CustomerDrucklayoutsCard extends StatelessWidget {
  const _CustomerDrucklayoutsCard({
    required this.customerId,
    required this.sessionId,
    required this.navigatorKey,
    required this.floatingWindowFocus,
    required this.floatingWindowId,
  });
  final int customerId;
  final String sessionId;
  final GlobalKey<NavigatorState> navigatorKey;
  final FocusNode floatingWindowFocus;
  final String floatingWindowId;

  @override
  Widget build(BuildContext context) {
    final ppL10n = context.prepressL10n;
    return ElbDialog(
      floatingWindowId: floatingWindowId,
      title: ppL10n.drucklayout_plural,
      child: CustomerDrucklayouts(
        customerId: customerId,
        sessionId: sessionId,
        navigatorKey: navigatorKey,
        floatingWindowFocus: floatingWindowFocus,
        floatingWindowId: floatingWindowId,
      ),
    );
  }
}
