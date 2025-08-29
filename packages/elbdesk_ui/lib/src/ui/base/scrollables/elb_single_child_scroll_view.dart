import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

class ElbSingleChildScrollView extends StatefulWidget {
  const ElbSingleChildScrollView({
    required this.child,
    super.key,
    this.controller,
    this.padding,
  });
  final Widget child;
  final ScrollController? controller;
  final EdgeInsets? padding;

  @override
  State<ElbSingleChildScrollView> createState() =>
      _ElbSingleChildScrollViewState();
}

class _ElbSingleChildScrollViewState extends State<ElbSingleChildScrollView> {
  late final ScrollController _scrollController;
  @override
  void initState() {
    _scrollController = widget.controller ?? ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _scrollController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScrollbar(
      controller: _scrollController,
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          scrollbars: false,
        ),
        child: SingleChildScrollView(
          padding: widget.padding,
          controller: _scrollController,
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          physics: const ClampingScrollPhysics(),
          child: widget.child,
        ),
      ),
    );
  }
}
