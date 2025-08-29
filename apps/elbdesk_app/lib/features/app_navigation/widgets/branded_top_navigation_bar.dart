import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Branded Top Navigation Bar
///
/// The Bar displayed at the top of the Dashboard Screen

// TODO(all): Refactor after proper implementation
/// Branding Logo
///
/// Displays the Logo of the Program
class BrandingLogo extends ConsumerWidget {
  /// Constructor
  const BrandingLogo({
    this.height,
    this.width,
    super.key,
  });

  /// The height of the logo
  final double? height;

  /// The width of the logo
  final double? width;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final brightness = Theme.of(context).brightness;

    final path = brightness == Brightness.light
        ? AssetConstants.elbrpLogoOnLight
        : AssetConstants.elbrpLogoOnDark;

    return AppSvg.asset(
      path: path,
      height: height,
      width: width,
    );
  }
}
