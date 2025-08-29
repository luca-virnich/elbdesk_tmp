import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:elbdesk_ui/src/components/dialogs/suggestion_intent_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// A text input field designed for use within table cells (AppTableView)
///
/// Provides different constructors for handling text, double, and int inputs,
/// applying appropriate formatters
/// Includes optional drag-and-drop functionality to copy values between fields
class AppTableCellInputField extends HookWidget {
  /// Creates a text input field for general text
  const AppTableCellInputField.text({
    required this.readOnly,
    super.key,
    this.validator,
    this.inputFormatters,
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.controller,
    this.initialText,
    this.fieldSuggestion,
    this.floatingWindowId,
    this.navigatorKey,
    this.floatingWindowFocus,
    this.isDraggable = false,
    this.isDroppable = false,
  })  : _type = _FieldType.text,
        initialInt = null,
        initialDouble = null;

  /// Creates a text input field specifically for double values
  /// Applies formatters allowing digits and a single decimal separator
  AppTableCellInputField.double({
    required this.readOnly,
    super.key,
    this.validator,
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.controller,
    this.initialDouble,
    this.fieldSuggestion,
    this.floatingWindowId,
    this.navigatorKey,
    this.floatingWindowFocus,
    this.isDraggable = false,
    this.isDroppable = false,
  })  : _type = _FieldType.double,
        initialText = null,
        initialInt = null,
        inputFormatters = [
          AppInputFormatters.onlyDigitsAndSingleDecimal(
            maxDecimalPlaces: null,
          ),
        ];

  /// Creates a text input field specifically for integer values
  /// Applies formatters allowing only digits
  AppTableCellInputField.int({
    required this.readOnly,
    super.key,
    this.validator,
    this.onChanged,
    this.onEditingComplete,
    this.controller,
    this.onFieldSubmitted,
    this.initialInt,
    this.fieldSuggestion,
    this.floatingWindowId,
    this.navigatorKey,
    this.floatingWindowFocus,
    this.isDraggable = false,
    this.isDroppable = false,
  })  : _type = _FieldType.int,
        initialText = null,
        initialDouble = null,
        inputFormatters = [
          AppInputFormatters.onlyDigits(allowNegative: false),
        ];

  /// Standard input validation function
  final String? Function(String?)? validator;

  /// Input formatters to control allowed characters
  final List<TextInputFormatter>? inputFormatters;

  /// Callback when the field's value changes
  final void Function(String)? onChanged;

  /// A function that provides a list of suggestions.
  final FieldSuggestion? fieldSuggestion;

  /// The ID of the floating window, required if [suggestionProvider] is used.
  final String? floatingWindowId;

  /// The navigator key, required if [suggestionProvider] is used.
  final GlobalKey<NavigatorState>? navigatorKey;

  /// The focus node for the floating window, required if
  /// [suggestionProvider] is used.
  final FocusNode? floatingWindowFocus;

  /// Initial value of the int
  final int? initialInt;

  /// Initial value of the double
  final double? initialDouble;

  /// Initial value of the text
  final String? initialText;

  /// Callback when editing is complete (User presses Done)
  final void Function()? onEditingComplete;

  /// Internal type identifier used for formatting and keyboard type
  final _FieldType _type;

  /// Optional external controller
  /// If provided, the widget uses this instead of creating its own
  final TextEditingController? controller;

  /// Readonly
  final bool readOnly;

  /// Callback when the field is submitted (User presses Enter)
  final void Function(String)? onFieldSubmitted;

  /// If true, the content of this field can be dragged using a long press
  /// Defaults to false
  final bool isDraggable;

  /// If true, this field can accept values dropped onto it from another
  /// [AppTableCellInputField].
  /// Defaults to false
  final bool isDroppable;

