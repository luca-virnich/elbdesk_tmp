import 'package:elbdesk_client/elbdesk_client.dart';

class NutzenlayoutUtils {
  const NutzenlayoutUtils._();

  static bool shouldSwapDimensions({
    required NutzenlayoutLaufrichtung initialRotation,
    required NutzenlayoutLaufrichtung targetRotation,
  }) {
    final isInitialVertical =
        initialRotation == NutzenlayoutLaufrichtung.headForward ||
            initialRotation == NutzenlayoutLaufrichtung.footForward;

    final isTargetVertical =
        targetRotation == NutzenlayoutLaufrichtung.headForward ||
            targetRotation == NutzenlayoutLaufrichtung.footForward;

    return isInitialVertical != isTargetVertical;
  }

  static double calculateGapH(
    double drucklaenge,
    int reihenCount,
    double cellHeight,
  ) {
    final allCellsHeight = cellHeight * reihenCount;
    final gapH = (drucklaenge - allCellsHeight) / reihenCount;
    return gapH * (reihenCount - 1) + (gapH / 2);
  }
}
