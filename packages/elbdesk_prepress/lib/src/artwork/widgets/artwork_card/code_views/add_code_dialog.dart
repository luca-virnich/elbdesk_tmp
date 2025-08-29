import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_prepress/elbdesk_prepress.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Dialog for adding a new artwork code
class AddCodeDialog extends HookConsumerWidget {
  const AddCodeDialog({
    required this.onSelect,
    required this.floatingWindowId,
    required this.navigatorKey,
    required this.floatingWindowFocus,
    required this.isLoading,
    super.key,
  });

  final void Function(ArtworkCodeType)? onSelect;
  final String floatingWindowId;
  final GlobalKey<NavigatorState> navigatorKey;
  final FocusNode floatingWindowFocus;
  final bool isLoading;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ppL10n = context.prepressL10n;
    return ElbDialog(
      isSelfScrollable: true,
      floatingWindowId: floatingWindowId,
      title: ppL10n.artwork_code_add,
      isLoading: isLoading,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElbListTile(
            leading: const Padding(
              padding: EdgeInsets.only(right: AppSpace.s),
              child: ElbIcon(
                AppIcons.code_aztec,
                size: AppIconSize.l,
              ),
            ),
            titleText: ppL10n.artwork_code_aztec,
            onPressed: () => onSelect?.call(ArtworkCodeType.aztec),
          ),
          ElbListTile(
            leading: const Padding(
              padding: EdgeInsets.only(right: AppSpace.s),
              child: ElbIcon(
                AppIcons.code_2of5,
                size: AppIconSize.l,
              ),
            ),
            titleText: ppL10n.artwork_code_2of5,
            onPressed: () => onSelect?.call(ArtworkCodeType.twoOf5),
          ),
          ElbListTile(
            leading: const Padding(
              padding: EdgeInsets.only(right: AppSpace.s),
              child: ElbIcon(
                AppIcons.code_template,
                size: AppIconSize.l,
              ),
            ),
            titleText: ppL10n.artwork_code_template,
            onPressed: () => onSelect?.call(ArtworkCodeType.template),
          ),
        ],
      ),
    );
  }
}
