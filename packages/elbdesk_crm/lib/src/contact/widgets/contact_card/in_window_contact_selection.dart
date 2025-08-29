import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:project_core/project_core.dart';

enum _Type {
  person,
  company,
  all,
}

class InWindowContactSelection extends StatelessWidget {
  const InWindowContactSelection.person({
    required this.onSelect,
    required this.floatingWindowId,
    required this.navigatorKey,
    required this.floatingWindowFocus,
    required this.isLoading,
    required this.titleText,
    this.maxHeight,
    this.hiddenFilterGroup,
    super.key,
  }) : _type = _Type.person;

  const InWindowContactSelection.company({
    required this.onSelect,
    required this.floatingWindowId,
    required this.navigatorKey,
    required this.floatingWindowFocus,
    required this.isLoading,
    required this.titleText,
    this.hiddenFilterGroup,
    this.maxHeight,
    super.key,
  }) : _type = _Type.company;

  const InWindowContactSelection.all({
    required this.onSelect,
    required this.floatingWindowId,
    required this.navigatorKey,
    required this.floatingWindowFocus,
    required this.isLoading,
    required this.titleText,
    this.hiddenFilterGroup,
    this.maxHeight,
    super.key,
  }) : _type = _Type.all;

  final Future<void> Function(Contact)? onSelect;
  final String floatingWindowId;
  final GlobalKey<NavigatorState> navigatorKey;
  final FocusNode floatingWindowFocus;
  final bool isLoading;
  final String titleText;
  final FilterGroup? hiddenFilterGroup;
  final double? maxHeight;
  final _Type _type;
  @override
  Widget build(BuildContext context) {
    return ElbDialog(
      floatingWindowId: floatingWindowId,
      isLoading: isLoading,
      title: titleText,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: maxHeight ?? 600,
        ),
        child: switch (_type) {
          _Type.person => ContactTable.persons(
              onSelect: onSelect,
              isSelection: true,
              hiddenFilterGroup: hiddenFilterGroup,
              showToolbarDivider: true,
              showTableViews: false,
              componentIdentifier:
                  ComponentIdentifier.contactTablePersonSelection,
              isCollapsible: false,
            ),
          _Type.company => ContactTable.companies(
              onSelect: onSelect,
              isSelection: true,
              hiddenFilterGroup: hiddenFilterGroup,
              showToolbarDivider: true,
              showTableViews: false,
              componentIdentifier:
                  ComponentIdentifier.contactTableCompanySelection,
              isCollapsible: false,
            ),
          _Type.all => ContactTable.all(
              onSelect: onSelect,
              isSelection: true,
              showTableViews: false,
              hiddenFilterGroup: hiddenFilterGroup,
              showToolbarDivider: true,
              componentIdentifier: ComponentIdentifier.contactTableSelection,
              isCollapsible: false,
            ),
        },
      ),
    );
  }
}
