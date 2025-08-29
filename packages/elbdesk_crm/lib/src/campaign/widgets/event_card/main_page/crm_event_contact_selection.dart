import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';

class CrmEventContactSelection extends HookConsumerWidget {
  const CrmEventContactSelection({
    required this.onSelect,
    required this.floatingWindowId,
    required this.navigatorKey,
    required this.floatingWindowFocus,
    required this.isLoading,
    required this.titleText,
    required this.eventId,
    required this.sessionId,
    this.hiddenFilterGroup,
    this.height,
    super.key,
  });

  final Future<void> Function(Contact)? onSelect;
  final String floatingWindowId;
  final GlobalKey<NavigatorState> navigatorKey;
  final FocusNode floatingWindowFocus;
  final bool isLoading;
  final String titleText;
  final FilterGroup? hiddenFilterGroup;
  final int? eventId;
  final double? height;
  final String sessionId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElbDialog(
      floatingWindowId: floatingWindowId,
      title: titleText,
      child: ContactTable.byEvent(
        eventId: eventId,
        componentIdentifier: ComponentIdentifier.crmEventContactSelection,
        isCollapsible: false,
        isSelection: true,
        hiddenFilterGroup: hiddenFilterGroup,
        onAddEntityInCard: () async {},
        onSelect: onSelect,
        eventStateSessionId: sessionId,
      ),
    );
  }
}
