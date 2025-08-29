// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: prefer_asserts_with_message

import 'dart:ui' as ui show BoxHeightStyle, BoxWidthStyle;

import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/gestures.dart';
// ignore: no_flutter_material_import
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

export 'package:flutter/services.dart' show SmartDashesType, SmartQuotesType;

class AppTextFormField extends FormField<String> {
  AppTextFormField({
    super.key,
    this.groupId = EditableText,
    this.controller,
    String? initialValue,
    FocusNode? focusNode,
    super.forceErrorText,
    InputDecoration? decoration = const InputDecoration(),
    TextInputType? keyboardType,
    TextCapitalization textCapitalization = TextCapitalization.none,
    TextInputAction? textInputAction,
    TextStyle? style,
    StrutStyle? strutStyle,
    TextDirection? textDirection,
    TextAlign textAlign = TextAlign.start,
    TextAlignVertical? textAlignVertical,
    bool autofocus = false,
    bool readOnly = false,
    bool useReadOnlyTextColor = true,
    @Deprecated(
      'Use `contextMenuBuilder` instead. '
      'This feature was deprecated after v3.3.0-0.5.pre.',
    )
    ToolbarOptions? toolbarOptions,
    bool? showCursor,
    String obscuringCharacter = '•',
    bool obscureText = false,
    bool autocorrect = true,
    SmartDashesType? smartDashesType,
    SmartQuotesType? smartQuotesType,
    bool enableSuggestions = true,
    MaxLengthEnforcement? maxLengthEnforcement,
    int? maxLines = 1,
    int? minLines,
    bool expands = false,
    int? maxLength,
    this.onChanged,
    GestureTapCallback? onTap,
    bool onTapAlwaysCalled = false,
    TapRegionCallback? onTapOutside,
    VoidCallback? onEditingComplete,
    ValueChanged<String>? onFieldSubmitted,
    super.onSaved,
    super.validator,
    List<TextInputFormatter>? inputFormatters,
    bool? enabled,
    bool ignorePointers = false,
    double cursorWidth = 2.0,
    Radius? cursorRadius,
    Color? cursorColor,
    Color? cursorErrorColor,
    Brightness? keyboardAppearance,
    EdgeInsets scrollPadding = const EdgeInsets.all(20),
    bool? enableInteractiveSelection,
    TextSelectionControls? selectionControls,
    InputCounterWidgetBuilder? buildCounter,
    ScrollPhysics? scrollPhysics,
    Iterable<String>? autofillHints,
    AutovalidateMode? autovalidateMode,
    ScrollController? scrollController,
    super.restorationId,
    bool enableIMEPersonalizedLearning = true,
    MouseCursor? mouseCursor,
    EditableTextContextMenuBuilder? contextMenuBuilder =
        _defaultContextMenuBuilder,
    SpellCheckConfiguration? spellCheckConfiguration,
    TextMagnifierConfiguration? magnifierConfiguration,
    UndoHistoryController? undoController,
    AppPrivateCommandCallback? onAppPrivateCommand,
    bool? cursorOpacityAnimates,
    ui.BoxHeightStyle selectionHeightStyle = ui.BoxHeightStyle.tight,
    ui.BoxWidthStyle selectionWidthStyle = ui.BoxWidthStyle.tight,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
    ContentInsertionConfiguration? contentInsertionConfiguration,
    WidgetStatesController? statesController,
    Clip clipBehavior = Clip.hardEdge,
    bool scribbleEnabled = true,
    bool canRequestFocus = true,
    String? label,
    String? hintText,
    String? errorHintText,
    NextCardFormFieldLabelPosition labelPosition =
        NextCardFormFieldLabelPosition.left,
    Widget? suffixIcon,
    String? customErrorMessage,
    TextFieldErrorMessagePosition errorMessagePosition =
        TextFieldErrorMessagePosition.top,
    ValueNotifier<String?>? errorNotifier,
  })  : assert(initialValue == null || controller == null),
        assert(obscuringCharacter.length == 1),
        assert(maxLines == null || maxLines > 0),
        assert(minLines == null || minLines > 0),
        assert(
          (maxLines == null) || (minLines == null) || (maxLines >= minLines),
          "minLines can't be greater than maxLines",
        ),
        assert(
          !expands || (maxLines == null && minLines == null),
          'minLines and maxLines must be null when expands is true.',
        ),
        assert(
          !obscureText || maxLines == 1,
          'Obscured fields cannot be multiline.',
        ),
        assert(
          maxLength == null ||
              maxLength == TextField.noMaxLength ||
              maxLength > 0,
        ),
        super(
          initialValue:
              controller != null ? controller.text : (initialValue ?? ''),
          enabled: enabled ?? decoration?.enabled ?? true,
          autovalidateMode: autovalidateMode ?? AutovalidateMode.onUnfocus,
          builder: (FormFieldState<String> field) {
            final state = field as _TextFormFieldState;

            void onChangedHandler(String value) {
              field.didChange(value);
              onChanged?.call(value);
            }

            final errorMessage = field.errorText;

            final generalColors = field.context.appTheme.generalColors;
            final borderRadiuses = field.context.appTheme.borderRadiuses;
            final textFieldProperties =
                field.context.appTheme.textFieldProperties;
            final statusColors = field.context.appTheme.statusColors;
            final styles = field.context.appTheme.textStyles.textFieldStyle;
            final border = OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(borderRadiuses.xs),
              ),
              borderSide: BorderSide(
                color: field.hasError || customErrorMessage != null
                    ? statusColors.error
                    : textFieldProperties.borderColor,
              ),
            );

