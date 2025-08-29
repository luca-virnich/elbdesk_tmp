import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/elbdesk_prepress.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_core/project_core.dart';

class CustomerArtworkTemplatesRibbon extends HookConsumerWidget {
  const CustomerArtworkTemplatesRibbon({
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
          navigatorKey: navigatorKey,
          child: _CustomerArtworkTemplatesCard(
            customerId: customerId,
            sessionId: sessionId,
            navigatorKey: navigatorKey,
            floatingWindowFocus: floatingWindowFocus,
            floatingWindowId: floatingWindowId,
          ),
        );
      },
      label: ppL10n.artwork_templates,
      icon: AppIcons.company,
    );
  }
}

class _CustomerArtworkTemplatesCard extends StatelessWidget {
  const _CustomerArtworkTemplatesCard({
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
    return ElbDialog(
      // maxHeight: 300,
      // maxWidth: 1500,
      blockShortcuts: false,
      floatingWindowId: floatingWindowId,
      // floatingWindowId: floatingWindowId,
      // parentNavigatorKey: navigatorKey,
      // floatingWindowFocus: floatingWindowFocus,
      child: CustomerArtworkTemplates(
        customerId: customerId,
        sessionId: sessionId,
        navigatorKey: navigatorKey,
        floatingWindowFocus: floatingWindowFocus,
        floatingWindowId: floatingWindowId,
      ),
    );
  }
}
