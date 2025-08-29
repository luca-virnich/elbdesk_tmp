part of 'app_card_mock_up.dart';

class _ColorLessFooter extends StatelessWidget {
  const _ColorLessFooter({
    required this.isUnderlaying,
    required this.generalColors,
    required this.radiuses,
    required this.type,
  });

  final bool isUnderlaying;
  final AppGeneralColors generalColors;
  final AppBorderRadiuses radiuses;
  final _AppCardMockUpType type;
  @override
  Widget build(BuildContext context) {
    final primaryColor = switch (type) {
      _AppCardMockUpType.currentTheme => isUnderlaying
          ? generalColors.primary.withAppOpacity(0.6)
          : generalColors.primary,
      _AppCardMockUpType.specificTheme => isUnderlaying
          ? generalColors.primary.withAppOpacity(0.6)
          : generalColors.primary,
      _AppCardMockUpType.colorLess => generalColors.primarySurface,
      _AppCardMockUpType.tableDetailed => generalColors.primarySurface,
      _AppCardMockUpType.tableSimple => generalColors.primarySurface,
      _AppCardMockUpType.withSections => generalColors.primarySurface,
    };

    return Row(
      children: [
        Flexible(
          flex: 10,
          child: Container(),
        ),
        Flexible(
          flex: 2,
          child: Container(
            height: AppSpace.s,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(
                radiuses.l,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _CardFooter extends StatelessWidget {
  const _CardFooter({
    required this.isUnderlaying,
    required this.generalColors,
    required this.radiuses,
    required this.type,
  });

  final bool isUnderlaying;
  final AppGeneralColors generalColors;
  final AppBorderRadiuses radiuses;
  final _AppCardMockUpType type;
  @override
  Widget build(BuildContext context) {
    final dangerColor = switch (type) {
      _AppCardMockUpType.currentTheme => isUnderlaying
          ? generalColors.danger.withAppOpacity(0.6)
          : generalColors.danger,
      _AppCardMockUpType.specificTheme => isUnderlaying
          ? generalColors.danger.withAppOpacity(0.6)
          : generalColors.danger,
      _AppCardMockUpType.colorLess => generalColors.primarySurface,
      _AppCardMockUpType.tableDetailed => generalColors.primarySurface,
      _AppCardMockUpType.tableSimple => generalColors.primarySurface,
      _AppCardMockUpType.withSections => generalColors.danger,
    };

    final primaryColor = switch (type) {
      _AppCardMockUpType.currentTheme => isUnderlaying
          ? generalColors.primary.withAppOpacity(0.6)
          : generalColors.primary,
      _AppCardMockUpType.specificTheme => isUnderlaying
          ? generalColors.primary.withAppOpacity(0.6)
          : generalColors.primary,
      _AppCardMockUpType.colorLess => generalColors.primarySurface,
      _AppCardMockUpType.tableDetailed => generalColors.primarySurface,
      _AppCardMockUpType.tableSimple => generalColors.primarySurface,
      _AppCardMockUpType.withSections => generalColors.primary,
    };

    return Row(
      children: [
        Flexible(
          flex: 1,
          child: Container(
            height: AppSpace.s,
            decoration: BoxDecoration(
              color: dangerColor,
              borderRadius: BorderRadius.circular(
                radiuses.l,
              ),
            ),
          ),
        ),
        Flexible(
          flex: 6,
          child: Container(),
        ),
        Flexible(
          flex: 2,
          child: Container(
            height: AppSpace.s,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(
                radiuses.l,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
