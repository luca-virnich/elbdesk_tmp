part of '../add_single_nutzenlayout_dialog.dart';

class _AddSingleNutzenlayoutDesignerPage extends ConsumerWidget {
  const _AddSingleNutzenlayoutDesignerPage({
    required this.salesOrderId,
    required this.sessionId,
    required this.customerId,
    required this.navigatorKey,
  });
  final int salesOrderId;
  final String sessionId;
  final int customerId;
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nutzenlayout = ref.watch(singleNutzenLayoutStateProvider(sessionId));
    final generalColors = context.appTheme.generalColors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SelectedArtworksList(
          sessionId: sessionId,
          customerId: customerId,
        ),
        const AppDivider(
          height: 32,
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          bottom: UiConstants.defaultPadding,
                        ),
                        child: FittedBox(
                          child: NutzenlayoutMatrixView(
                            nutzenlayout: nutzenlayout,
                            navigatorKey: navigatorKey,
                            sessionId: sessionId,
                            isExistingMultiNutzenlayout: false,
                          ),
                        ),
                      ),
                    ),
                    CustomPaint(
                      painter: _ArrowDownPainter(
                        color: generalColors.primary,
                        strokeWidth: 10,
                      ),
                      size: const Size(100, 350),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: UiConstants.defaultPadding * 3),
              Flexible(
                child: NutzenlayoutMatrixListView(
                  nutzenlayout: nutzenlayout,
                  sessionId: sessionId,
                  navigatorKey: navigatorKey,
                  isEditable: true,
                  formType: NutzenlayoutFormType.einzelform,
                ),
              ),
              const SizedBox(width: UiConstants.defaultPadding),
            ],
          ),
        ),
      ],
    );
  }
}

class _ArrowDownPainter extends CustomPainter {
  _ArrowDownPainter({
    required this.color,
    this.strokeWidth = 6.0,
  });
  final Color color;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final arrowWidth = size.width * 0.6;
    final arrowHeadSize = size.width * 0.3;

    // Draw the vertical line
    final startPoint = Offset(size.width / 2, 0);
    final endPoint = Offset(size.width / 2, size.height - arrowHeadSize);
    canvas.drawLine(startPoint, endPoint, paint);

    // Draw the arrow head
    final path = Path()
      ..moveTo(size.width / 2, size.height) // Arrow tip
      ..lineTo(size.width / 2 - arrowWidth / 2, size.height - arrowHeadSize)
      ..lineTo(size.width / 2 + arrowWidth / 2, size.height - arrowHeadSize)
      ..close();

    final fillPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    canvas.drawPath(path, fillPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    if (oldDelegate is _ArrowDownPainter) {
      return oldDelegate.color != color ||
          oldDelegate.strokeWidth != strokeWidth;
    }
    return true;
  }
}

class _SelectedArtworksList extends ConsumerWidget {
  const _SelectedArtworksList({
    required this.customerId,
    required this.sessionId,
  });

  final int customerId;
  final String sessionId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedArtworks = ref.watch(
      selectedArtworksForEinzelformaufbauProvider(sessionId),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        AppText(
          'Ausgewählte Artworks'.hc,
          style: context.appTheme.textStyles.h1,
        ),
        const SizedBox(height: AppSpace.m),
        AppWrap(
          alignment: WrapAlignment.start,
          spacing: AppSpace.l,
          runSpacing: AppSpace.m,
          children: [
            for (final (artwork) in selectedArtworks)
              ArtworkListItem(
                artwork: artwork,
                customerId: 1,
              ),
          ],
        ),
      ],
    );
  }
}