            final disabledBorder = OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(borderRadiuses.xs),
              ),
              borderSide: BorderSide(
                color: textFieldProperties.disabledBorderColor,
              ),
            );

            final activeBorder = OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(borderRadiuses.xs),
              ),
              borderSide: BorderSide(
                color: field.hasError || customErrorMessage != null
                    ? statusColors.error
                    : generalColors.primary,
                width: 2,
              ),
            );

            return UnmanagedRestorationScope(
              bucket: field.bucket,
              // TODO(all): fix, old code:
              // child: Theme(
              //   data:

              //
              //   field.context.theme.copyWith(
              //     textSelectionTheme: TextSelectionThemeData(
              //       cursorColor: field.hasError
              //           ? textFieldProperties.errorColor
              //           : appColors.primary,
              //     ),
              //   ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (label != null ||
                      errorMessagePosition == TextFieldErrorMessagePosition.top)
                    Row(
                      children: [
                        if (label == null)
                          const SizedBox.shrink()
                        else if (labelPosition ==
                            NextCardFormFieldLabelPosition.top)
                          AppText(
                            label,
                            autoSize: false,
                            maxLines: 1,
                          ),
                        if (labelPosition ==
                            NextCardFormFieldLabelPosition.left)
                          const AppText('', autoSize: false),
                        const SizedBox(width: 8),
                        if ((errorMessage != null ||
                                customErrorMessage != null) &&
                            errorMessagePosition ==
                                TextFieldErrorMessagePosition.top)
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  child: AppText(
                                    errorMessage ?? customErrorMessage ?? '',
                                    autoSize: false,
                                    color: statusColors.error,
                                    textAlign: TextAlign.right,
                                    maxLines: 1,
                                    fontSize: 14,
                                  ),
                                ),
                                if (errorHintText != null)
                                  _ErrorHint(
                                    errorHintText: errorHintText,
                                  ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (labelPosition ==
                              NextCardFormFieldLabelPosition.left &&
                          label != null)
                        SizedBox(
                          width: UiConstants.leftLabelWidth,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 2),
                            child: AppTooltip(
                              message: label,
                              waitDuration: const Duration(milliseconds: 500),
                              preferBelow: false,
                              child: AppText(
                                label,
                                autoSize: false,
                                height: 1.2,
                                maxLines: 2,
                              ),
                            ),
                          ),
                        ),
                      Expanded(
                        child: TextField(
                          autofocus: autofocus,
                          groupId: groupId,
                          restorationId: restorationId,
                          controller: state._effectiveController,
                          focusNode: focusNode,
                          // style: TextStyle(
                          //   color: textFieldColors.disabledBorderColor,
                          //   fontSize: 22,
                          // ),
                          style: field
                              .context.appTheme.textStyles.textFieldStyle
                              .copyWith(
                            color: (readOnly && useReadOnlyTextColor) ||
                                    ignorePointers
                                ? textFieldProperties.disabledForegroundColor
                                : null,
                          ),
                          decoration: decoration?.copyWith(
                            enabled: !ignorePointers,
                            isDense: true,
                            border: readOnly ? disabledBorder : border,
                            errorBorder: readOnly ? disabledBorder : border,
                            enabledBorder: readOnly ? disabledBorder : border,
                            focusedBorder:
                                readOnly ? disabledBorder : activeBorder,
                            focusedErrorBorder:
                                readOnly ? disabledBorder : border,
                            disabledBorder: disabledBorder,
                            prefixIconConstraints: const BoxConstraints(
                              minWidth: 32,
                            ),
                            alignLabelWithHint: true,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 8,
                            ),
                            hintText: hintText,
                            hintStyle: styles.copyWith(
                              color: textFieldProperties.hintTextColor,
                            ),
                            suffixIconConstraints: const BoxConstraints(),
                            suffixIcon: suffixIcon,
                          ),
                          keyboardType: keyboardType,
                          textInputAction: textInputAction,
                          strutStyle: strutStyle,
                          textAlign: textAlign,
                          textAlignVertical: textAlignVertical,
                          textDirection: textDirection,
                          textCapitalization: textCapitalization,

                          statesController: statesController,

                          readOnly: readOnly,
                          showCursor: showCursor,
                          obscuringCharacter: obscuringCharacter,
                          obscureText: obscureText,
                          autocorrect: autocorrect,
                          smartDashesType: smartDashesType ??
                              (obscureText
                                  ? SmartDashesType.disabled
                                  : SmartDashesType.enabled),
                          smartQuotesType: smartQuotesType ??
                              (obscureText
                                  ? SmartQuotesType.disabled
                                  : SmartQuotesType.enabled),
                          enableSuggestions: enableSuggestions,
                          maxLengthEnforcement: maxLengthEnforcement,
                          maxLines: maxLines,
                          minLines: minLines,
                          expands: expands,
                          maxLength: maxLength,
                          onChanged: onChangedHandler,
                          onTap: onTap,
                          onTapAlwaysCalled: onTapAlwaysCalled,
                          onTapOutside: onTapOutside,
                          onEditingComplete: onEditingComplete,
                          onSubmitted: onFieldSubmitted,
                          inputFormatters: inputFormatters,
                          enabled: enabled ?? decoration?.enabled ?? true,
                          ignorePointers: ignorePointers,
                          cursorWidth: cursorWidth,
                          cursorHeight: UiConstants.textFieldCursorHeight,
                          cursorRadius: cursorRadius,
                          cursorColor: cursorColor,
                          cursorErrorColor: cursorErrorColor,
                          scrollPadding: scrollPadding,
                          scrollPhysics: scrollPhysics,
                          keyboardAppearance: keyboardAppearance,
                          enableInteractiveSelection:
                              enableInteractiveSelection ??
                                  (!obscureText || !readOnly),
                          selectionControls: selectionControls,
                          buildCounter: buildCounter,
                          autofillHints: autofillHints,
                          scrollController: scrollController,
                          enableIMEPersonalizedLearning:
                              enableIMEPersonalizedLearning,
                          mouseCursor: mouseCursor,
                          contextMenuBuilder: contextMenuBuilder,
                          spellCheckConfiguration: spellCheckConfiguration,
                          magnifierConfiguration: magnifierConfiguration,
                          undoController: undoController,
                          onAppPrivateCommand: onAppPrivateCommand,
                          cursorOpacityAnimates: cursorOpacityAnimates,
                          selectionHeightStyle: selectionHeightStyle,
                          selectionWidthStyle: selectionWidthStyle,
                          dragStartBehavior: dragStartBehavior,
                          contentInsertionConfiguration:
                              contentInsertionConfiguration,
                          clipBehavior: clipBehavior,
                          scribbleEnabled: scribbleEnabled,
                          canRequestFocus: canRequestFocus,
                        ),
                      ),
                    ],
                  ),
                  if ((errorMessage != null || customErrorMessage != null) &&
                      errorMessagePosition ==
                          TextFieldErrorMessagePosition.bottom)
                    Align(
                      alignment: Alignment.centerRight,
                      child: AppText(
                        errorMessage ?? customErrorMessage ?? '',
                        autoSize: false,
                        fontSize: 12,
                        maxLines: 1,
                        color: statusColors.error,
                      ),
                    ),
                ],
              ),
              // ),
            );
          },
        );

  /// Controls the text being edited.
  ///
  /// If null, this widget will create its own [TextEditingController] and
  /// initialize its [TextEditingController.text] with [initialValue].
  final TextEditingController? controller;

  /// {@macro flutter.widgets.editableText.groupId}
  final Object groupId;

  /// {@template flutter.material.TextFormField.onChanged}
  /// Called when the user initiates a change to the TextField's
  /// value: when they have inserted or deleted text or reset the form.
  /// {@endtemplate}
  final ValueChanged<String>? onChanged;

  static Widget _defaultContextMenuBuilder(
    BuildContext context,
    EditableTextState editableTextState,
  ) {
    return AdaptiveTextSelectionToolbar.editableText(
      editableTextState: editableTextState,
    );
  }

  @override
  FormFieldState<String> createState() => _TextFormFieldState();
}

