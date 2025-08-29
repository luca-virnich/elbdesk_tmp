import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

part 'app_card_mock_up_body.dart';
part 'app_card_mock_up_footer.dart';

enum _AppCardMockUpType {
  currentTheme,
  specificTheme,
  colorLess,
  tableDetailed,
  tableSimple,
  withSections,
}

class AppCardMockUp extends StatelessWidget {
  /// A mock up of a card with the current theme colors.
  const AppCardMockUp.currentTheme({
    this.title,
    this.isFocused,
    this.iconData,
    this.isUnderlaying = false,
    this.bodyRows = 4,
    this.width = 150,
    this.height = 90,
    super.key,
  })  : generalColors = null,
        borderRadiuses = null,
        isCollapsed = null,
        _type = _AppCardMockUpType.currentTheme;

  /// A mock up of a card with specific theme colors.
  const AppCardMockUp.specificTheme({
    required this.generalColors,
    required this.borderRadiuses,
    this.title,
    this.isFocused,
    this.iconData,
    this.isUnderlaying = false,
    this.bodyRows = 4,
    this.width = 150,
    this.height = 90,
    super.key,
  })  : _type = _AppCardMockUpType.specificTheme,
        isCollapsed = null;

  /// A mock up of a card without the danger and primary colors.
  const AppCardMockUp.colorLess({
    this.title,
    this.isFocused,
    this.iconData,
    this.bodyRows = 4,
    this.width = 150,
    this.height = 90,
    super.key,
  })  : generalColors = null,
        isUnderlaying = false,
        borderRadiuses = null,
        isCollapsed = null,
        _type = _AppCardMockUpType.colorLess;

  /// A mock up of a card with a detailed table.
  const AppCardMockUp.tableDetailed({
    this.title,
    this.isFocused,
    this.iconData,
    this.bodyRows = 3,
    this.width = 150,
    this.height = 90,
    super.key,
  })  : generalColors = null,
        isUnderlaying = false,
        borderRadiuses = null,
        isCollapsed = null,
        _type = _AppCardMockUpType.tableDetailed;

  /// A mock up of a card with a simple table.
  const AppCardMockUp.tableSimple({
    this.title,
    this.isFocused,
    this.iconData,
    this.bodyRows = 4,
    this.width = 150,
    this.height = 90,
    super.key,
  })  : generalColors = null,
        isUnderlaying = false,
        borderRadiuses = null,
        isCollapsed = null,
        _type = _AppCardMockUpType.tableSimple;

  const AppCardMockUp.withCollapsibleSection({
    required this.isCollapsed,
    this.isFocused,
    this.isUnderlaying = false,
    super.key,
  })  : generalColors = null,
        borderRadiuses = null,
        title = null,
        iconData = null,
        bodyRows = 1,
        height = 110,
        width = 180,
        _type = _AppCardMockUpType.withSections;

  final bool isUnderlaying;
  final AppGeneralColors? generalColors;
  final AppBorderRadiuses? borderRadiuses;
  final int bodyRows;
  final String? title;
  final bool? isFocused;
  final IconData? iconData;
  final double width;
  final double height;
  final _AppCardMockUpType _type;
  final bool? isCollapsed;

