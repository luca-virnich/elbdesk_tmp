import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/artwork/logic/artwork_state.dart';
import 'package:elbdesk_prepress/src/artwork/widgets/artwork_card/code_views/2of5_code_view.dart';
import 'package:elbdesk_prepress/src/artwork/widgets/artwork_card/code_views/add_code_dialog.dart';
import 'package:elbdesk_prepress/src/artwork/widgets/artwork_card/code_views/aztec_code_view.dart';
import 'package:elbdesk_prepress/src/artwork/widgets/artwork_card/code_views/template_code_view.dart';
import 'package:elbdesk_prepress/src/artwork_code/models/artwork_code.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:project_core/project_core.dart';

/// Widget that displays all artwork codes and allows adding new ones
class ArtworkCodesView extends HookConsumerWidget {
  const ArtworkCodesView({
    required this.navigatorKey,
    required this.floatingWindowFocus,
    required this.floatingWindowId,
    required this.readOnly,
    required this.codes,
    required this.stateNotifier,
    required this.maxWidth,
    required this.inHistory,
    required this.componentIdentifier,
    super.key,
  }) : assert(
          inHistory ||
              (navigatorKey != null &&
                  floatingWindowFocus != null &&
                  floatingWindowId != null &&
                  stateNotifier != null),
          'When not in history view, navigatorKey, '
          'floatingWindowFocus, floatingWindowId, and '
          'stateNotifier must not be null',
        );

  final GlobalKey<NavigatorState>? navigatorKey;
  final FocusNode? floatingWindowFocus;
  final String? floatingWindowId;
  final bool readOnly;
  final List<ArtworkCode> codes;
  final ArtworkState? stateNotifier;
  final double maxWidth;
  final bool inHistory;
  final ComponentIdentifier componentIdentifier;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final ppL10n = context.prepressL10n;
    return CollapsibleCardSection(
      identifier: componentIdentifier.name,
      trailingWidgets: [
        if (!readOnly)
          AddEntityInCardButton(
            tooltip: ppL10n.artwork_code_add,
            onPressed: readOnly
                ? null
                : () async {
                    try {
                      final selectedType =
                          await showElbDialog<ArtworkCodeType?>(
                        context: context,
                        navigatorKey: navigatorKey,
                        child: AddCodeDialog(
                          floatingWindowId: floatingWindowId!,
                          navigatorKey: navigatorKey!,
                          floatingWindowFocus: floatingWindowFocus!,
                          isLoading: false,
                          onSelect: (type) {
                            Navigator.of(context).pop(type);
                          },
                        ),
                      );

                      if (selectedType != null) {
                        stateNotifier!.addArtworkCode(selectedType);
                      }
                    } catch (e) {
                      dlog(e);
                    }
                  },
          ),
      ],
      title: ppL10n.artwork_codes,
      child: Column(
        spacing: 12,
        mainAxisSize: MainAxisSize.min,
        children: [
          for (final code in codes)
            CodeTypeView(
              width: maxWidth,
              stateNotifier: inHistory ? null : stateNotifier!,
              key: Key(code.runtimeId),
              code: code,
              readOnly: readOnly,
            ),
        ],
      ),
    );
  }
}

/// Widget that displays the appropriate code view based on the artwork code
/// type
class CodeTypeView extends StatelessWidget {
  const CodeTypeView({
    required this.code,
    required this.stateNotifier,
    required this.width,
    required this.readOnly,
    super.key,
  });

  final ArtworkCode code;
  final ArtworkState? stateNotifier;
  final double width;
  final bool readOnly;
  @override
  Widget build(BuildContext context) {
    switch (code.artworkCodeType) {
      case ArtworkCodeType.aztec:
        return AztecCodeView(
          code: code,
          readOnly: readOnly,
          stateNotifier: stateNotifier,
          width: width,
        );
      case ArtworkCodeType.twoOf5:
        return TwoOf5CodeView(
          code: code,
          readOnly: readOnly,
          stateNotifier: stateNotifier,
          width: width,
        );
      case ArtworkCodeType.template:
        return TemplateCodeView(
          code: code,
          readOnly: readOnly,
          stateNotifier: stateNotifier,
          width: width,
        );
    }
  }
}
