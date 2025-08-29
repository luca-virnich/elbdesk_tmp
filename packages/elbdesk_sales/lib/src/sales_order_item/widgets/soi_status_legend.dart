import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_sales/elbdesk_sales.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';

class SoiStatusLegend extends StatelessWidget {
  const SoiStatusLegend({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        ...SalesOrderItemStatus.values.map(
          (e) => _Badge(status: e),
        ),
      ],
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge({
    required this.status,
  });
  final SalesOrderItemStatus status;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textColor = status.color.computeLuminance() > 0.5
        ? context.appTheme.generalColors.computeLuminanceLightColor
        : context.appTheme.generalColors.computeLuminanceDarkColor;
    return Container(
      decoration: BoxDecoration(
        color: status.color,
        borderRadius: BorderRadius.circular(99),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 3),
        child: AppText(
          status.readable(l10n),
          color: textColor,
        ),
      ),
    );
  }
}
