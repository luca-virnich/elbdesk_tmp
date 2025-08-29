part of 'app_card_mock_up.dart';

class _CardBody extends StatelessWidget {
  const _CardBody({
    required this.generalColors,
    required this.radiuses,
  });

  final AppGeneralColors generalColors;
  final AppBorderRadiuses radiuses;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 12,
          child: Container(
            height: AppSpace.s,
            decoration: BoxDecoration(
              color: generalColors.primarySurface,
              borderRadius: BorderRadius.circular(
                radiuses.l,
              ),
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Container(),
        ),
        Flexible(
          flex: 12,
          child: Container(
            height: AppSpace.s,
            decoration: BoxDecoration(
              color: generalColors.primarySurface,
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

class _SectionBody extends StatelessWidget {
  const _SectionBody({
    required this.generalColors,
    required this.radiuses,
    required this.isCollapsed,
  });

  final AppGeneralColors generalColors;
  final AppBorderRadiuses radiuses;
  final bool isCollapsed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            _SectionBodyHeader(
              generalColors: generalColors,
              radiuses: radiuses,
              isCollapsed: isCollapsed,
              isFirstRow: true,
            ),
            const SizedBox(height: AppSpace.s),
          ],
        ),
        AutoAnimatedSize(
          animationDuration: AnimationConstants.shortDuration,
          keepAliveChildren: true,
          expanded: !isCollapsed,
          child: Column(
            children: [
              Row(
                children: [
                  Flexible(
                    flex: 12,
                    child: Container(
                      height: AppSpace.s,
                      decoration: BoxDecoration(
                        color: generalColors.primarySurface,
                        borderRadius: BorderRadius.circular(
                          radiuses.l,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(),
                  ),
                  Flexible(
                    flex: 12,
                    child: Container(
                      height: AppSpace.s,
                      decoration: BoxDecoration(
                        color: generalColors.primarySurface,
                        borderRadius: BorderRadius.circular(
                          radiuses.l,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpace.s),
              Row(
                children: [
                  Flexible(
                    flex: 12,
                    child: Container(
                      height: AppSpace.s,
                      decoration: BoxDecoration(
                        color: generalColors.primarySurface,
                        borderRadius: BorderRadius.circular(
                          radiuses.l,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(),
                  ),
                  Flexible(
                    flex: 12,
                    child: Container(
                      height: AppSpace.s,
                      decoration: BoxDecoration(
                        color: generalColors.primarySurface,
                        borderRadius: BorderRadius.circular(
                          radiuses.l,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        AutoAnimatedSize(
          animationDuration: AnimationConstants.shortDuration,
          keepAliveChildren: true,
          expanded: isCollapsed,
          child: Column(
            children: [
              const SizedBox(height: AppSpace.s),
              _SectionBodyHeader(
                generalColors: generalColors,
                radiuses: radiuses,
                isCollapsed: isCollapsed,
                isFirstRow: false,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SectionBodyHeader extends StatelessWidget {
  const _SectionBodyHeader({
    required this.generalColors,
    required this.radiuses,
    required this.isCollapsed,
    required this.isFirstRow,
  });

  final AppGeneralColors generalColors;
  final AppBorderRadiuses radiuses;
  final bool isCollapsed;
  final bool isFirstRow;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Flexible(
              flex: 3,
              child: Container(
                height: AppSpace.xs,
                decoration: BoxDecoration(
                  color: generalColors.onBackground.withAppOpacity(0.2),
                  borderRadius: BorderRadius.circular(
                    radiuses.l,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 12,
              child: Container(),
            ),
            if (isFirstRow)
              AnimatedRotation(
                turns: isCollapsed ? -0.5 : 0,
                duration: AnimationConstants.defaultDuration,
                curve: AnimationConstants.defaultCurve,
                child: ElbIcon(
                  AppIcons.expand_less,
                  size: AppIconSize.m,
                  color: generalColors.onBackground.withAppOpacity(0.2),
                ),
              )
            else
              ElbIcon(
                AppIcons.expand_more,
                size: AppIconSize.m,
                color: generalColors.onBackground.withAppOpacity(0.2),
              ),
          ],
        ),
        Row(
          children: [
            Flexible(
              child: Container(
                height: AppSpace.xs,
                decoration: BoxDecoration(
                  color: generalColors.onBackground.withAppOpacity(0.2),
                  borderRadius: BorderRadius.circular(
                    radiuses.l,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _SimpleTableBody extends StatelessWidget {
  const _SimpleTableBody({
    required this.generalColors,
    required this.radiuses,
  });

  final AppGeneralColors generalColors;
  final AppBorderRadiuses radiuses;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: Container(
            height: AppSpace.s,
            decoration: BoxDecoration(
              color: generalColors.primarySurface,
              borderRadius: BorderRadius.circular(
                radiuses.l,
              ),
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Container(),
        ),
        Flexible(
          flex: 9,
          child: Container(
            height: AppSpace.s,
            decoration: BoxDecoration(
              color: generalColors.primarySurface,
              borderRadius: BorderRadius.circular(
                radiuses.l,
              ),
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Container(),
        ),
        Flexible(
          flex: 12,
          child: Container(
            height: AppSpace.s,
            decoration: BoxDecoration(
              color: generalColors.primarySurface,
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

class _DetailedTableBody extends StatelessWidget {
  const _DetailedTableBody({
    required this.colors,
    required this.radiuses,
    required this.bodyRows,
  });

  final AppGeneralColors colors;
  final AppBorderRadiuses radiuses;
  final int bodyRows;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // search bar and title
        Row(
          children: [
            Flexible(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  color: colors.primarySurface,
                  borderRadius: BorderRadius.circular(radiuses.l),
                ),
                height: AppSpace.s,
              ),
            ),
            Flexible(
              flex: 4,
              child: Container(),
            ),
            Flexible(
              flex: 4,
              child: Container(
                height: 10,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: colors.primarySurface,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(radiuses.l),
                ),
              ),
            ),
            const SizedBox(width: AppSpace.s),
            Container(
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                color: colors.primarySurface,
                borderRadius: BorderRadius.circular(radiuses.l),
              ),
            ),
            const SizedBox(width: AppSpace.s),
            Container(
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                color: colors.primarySurface,
                borderRadius: BorderRadius.circular(radiuses.l),
              ),
            ),
          ],
        ),

        // table
        const SizedBox(height: AppSpace.m),
        for (int i = 0; i < bodyRows; i++)
          _DetailedTableRows(
            colors: colors,
            radiuses: radiuses,
            rowIndex: i,
          ),
      ],
    );
  }
}

class _DetailedTableRows extends StatelessWidget {
  const _DetailedTableRows({
    required this.colors,
    required this.radiuses,
    required this.rowIndex,
  });

  final AppGeneralColors colors;
  final AppBorderRadiuses radiuses;
  final int rowIndex;

  // Fixed pattern of flex values for each row
  static const List<List<int>> rowPatterns = [
    [3, 1, 2, 1], // First row
    [2, 2, 1, 2], // Second row
    [1, 3, 2, 1], // Third row
    [2, 1, 1, 2], // Fourth row
    [3, 2, 2, 1], // Fifth row
  ];

  List<int> get flexValues {
    return rowPatterns[
        rowIndex % 5]; // This ensures we wrap back to start after 5 rows
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSpace.xl,
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              height: AppSpace.xl,
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                    color: colors.primarySurface,
                    width: 2,
                  ),
                  bottom: BorderSide(
                    color: colors.primarySurface,
                    width: 2,
                  ),
                ),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: AppSpace.xl,
                  height: AppSpace.s,
                  decoration: BoxDecoration(
                    color: colors.primarySurface,
                    borderRadius: BorderRadius.circular(radiuses.m),
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 4,
            child: Container(
              height: AppSpace.xl,
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                    color: colors.primarySurface,
                    width: 2,
                  ),
                  bottom: BorderSide(
                    color: colors.primarySurface,
                    width: 2,
                  ),
                ),
              ),
              child: Row(
                children: [
                  const SizedBox(width: AppSpace.s),
                  Flexible(
                    flex: flexValues[0],
                    child: Container(
                      height: AppSpace.s,
                      decoration: BoxDecoration(
                        color: colors.primarySurface,
                        borderRadius: BorderRadius.circular(radiuses.m),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: flexValues[1],
                    child: Container(),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                    color: colors.primarySurface,
                    width: 2,
                  ),
                  bottom: BorderSide(
                    color: colors.primarySurface,
                    width: 2,
                  ),
                ),
              ),
              child: Row(
                children: [
                  const SizedBox(width: AppSpace.s),
                  Flexible(
                    flex: flexValues[2],
                    child: Container(
                      height: AppSpace.s,
                      decoration: BoxDecoration(
                        color: colors.primarySurface,
                        borderRadius: BorderRadius.circular(radiuses.m),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: flexValues[3],
                    child: Container(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
