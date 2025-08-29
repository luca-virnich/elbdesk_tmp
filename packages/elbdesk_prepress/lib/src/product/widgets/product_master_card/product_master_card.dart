import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/product/widgets/history/product_history.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductMasterCard extends HookConsumerWidget {
  const ProductMasterCard({
    required this.floatingWindowId,
    required this.productMasterId,
    required this.floatingWindowFocus,
    required this.floatingWindowType,
    this.navigatorKey,
    super.key,
  });

  /// Product ID
  final int productMasterId;

  final String floatingWindowId;

  /// The navigator key
  final GlobalKey<NavigatorState>? navigatorKey;

  final FocusNode floatingWindowFocus;

  /// The type of the floating window
  final String floatingWindowType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomCard(
      floatingWindowType: floatingWindowType,
      floatingWindowFocus: floatingWindowFocus,
      baseTitle: 'Produkt',
      floatingWindowId: floatingWindowId,
      childBuilder: (context, selectedNavigationIndexRef, navigatorKey) {
        return ProductHistory(
          productMasterId: productMasterId,
        );
      },
      iconData: AppIcons.product,
    );
  }
}
