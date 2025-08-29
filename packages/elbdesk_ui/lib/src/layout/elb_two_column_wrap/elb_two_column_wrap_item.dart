import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

class ElbTwoColumnItem<T extends Enum, L> extends ElbTwoColumnWrapItemBase<L> {
  // Private constructor
  ElbTwoColumnItem._({
    required _FieldRenderType renderType,
    this.field,
    this.keyboardType,
    this.outsideTrailing,
    this.onTextChanged,
    this.onDoubleChanged,
    this.onIntegerChanged,
    this.initialDateValue,
    this.onDateChanged,
    this.onAssignedUserChanged,
    this.initialAssignedUserValue,
    this.initialTextValue,
    this.initialIntegerValue,
    this.initialDoubleValue,
    this.titleLabel,
    this.hintText,
    this.showLabel = true,
    super.readOnly,
  })  : _renderType = renderType,
        super(
          label: 'placeholder', // Will be computed from field
        );

  // Factory constructors for each field type
  factory ElbTwoColumnItem.text({
    required ExtendedField<T, L> field,
    required String? initialValue,
    required void Function(String) onChanged,
    bool? readOnly,
    bool? showLabel,
    String? hintText,
  }) {
    return ElbTwoColumnItem._(
      field: field,
      initialTextValue: initialValue,
      onTextChanged: onChanged,
      renderType: _FieldRenderType.text,
      readOnly: readOnly,
      showLabel: showLabel ?? true,
      hintText: hintText,
    );
  }

  factory ElbTwoColumnItem.email({
    required ExtendedField<T, L> field,
    required String? initialValue,
    required void Function(String) onChanged,
    bool? readOnly,
    bool? showLabel,
  }) {
    return ElbTwoColumnItem._(
      field: field,
      initialTextValue: initialValue,
      onTextChanged: onChanged,
      renderType: _FieldRenderType.email,
      readOnly: readOnly,
      showLabel: showLabel ?? true,
    );
  }

  factory ElbTwoColumnItem.phone({
    required ExtendedField<T, L> field,
    required String? initialValue,
    required void Function(String) onChanged,
    bool? readOnly,
    bool? showLabel,
  }) {
    return ElbTwoColumnItem._(
      field: field,
      initialTextValue: initialValue,
      onTextChanged: onChanged,
      renderType: _FieldRenderType.phone,
      readOnly: readOnly,
      showLabel: showLabel ?? true,
    );
  }

  factory ElbTwoColumnItem.website({
    required ExtendedField<T, L> field,
    required String? initialValue,
    required void Function(String) onChanged,
    bool? readOnly,
    bool? showLabel,
  }) {
    return ElbTwoColumnItem._(
      field: field,
      initialTextValue: initialValue,
      onTextChanged: onChanged,
      renderType: _FieldRenderType.website,
      readOnly: readOnly,
      showLabel: showLabel ?? true,
    );
  }

  factory ElbTwoColumnItem.integer({
    required ExtendedField<T, L> field,
    required int? initialValue,
    required void Function(int?) onChanged,
    bool? readOnly,
    bool? showLabel,
  }) {
    return ElbTwoColumnItem._(
      field: field,
      initialIntegerValue: initialValue,
      onIntegerChanged: onChanged,
      renderType: _FieldRenderType.integer,
      readOnly: readOnly,
      showLabel: showLabel ?? true,
    );
  }

  factory ElbTwoColumnItem.double({
    required ExtendedField<T, L> field,
    required double? initialValue,
    required void Function(double?) onChanged,
    bool? readOnly,
    bool? showLabel,
  }) {
    return ElbTwoColumnItem._(
      field: field,
      initialDoubleValue: initialValue,
      onDoubleChanged: onChanged,
      renderType: _FieldRenderType.double,
      readOnly: readOnly,
      showLabel: showLabel ?? true,
    );
  }

  factory ElbTwoColumnItem.date({
    required ExtendedField<T, L> field,
    required DateTime? initialValue,
    required void Function(DateTime?) onChanged,
    bool? readOnly,
    bool? showLabel,
  }) {
    return ElbTwoColumnItem._(
      field: field,
      initialDateValue: initialValue,
      onDateChanged: onChanged,
      renderType: _FieldRenderType.date,
      readOnly: readOnly,
      showLabel: showLabel ?? true,
    );
  }

