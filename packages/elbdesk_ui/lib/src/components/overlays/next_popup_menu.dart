import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';

class NextPopupMenu extends StatefulWidget {
  const NextPopupMenu({
    required this.menuChildren,
    required this.child,
    super.key,
  });
  final List<NextMenuItemButton> menuChildren;
  final Widget Function(NextMenuController controller) child;

  @override
  State<NextPopupMenu> createState() => _NextPopupMenuState();
}

class _NextPopupMenuState extends State<NextPopupMenu> {
  late final NextMenuController controller;
  Size? buttonSize;
  @override
  void initState() {
    super.initState();
    controller = NextMenuController();
  }

  @override
  Widget build(BuildContext context) {
    return NextMenuAnchor(
      alignmentOffset: const Offset(0, 5),
      controller: controller,
      onDismiss: () {},
      menuChildren: widget.menuChildren,
      child: widget.child(controller),
    );
  }
}