class _ErrorHint extends HookWidget {
  const _ErrorHint({
    required this.errorHintText,
  });
  final String errorHintText;
  @override
  Widget build(BuildContext context) {
    final statusColors = context.appTheme.statusColors;
    final overlayEntry = useState<OverlayEntry?>(null);
    final iconKey = useRef(GlobalKey());
    final borderRadiuses = context.appTheme.borderRadiuses;
    void showOverlay() {
      final iconBox =
          iconKey.value.currentContext!.findRenderObject()! as RenderBox;
      final iconPosition = iconBox.localToGlobal(Offset.zero);

      overlayEntry.value = OverlayEntry(
        builder: (context) => Positioned(
          left: iconPosition.dx - 0,
          top: iconPosition.dy - 10, // Position above the icon
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: statusColors.error,
              border: Border.all(color: statusColors.error, width: 0.5),
              borderRadius: BorderRadius.circular(borderRadiuses.xs),
            ),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 200),
              child: AppText(
                errorHintText,
                color: statusColors.onError,
                fontSize: 14,
              ),
            ),
          ),
        ),
      );
      Overlay.of(context).insert(overlayEntry.value!);
    }

    void hideOverlay() {
      overlayEntry.value?.remove();
      overlayEntry.value = null;
    }

    return MouseRegion(
      hitTestBehavior: HitTestBehavior.opaque,
      onEnter: (_) => showOverlay(),
      onExit: (_) => hideOverlay(),
      cursor: SystemMouseCursors.help,
      child: Padding(
        padding: const EdgeInsets.only(left: 4),
        child: ElbIcon(
          key: iconKey.value,
          AppIcons.errorHint,
          color: statusColors.error,
          size: AppIconSize.l,
        ),
      ),
    );
  }
}