  factory ElbTwoColumnItem.assignedUser({
    required ExtendedField<T, L> field,
    required LightUser? initialValue,
    required void Function(LightUser?) onChanged,
    bool? readOnly,
  }) {
    return ElbTwoColumnItem._(
      field: field,
      initialAssignedUserValue: initialValue,
      onAssignedUserChanged: onChanged,
      renderType: _FieldRenderType.assignedUser,
      readOnly: readOnly,
    );
  }

  factory ElbTwoColumnItem.title({
    required String value,
  }) {
    return ElbTwoColumnItem._(
      titleLabel: value,
      renderType: _FieldRenderType.title,
    );
  }

  final ExtendedField<T, L>? field;
  // * INITIAL VALUES

  final DateTime? initialDateValue;

  final LightUser? initialAssignedUserValue;

  final String? initialTextValue;
  final int? initialIntegerValue;
  final double? initialDoubleValue;

  final _FieldRenderType _renderType;

  final TextInputType? keyboardType;
  final Widget? outsideTrailing;

  final void Function(String)? onTextChanged;
  final void Function(double?)? onDoubleChanged;
  final void Function(int?)? onIntegerChanged;

  final void Function(LightUser?)? onAssignedUserChanged;
  final void Function(DateTime?)? onDateChanged;
  final bool showLabel;
  final String? titleLabel;
  final String? hintText;

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
    // Use the render type passed from factory constructor
    final effectiveReadOnly = readOnly ?? parentReadOnly;

    // Type validation is now handled by factory constructors with proper typing

    // Create the appropriate item based on renderType
    final ElbTwoColumnWrapItemBase<L> item;

    switch (_renderType) {
      case _FieldRenderType.text:
        item = ElbTwoColumnWrapTextItem<L>(
          field: field,
          initialText: initialTextValue ?? '',
          onChanged: onTextChanged,
          readOnly: effectiveReadOnly,
          showLabel: showLabel,
          hintText: hintText,
        );

      case _FieldRenderType.email:
        item = ElbTwoColumnWrapEmailItem<L>(
          field: field,
          initialEmail: initialTextValue ?? '',
          onChanged: onTextChanged,
          readOnly: effectiveReadOnly,
          showLabel: showLabel,
        );

      case _FieldRenderType.phone:
        item = ElbTwoColumnWrapPhoneItem<L>(
          field: field,
          initialPhone: initialTextValue ?? '',
          onChanged: onTextChanged,
          readOnly: effectiveReadOnly,
          showLabel: showLabel,
        );

      case _FieldRenderType.website:
        item = ElbTwoColumnWrapWebsiteItem<L>(
          field: field,
          initialWebsite: initialTextValue ?? '',
          onChanged: onTextChanged,
          readOnly: effectiveReadOnly,
          showLabel: showLabel,
        );

      case _FieldRenderType.integer:
        item = ElbTwoColumnWrapIntItem<L>(
          field: field,
          value: initialIntegerValue,
          onChanged: onIntegerChanged,
          readOnly: effectiveReadOnly,
          showLabel: showLabel,
        );

      case _FieldRenderType.double:
        item = ElbTwoColumnWrapDoubleItem<L>(
          field: field,
          value: initialDoubleValue,
          onChanged: onDoubleChanged,
          readOnly: effectiveReadOnly,
          showLabel: showLabel,
        );

      case _FieldRenderType.date:
        item = ElbTwoColumnWrapDateItem<L>(
          field: field,
          initialDate: initialDateValue,
          onChanged: onDateChanged!,
          readOnly: effectiveReadOnly,
          showLabel: showLabel,
        );

      case _FieldRenderType.assignedUser:
        item = ElbTwoColumnWrapAssignUserItem<L>(
          field: field,
          initialUser: initialAssignedUserValue,
          onSelected: onAssignedUserChanged!,
          readOnly: effectiveReadOnly,
        );

      case _FieldRenderType.title:
        item = ElbTwoColumnWrapTitleItem<L>(
          label: titleLabel ?? '',
        );
    }

    // Now call buildWidget on the created item
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
enum _FieldRenderType {
  text,
  integer,
  double,
  date,
  assignedUser,
  email,
  phone,
  website,
  title,
}
