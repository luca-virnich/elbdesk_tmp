import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

class ElbTwoColumnDropdown<T extends Enum, L, V>
    extends ElbTwoColumnWrapItemBase<L> {
  // Private constructor
  ElbTwoColumnDropdown._({
    required this.field,
    required _DropdownRenderType renderType,
    this.lazyDataProvider,
    this.lazyItemLabelBuilder,
    this.outsideTrailing,
    this.initialLazyTextDropdownValue,
    this.onLazyTextDropdownChanged,
    this.onSelectionChanged,
    this.onTextDropdownChanged,
    this.initialSelectionValue,
    this.initialTextDropdownValue,
    super.readOnly,
  })  : _renderType = renderType,
        super(
          label: 'placeholder', // Will be computed from field
        );

  // Static factory for text dropdown - allows type inference
  factory ElbTwoColumnDropdown.text({
    required ExtendedField<T, L> field,
    required V? initialValue,
    required void Function(V?) onChanged,
    bool? readOnly,
  }) {
    return ElbTwoColumnDropdown<T, L, V>._(
      field: field,
      initialTextDropdownValue: initialValue,
      onTextDropdownChanged: onChanged,
      renderType: _DropdownRenderType.textDropdown,
      readOnly: readOnly,
    );
  }

  // Static factory for lazy text dropdown - allows type inference
  factory ElbTwoColumnDropdown.lazyText({
    required ExtendedField<T, L> field,
    required String? initialValueText,
    required void Function(V?) onChanged,
    required ProviderListenable<AsyncValue<List<V>>> lazyDataProvider,
    required String Function(V) lazyItemLabelBuilder,
    Widget? outsideTrailing,
    bool? readOnly,
  }) {
    return ElbTwoColumnDropdown<T, L, V>._(
      field: field,
      initialLazyTextDropdownValue: initialValueText,
      onLazyTextDropdownChanged: onChanged,
      renderType: _DropdownRenderType.lazyTextDropdown,
      lazyDataProvider: lazyDataProvider,
      lazyItemLabelBuilder: lazyItemLabelBuilder,
      outsideTrailing: outsideTrailing,
      readOnly: readOnly,
    );
  }

  // Static factory for selection dropdown - allows type inference
  factory ElbTwoColumnDropdown.selection({
    required ExtendedField<T, L> field,
    required V? value,
    required void Function(V) onChanged,
    bool? readOnly,
  }) {
    return ElbTwoColumnDropdown<T, L, V>._(
      field: field,
      initialSelectionValue: value,
      onSelectionChanged: onChanged,
      renderType: _DropdownRenderType.selection,
      readOnly: readOnly,
    );
  }

  final ExtendedField<T, L> field;

  // Initial values
  final String? initialLazyTextDropdownValue;
  final V? initialSelectionValue;
  final V? initialTextDropdownValue;

  final _DropdownRenderType _renderType;
  final ProviderListenable<AsyncValue<List<V>>>? lazyDataProvider;
  final String Function(V)? lazyItemLabelBuilder;
  final Widget? outsideTrailing;

  // Callbacks
  final void Function(V?)? onLazyTextDropdownChanged;
  final void Function(V)? onSelectionChanged;
  final void Function(V?)? onTextDropdownChanged;

  @override
  Widget buildWidget({
    required NextCardFormFieldLabelPosition labelPosition,
    required bool parentReadOnly,
    required String? validationGroupId,
    required ElbCoreLocalizations l10n,
    required String? tableType,
    required L customL10n,
    required double childWidth,
  }) {
    final effectiveReadOnly = readOnly ?? parentReadOnly;
    final ElbTwoColumnWrapItemBase<L> item;

    switch (_renderType) {
      case _DropdownRenderType.textDropdown:
        final filterItems =
            field.items!(l10n, customL10n) as List<DropdownItem<V>>;

        // Find the label for the current value
        String? initialLabel;
        if (initialTextDropdownValue != null) {
          try {
            final currentItem = filterItems.firstWhere(
              (item) => item.value == initialTextDropdownValue,
            );
            initialLabel = currentItem.label;
          } catch (_) {
            initialLabel = initialTextDropdownValue.toString();
          }
        }

        item = ElbTwoColumnWrapTextDropdownItem<V, L>(
          field: field,
          initialValue: initialLabel ?? '',
          dropdownMenuEntries: filterItems
              .map(
                (item) => NextDropdownMenuEntry<V>(
                  label: item.label,
                  value: item.value,
                ),
              )
              .toList(),
          onSelected: onTextDropdownChanged!,
          readOnly: effectiveReadOnly,
        );

      case _DropdownRenderType.lazyTextDropdown:
        assert(
          lazyDataProvider != null && lazyItemLabelBuilder != null,
          'lazyDataProvider and lazyItemLabelBuilder must be provided for '
          'lazy dropdown fields',
        );

        item = ElbTwoColumnWrapLazyTextDropdownItem<V, L>(
          field: field,
          itemLabelBuilder: (item) => lazyItemLabelBuilder!(item),
          initialValue: initialLazyTextDropdownValue ?? '',
          dataProvider: lazyDataProvider!,
          onSelected: onLazyTextDropdownChanged!,
          outsideTrailing: outsideTrailing,
          readOnly: effectiveReadOnly,
        );

      case _DropdownRenderType.selection:
        final items = field.items!(l10n, customL10n) as List<DropdownItem<V>>;

        // Find the current value's label
        String? currentLabel;
        if (initialSelectionValue != null) {
          try {
            final currentItem = items.firstWhere(
              (item) => item.value == initialSelectionValue,
            );
            currentLabel = currentItem.label;
          } catch (_) {
            currentLabel = initialSelectionValue.toString();
          }
        }

        item = ElbTwoColumnWrapSelectionDropdownItem<L>(
          label: field.readable(l10n, customL10n),
          items: items
              .map(
                (dropItem) => ElbSelectionDropdownItem(
                  label: dropItem.label,
                  onPressed: () => onSelectionChanged!(dropItem.value),
                  color: Colors.blue,
                ),
              )
              .toList(),
          hasValue: initialSelectionValue != null,
          initialValue: currentLabel,
          statusColor: Colors.blue, // Default color
          readOnly: effectiveReadOnly,
          isMandatory: field.isMandatory ?? false,
        );
    }

    return item.buildWidget(
      labelPosition: labelPosition,
      parentReadOnly: parentReadOnly,
      validationGroupId: validationGroupId,
      l10n: l10n,
      tableType: tableType,
      customL10n: customL10n,
      childWidth: childWidth,
    );
  }
}

/// Private enum for internal use only
enum _DropdownRenderType {
  textDropdown,
  lazyTextDropdown,
  selection,
}
