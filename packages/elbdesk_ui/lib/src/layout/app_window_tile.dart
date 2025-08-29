import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';

/// User Settings Area Tile
class AppWindowTile extends StatelessWidget {
  /// Constructor
  const AppWindowTile({
    required this.title,
    required this.subTitle,
    required this.content,
    required this.isTextField,
    super.key,
  });

  //TODO(luca): add custructors -> stanrd, textfield, double

  /// The title of the tile
  final String title;

  /// The subtitle of the tile
  final String subTitle;

  /// The setting buttons
  final Widget Function(double width) content;

  /// Whether the tile is a text field
  final bool isTextField;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isNormalLayout =
            constraints.maxWidth > UiConstants.appWindowTileBreakpointWidth;

        // 2/3 for the settings area in normal layout
        final settingsWidth = isNormalLayout
            ? (constraints.maxWidth - AppSpace.l) * (2 / 3)
            : constraints.maxWidth;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: AppSpace.xl),
            if (isNormalLayout)
              _NormalLayout(
                title: title,
                subTitle: subTitle,
                width: settingsWidth,
                content: content,
              )
            else
              _SmallLayout(
                title: title,
                subTitle: subTitle,
                width: settingsWidth,
                content: content,
                isTextField: isTextField,
              ),
            const SizedBox(height: AppSpace.xxl),
          ],
        );
      },
    );
  }
}

class _NormalLayout extends StatelessWidget {
  const _NormalLayout({
    required this.title,
    required this.subTitle,
    required this.width,
    required this.content,
  });

  final String title;
  final String subTitle;
  final double width;
  final Widget Function(double width) content;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: _TitleSection(
            title: title,
            subTitle: subTitle,
            showSubtitle: true,
          ),
        ),
        const SizedBox(width: AppSpace.xxxl),
        Expanded(
          flex: 2,
          child: content(width),
        ),
      ],
    );
  }
}

class _SmallLayout extends StatelessWidget {
  const _SmallLayout({
    required this.title,
    required this.subTitle,
    required this.width,
    required this.content,
    required this.isTextField,
  });

  final String title;
  final String subTitle;
  final double width;
  final Widget Function(double width) content;
  final bool isTextField;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _TitleSection(
          title: title,
          subTitle: subTitle,
          showSubtitle: false,
        ),
        if (!isTextField) const SizedBox(height: AppSpace.l),
        content(width),
      ],
    );
  }
}

class _TitleSection extends StatelessWidget {
  const _TitleSection({
    required this.title,
    required this.subTitle,
    required this.showSubtitle,
  });

  final String title;
  final String subTitle;
  final bool showSubtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          title,
          style: context.appTheme.textStyles.h2,
        ),
        if (showSubtitle) ...[
          const SizedBox(height: AppSpace.s),
          AppText(
            subTitle,
            style: context.appTheme.textStyles.defaultText,
          ),
        ],
      ],
    );
  }
}