  @override
  Widget build(BuildContext context) {
    final colors = switch (_type) {
      _AppCardMockUpType.currentTheme => context.appTheme.generalColors,
      _AppCardMockUpType.specificTheme => generalColors!,
      _AppCardMockUpType.colorLess => context.appTheme.generalColors,
      _AppCardMockUpType.tableDetailed => context.appTheme.generalColors,
      _AppCardMockUpType.tableSimple => context.appTheme.generalColors,
      _AppCardMockUpType.withSections => context.appTheme.generalColors,
    };

    final radiuses = switch (_type) {
      _AppCardMockUpType.currentTheme => context.appTheme.borderRadiuses,
      _AppCardMockUpType.specificTheme => borderRadiuses!,
      _AppCardMockUpType.colorLess => context.appTheme.borderRadiuses,
      _AppCardMockUpType.tableDetailed => context.appTheme.borderRadiuses,
      _AppCardMockUpType.tableSimple => context.appTheme.borderRadiuses,
      _AppCardMockUpType.withSections => context.appTheme.borderRadiuses,
    };

    return _AppCardMockUpLayout(
      colors: colors,
      radiuses: radiuses,
      title: title,
      isFocused: isFocused,
      iconData: iconData,
      width: width,
      height: height,
      body: switch (_type) {
        _AppCardMockUpType.colorLess => _ListForBody(
            bodyRows: bodyRows,
            body: _CardBody(
              generalColors: colors,
              radiuses: radiuses,
            ),
          ),
        _AppCardMockUpType.currentTheme => _ListForBody(
            bodyRows: bodyRows,
            body: _CardBody(
              generalColors: colors,
              radiuses: radiuses,
            ),
          ),
        _AppCardMockUpType.specificTheme => _ListForBody(
            bodyRows: bodyRows,
            body: _CardBody(
              generalColors: colors,
              radiuses: radiuses,
            ),
          ),
        _AppCardMockUpType.tableDetailed => _DetailedTableBody(
            colors: colors,
            radiuses: radiuses,
            bodyRows: bodyRows,
          ),
        _AppCardMockUpType.tableSimple => _ListForBody(
            bodyRows: bodyRows,
            body: _SimpleTableBody(
              generalColors: colors,
              radiuses: radiuses,
            ),
          ),
        _AppCardMockUpType.withSections => _ListForBody(
            bodyRows: bodyRows,
            spacing: AppSpace.m,
            body: _SectionBody(
              generalColors: colors,
              radiuses: radiuses,
              isCollapsed: isCollapsed!,
            ),
          ),
      },
      footer: switch (_type) {
        _AppCardMockUpType.colorLess => _ColorLessFooter(
            isUnderlaying: isUnderlaying,
            generalColors: colors,
            radiuses: radiuses,
            type: _type,
          ),
        _AppCardMockUpType.currentTheme => _CardFooter(
            isUnderlaying: isUnderlaying,
            generalColors: colors,
            radiuses: radiuses,
            type: _type,
          ),
        _AppCardMockUpType.specificTheme => _CardFooter(
            isUnderlaying: isUnderlaying,
            generalColors: colors,
            radiuses: radiuses,
            type: _type,
          ),
        _AppCardMockUpType.withSections => _CardFooter(
            isUnderlaying: isUnderlaying,
            generalColors: colors,
            radiuses: radiuses,
            type: _type,
          ),
        _ => null,
      },
    );
  }
}

class _AppCardMockUpLayout extends StatelessWidget {
  const _AppCardMockUpLayout({
    required this.colors,
    required this.radiuses,
    required this.title,
    required this.isFocused,
    required this.iconData,
    required this.width,
    required this.height,
    required this.body,
    required this.footer,
  });

  final AppGeneralColors colors;
  final AppBorderRadiuses radiuses;
  final String? title;
  final bool? isFocused;
  final IconData? iconData;
  final double width;
  final double height;
  final Widget body;
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        duration: AnimationConstants.defaultDuration,
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: colors.background,
          borderRadius: BorderRadius.circular(radiuses.m),
          border: Border.all(
            color: (isFocused ?? false)
                ? colors.primary
                : colors.onBackground.withAppOpacity(0.3),
            width: 1,
          ),
          boxShadow: (isFocused ?? false)
              ? [
                  BoxShadow(
                    color: colors.primary.withAppOpacity(0.3),
                    blurRadius: 4,
                    spreadRadius: 1,
                    offset: const Offset(0, 1),
                  ),
                ]
              : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Container(
              decoration: BoxDecoration(
                color: colors.primarySurface,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(radiuses.m),
                  topRight: Radius.circular(
                    radiuses.m,
                  ),
                ),
              ),
              child: (title != null || iconData != null)
                  ? Padding(
                      padding: const EdgeInsets.only(
                        left: 6,
                        top: 4,
                        right: 2,
                        bottom: 4,
                      ),
                      child: Row(
                        children: [
                          if (iconData != null)
                            ElbIcon(
                              iconData!,
                              size: AppIconSize.l,
                              color: colors.onBackground,
                            ),
                          const SizedBox(width: AppSpace.s),
                          if (title != null)
                            Expanded(
                              child: AppText(
                                title!,
                                maxLines: 1,
                              ),
                            ),
                        ],
                      ),
                    )
                  : null,
            ),
            if (title != null || iconData != null)
              const SizedBox(
                height: AppSpace.m,
              )
            else
              const SizedBox(height: AppSpace.s),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpace.s,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    body,
                    if (footer != null)
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: AppSpace.s,
                        ),
                        child: footer,
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

class _ListForBody extends StatelessWidget {
  const _ListForBody({
    required this.bodyRows,
    required this.body,
    this.spacing = AppSpace.s,
  });

  final int bodyRows;
  final Widget body;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        bodyRows,
        (index) => Column(
          children: [
            body,
            SizedBox(height: spacing),
          ],
        ),
      ),
    );
  }
}
