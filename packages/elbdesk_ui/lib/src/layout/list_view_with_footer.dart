import 'package:elbdesk_ui/src/core/constants/ui_constants.dart';
import 'package:flutter/material.dart';

/// ListView with Footer
///
// TODO(kz): Document
class ListViewWithFooter extends StatelessWidget {
  /// Constructor
  const ListViewWithFooter({
    required this.children,
    required this.footer,
    super.key,
    this.isLazy = false,
    this.header,
    this.childrenPadding,
    this.isFooterFixed = false,
    this.isHeaderFixed = true,
    this.scrollController,
  });

  /// Children
  final List<Widget> children;

  /// Footer
  final Widget footer;

  /// Header
  final Widget? header;

  /// Weither to lazy load children
  final bool isLazy;

  /// Weither the footer should be fixed
  final bool isFooterFixed;

  /// Weither the header should be fixed
  final bool isHeaderFixed;

  /// Padding for children
  final EdgeInsets? childrenPadding;

  /// Scroll Controller
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (header != null) header!,
        Flexible(
          child: CustomScrollView(
            controller: scrollController,
            physics: const BouncingScrollPhysics(),
            slivers: <Widget>[
              if (!isHeaderFixed && header != null)
                SliverToBoxAdapter(
                  child: header,
                ),
              if (isLazy)
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      if (childrenPadding != null)
                        ...children.map(
                          (e) => Padding(padding: childrenPadding!, child: e),
                        ),
                      if (childrenPadding == null) ...children,
                      const SizedBox(
                        height: UiConstants.defaultPadding,
                      ),
                    ],
                  ),
                )
              else
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      if (childrenPadding != null)
                        ...children.map(
                          (e) => Padding(padding: childrenPadding!, child: e),
                        ),
                      if (childrenPadding == null) ...children,
                      const SizedBox(
                        height: UiConstants.defaultPadding,
                      ),
                    ],
                  ),
                ),
              if (!isFooterFixed)
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: footer,
                  ),
                ),
            ],
          ),
        ),
        if (isFooterFixed) footer,
      ],
    );
  }
}
