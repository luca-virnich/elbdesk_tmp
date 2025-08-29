import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AppTableCellDropdownField<T> extends HookWidget {
  const AppTableCellDropdownField({
    required this.dropdownMenuEntries,
    required this.onSelected,
    required this.initialValue,
    required super.key,
    required this.readOnly,
  });

  final List<NextDropdownMenuEntry<T>> dropdownMenuEntries;

  final void Function(T? value) onSelected;
  final String? initialValue;
  final bool readOnly;
  @override
  Widget build(BuildContext context) {
    return NextDropdownMenu<T>(
      readOnly: readOnly,
      dropdownMenuEntries: dropdownMenuEntries,
      isInTableCell: true,
      // focusNode: focusNode,
      onSelected: onSelected,
      initialValue: initialValue,
    );
    // return NextDropdownMenu<T>(
    //   readOnly: readOnly,
    //   dropdownMenuEntries: dropdownMenuEntries,
    //   isInTableCell: true,
    //   focusNode: focusNode,
    //   onSelected: onSelected,
    //   initialSelection: initialSelection,
    // );
  }
}
