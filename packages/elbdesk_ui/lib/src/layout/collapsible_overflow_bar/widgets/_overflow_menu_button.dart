import 'package:flutter/material.dart';

class OverflowPopupMenuButton extends StatelessWidget {
  const OverflowPopupMenuButton({
    required this.children,
    // ignore: unused_element
    super.key,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      icon: const Icon(Icons.more_vert),
      onSelected: (int result) {},
      itemBuilder: (BuildContext context) {
        return List.generate(children.length, (index) {
          return PopupMenuItem<int>(
            value: index,
            child: children[index],
          );
        });
      },
    );
  }
}