  @override
  Widget build(BuildContext context) {
    final generalColors = context.appTheme.generalColors;
    final localeName = context.l10n.localeName;

    // Determine initial text based on the field type
    final initialValueText = switch (_type) {
      _FieldType.text => initialText ?? '',
      _FieldType.double => initialDouble?.formatted(localeName) ?? '',
      _FieldType.int => initialInt?.toString() ?? '',
    };
    final effectiveController =
        controller ?? useTextEditingController(text: initialValueText);

    final focusNode = useFocusNode();

    // Manage the visual highlight state for the drop target
    final isHighlightedNotifier = useValueNotifier<bool>(false);

    // ** Widget Construction
    // 1. Build the core input field widget
    // Just return this for the old behaviour of this widget
    final Widget textField = NextTextFormField(
      controller: effectiveController,
      readOnly: readOnly,
      isInTableCell: true,
      focusNode: focusNode,
      onChanged: onChanged,
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      onEditingComplete: onEditingComplete,
      inputFormatters: inputFormatters,
      keyboardType: _type == _FieldType.text
          ? TextInputType.text
          : TextInputType.numberWithOptions(
              decimal: _type == _FieldType.double,
            ),
    );

    // 2. Conditionally wrap the text field with LongPressDraggable if enabled
    var draggableTextField = textField;
    if (isDraggable && !readOnly && effectiveController.text.isNotEmpty) {
      draggableTextField = LongPressDraggable<String>(
        delay: AnimationConstants.shortDuration,
        // The text being dragged
        data: effectiveController.text,
        feedback:
            // Widget shown under the cursor during drag
            ClipRRect(
          borderRadius:
              BorderRadius.circular(context.appTheme.borderRadiuses.s),
          child: Material(
            elevation: AppSpace.xs,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 150),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpace.s,
                  vertical: AppSpace.xs,
                ),
                decoration: BoxDecoration(
                  color: generalColors.primarySurface,
                  borderRadius:
                      BorderRadius.circular(context.appTheme.borderRadiuses.s),
                ),
                child: AppText(
                  effectiveController.text,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ),
        // How the original field looks while its content is being dragged
        // -> This makes it slightly transparent to indicate that this field
        // is the source of the drag
        childWhenDragging: Opacity(
          opacity: 0.5,
          child: textField,
        ),
        // The widget that initiates the drag
        child: textField,
      );
    }

    // 3. Conditionally wrap for dropping using DragTarget
    var finalWidget = draggableTextField;
    if (isDroppable && !readOnly) {
      finalWidget = DragTarget<String>(
        // The builder renders the potential drop target area
        // It returns a ValueListenableBuilder to handle highlight changes
        // efficiently
        builder: (context, candidateData, rejectedData) {
          return ValueListenableBuilder<bool>(
            valueListenable: isHighlightedNotifier,
            // This builder creates the visual highlight container
            builder: (context, isHighlighted, child) {
              return ColoredBox(
                color: isHighlighted
                    ? generalColors.primary.withAppOpacity(0.2)
                    : generalColors.transparent,
                // The actual content is passed as the child preventing it
                // from rebuilding when only the highlight changes
                child: child,
              );
            },
            // Pass the content built in step 2
            child: draggableTextField,
          );
        },
        // Called when a draggable enters the target area & updates highlight
        onWillAcceptWithDetails: (details) {
          if (_type == _FieldType.double) {
            final asDouble = Parser.parseDouble(details.data);
            if (asDouble == null) {
              return false;
            }
          }
          if (_type == _FieldType.int) {
            final asInt = int.tryParse(details.data);
            if (asInt == null) {
              return false;
            }
          }

          final accept = details.data != effectiveController.text;
          if (accept && !isHighlightedNotifier.value) {
            isHighlightedNotifier.value = true;
          } else if (!accept && isHighlightedNotifier.value) {
            isHighlightedNotifier.value = false;
          }
          return accept;
        },
        // Called when a draggable is dropped and accepted & updates text
        onAcceptWithDetails: (details) {
          effectiveController.text = details.data;
          onChanged?.call(details.data);
          isHighlightedNotifier.value = false;
        },
        // Called when a draggable leaves the target area & turns off highlight
        onLeave: (data) {
          isHighlightedNotifier.value = false;
        },
      );
    }

    return Shortcuts(
      shortcuts: {
        suggestShortcutMeta: const SuggestIntent(),
        suggestShortcutControl: const SuggestIntent(),
      },
      child: Actions(
        actions: {
          SuggestIntent: CallbackAction(
            onInvoke: (intent) {
              if (fieldSuggestion == null) {
                return null;
              }
              _showSuggestionDialog(
                context: context,
                fieldSuggestion: fieldSuggestion!,
                controller: effectiveController,
                onChanged: onChanged,
                initialValue: effectiveController.text,
              );
              return null;
            },
          ),
        },
        child: finalWidget,
      ),
    );
  }
}

enum _FieldType {
  text,
  double,
  int,
}

Future<void> _showSuggestionDialog({
  required BuildContext context,
  required FieldSuggestion fieldSuggestion,
  required TextEditingController controller,
  required void Function(String)? onChanged,
  required String initialValue,
}) async {
  if (context.mounted) {
    await showElbDialog<void>(
      isDismissible: true,
      useRootNavigator: false,
      context: context,
      child: SuggestionIntentDialog(
        fieldSuggestion: fieldSuggestion,
        initialValue: initialValue,
        onSuggestionSelected: (suggestion) {
          controller.text = suggestion;
          onChanged?.call(suggestion);
        },
      ),
    );
  }
}
