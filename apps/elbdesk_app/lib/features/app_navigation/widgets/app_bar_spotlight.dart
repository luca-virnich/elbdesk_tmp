import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_platform_info/elbdesk_platform_info.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';

class AppBarSpotlight extends StatelessWidget {
  const AppBarSpotlight({required this.isMobileView, super.key});

  final bool isMobileView;

  static final isMobileDevice = ElbDeskPlatformInfo.isMobileDevice;
  @override
  Widget build(BuildContext context) {
    final isAppleDevice = ElbDeskPlatformInfo.isAppleDevice;

    final l10n = context.l10n;
    return ElbMouseRegionGestureDetector(
      onTap: () async {
        await showElbDialog<void>(
          context: context,
          child: const SpotlightDialog(),
          isDismissible: true,
        );
      },
      cursor: SystemMouseCursors.click,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: isMobileView ? 120 : 400,
        ),
        child: AbsorbPointer(
          absorbing: true,
          child: ExcludeFocus(
            child: NextTextField(
              // readOnly: true,
              hintText: '${l10n.gen_search}...',
              leadingIcon: const Icon(AppIcons.search),
              suffix: isMobileDevice || isMobileView
                  ? null
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AppKeyboardKeySymbol(
                          keySign: (isAppleDevice && !kIsWeb)
                              ? '\u2318'
                              : l10n.gen_key_ctrl,
                        ),
                        const AppKeyboardKeySymbol(
                          keySign: 'K',
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
