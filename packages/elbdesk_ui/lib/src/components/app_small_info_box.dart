import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/cupertino.dart';

class AppSmallInfoBox extends StatelessWidget {
  const AppSmallInfoBox({
    required this.label,
    super.key,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: AppSpace.s),
      padding: const EdgeInsets.all(AppSpace.m),
      decoration: BoxDecoration(
        color: context.appTheme.statusColors.info.withAppOpacity(0.1),
        borderRadius: BorderRadius.circular(context.appTheme.borderRadiuses.m),
        border: Border.all(
          color: context.appTheme.statusColors.info.withAppOpacity(0.3),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          ElbIcon(
            AppIcons.errorHint,
            color: context.appTheme.statusColors.info,
            size: AppIconSize.l,
          ),
          const SizedBox(width: AppSpace.s),
          Expanded(
            child: AppText(
              label,
            ),
          ),
        ],
      ),
    );
  }
}
