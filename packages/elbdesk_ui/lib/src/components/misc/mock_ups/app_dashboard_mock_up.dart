import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppDashboardMockUp extends HookConsumerWidget {
  const AppDashboardMockUp.currentTheme({
    this.isUnderlaying = false,
    super.key,
  })  : generalColors = null,
        borderRadiuses = null;

  const AppDashboardMockUp.specificTheme({
    required this.generalColors,
    required this.borderRadiuses,
    this.isUnderlaying = false,
    super.key,
  });

  final bool isUnderlaying;

  final AppGeneralColors? generalColors;
  final AppBorderRadiuses? borderRadiuses;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = generalColors ?? context.appTheme.generalColors;
    final radiuses = borderRadiuses ?? context.appTheme.borderRadiuses;

    return Container(
      width: 230,
      height: 140,
      decoration: BoxDecoration(
        color: colors.primarySurface,
        borderRadius: BorderRadius.circular(radiuses.m),
        border: Border.all(
          color: colors.onBackground.withAppOpacity(0.3),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: AppSpace.m,
          top: AppSpace.m,
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: colors.background,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(radiuses.m),
                    bottomRight: Radius.circular(radiuses.m),
                  ),
                ),
                padding: const EdgeInsets.only(
                  left: AppSpace.s,
                  right: AppSpace.s,
                  top: AppSpace.s,
                ),
                child: Row(
                  spacing: AppSpace.s,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Column(
                        spacing: AppSpace.s,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            flex: 4,
                            child: Container(
                              decoration: BoxDecoration(
                                color: colors.primarySurface,
                                borderRadius: BorderRadius.circular(radiuses.s),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 5,
                            child: Container(
                              decoration: BoxDecoration(
                                color: colors.primarySurface,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(radiuses.s),
                                  topLeft: Radius.circular(radiuses.s),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Column(
                        spacing: AppSpace.s,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            flex: 4,
                            child: Container(
                              decoration: BoxDecoration(
                                color: colors.primarySurface,
                                borderRadius: BorderRadius.circular(radiuses.s),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                color: colors.primarySurface,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(radiuses.s),
                                  topLeft: Radius.circular(radiuses.s),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
