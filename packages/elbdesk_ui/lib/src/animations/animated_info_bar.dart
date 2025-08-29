import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

// class AnimatedConnectivityInfoBar extends ConsumerWidget {
//   const AnimatedConnectivityInfoBar({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final isConnected = ref.watch().asData?.value;
//     final statusColors = context.appTheme.statusColors;

//     final l10n = context.l10n;
//     return AnimatedInfoBar(
//       color: statusColors.error,
//       visible: isConnected == false,
//       infoBarChildren: [
//         AppIcon(
//           Icons.error_outline,
//           color: statusColors.onError,
//         ),
//         const SizedBox(
//           width: AppSpace.s,
//         ),
//         Flexible(
//           fit: FlexFit.tight,
//           child: AppText(
//             l10n.connectivity_no_internet_connection,
//             color: context.appTheme.generalColors.dangerForeground,
//           ),
//         ),
//       ],
//     );
//   }
// }

// TODO(kz): Document
class AnimatedInfoBar extends StatelessWidget {
  const AnimatedInfoBar({
    required this.infoBarChildren,
    required this.color,
    required this.visible,
    super.key,
  });

  final bool visible;
  final List<Widget> infoBarChildren;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: AnimationConstants.defaultDuration,
      transitionBuilder: (Widget child, Animation<double> animation) {
        return SizeTransition(
          sizeFactor: animation,
          axisAlignment: -1,
          child: child,
        );
      },
      child: visible
          ? InfoBar(
              color: color,
              children: infoBarChildren,
            )
          : const SizedBox.shrink(),
    );
  }
}