class _TextFormFieldState extends FormFieldState<String> {
  RestorableTextEditingController? _controller;

  TextEditingController get _effectiveController =>
      _textFormField.controller ?? _controller!.value;

  AppTextFormField get _textFormField => super.widget as AppTextFormField;

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    super.restoreState(oldBucket, initialRestore);
    if (_controller != null) {
      _registerController();
    }
    // Make sure to update the internal [FormFieldState] value to sync up with
    // text editing controller value.
    setValue(_effectiveController.text);
  }

  void _registerController() {
    assert(_controller != null);
    registerForRestoration(_controller!, 'controller');
  }

  void _createLocalController([TextEditingValue? value]) {
    assert(_controller == null);
    _controller = value == null
        ? RestorableTextEditingController()
        : RestorableTextEditingController.fromValue(value);
    if (!restorePending) {
      _registerController();
    }
  }

  @override
  void initState() {
    super.initState();
    if (_textFormField.controller == null) {
      _createLocalController(
        widget.initialValue != null
            ? TextEditingValue(text: widget.initialValue!)
            : null,
      );
    } else {
      _textFormField.controller!.addListener(_handleControllerChanged);
    }
  }

  @override
  void didUpdateWidget(AppTextFormField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_textFormField.controller != oldWidget.controller) {
      oldWidget.controller?.removeListener(_handleControllerChanged);
      _textFormField.controller?.addListener(_handleControllerChanged);

      if (oldWidget.controller != null && _textFormField.controller == null) {
        _createLocalController(oldWidget.controller!.value);
      }

      if (_textFormField.controller != null) {
        setValue(_textFormField.controller!.text);
        if (oldWidget.controller == null) {
          unregisterFromRestoration(_controller!);
          _controller!.dispose();
          _controller = null;
        }
      }
    }
  }

  @override
  void dispose() {
    _textFormField.controller?.removeListener(_handleControllerChanged);
    _controller?.dispose();
    super.dispose();
  }

  @override
  void didChange(String? value) {
    if (!mounted) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      super.didChange(value);

      if (_effectiveController.text != value) {
        _effectiveController.text = value ?? '';
      }
    });
  }

  @override
  void reset() {
    // Set the controller value before calling super.reset() to let
    // _handleControllerChanged suppress the change.
    _effectiveController.text = widget.initialValue ?? '';
    super.reset();
    _textFormField.onChanged?.call(_effectiveController.text);
  }

  void _handleControllerChanged() {
    // Suppress changes that originated from within this class.
    //
    // In the case where a controller has been passed in to this widget, we
    // register this change listener. In these cases, we'll also receive change
    // notifications for changes originating from within this class -- for
    // example, the reset() method. In such cases, the FormField value will
    // already have been set.
    if (_effectiveController.text != value) {
      didChange(_effectiveController.text);
    }
  }
}

enum TextFieldErrorMessagePosition {
  /// Positiones the error message on the right side of the title
  top,

  /// Positions the error message below the textField
  bottom,
  none,
}
