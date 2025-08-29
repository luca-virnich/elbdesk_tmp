---
sidebar_position: 3
---


# NextCardFormField

When working with TextFields in a Card, we should use the NextCardFormField, it has different pre-defined constructors:

- double
- email
- int
- phone
- text
- website

Example for text:

```dart
NextCardFormField.text(
    /// The labelPosition, this can be on the left side in front of the 
    /// TextField or above, the Value should be provided mostly by a 
    /// [TwoColumnWrap] parent
    labelPosition: labelPosition,

    /// You can pass a focusNode, but you don't need to. If you have to define
    /// a focusNode outside the Widget, pass it here.
    focusNode: focusNode,
    
    /// Indicates if the Field is editable.
    readOnly: readOnly,

    /// The Validator for the Field
    validator: (value) => ContactFieldWrapper(ContactField.firstName)
        .validator(l10n)
        ?.call(value),

    /// The focusOrder when working e.g. with TAB. By design we want to navigate
    /// vertical instead of horizontal, block by block
    focusOrder: 12,

    /// A validation Group Id
    validationGroupId: validationGroupId,

    /// The Label 
    label: l10n.crm_first_name,

    /// If we are not using a self defined controller (you can also define your 
    /// own and pass it) we should pass the initialValue here.
    initialText: ref
        .read(contactStateProvider(contactId, sessionId))
        .requireValue
        .general
        .firstName,

    /// The onChange Method     
    onChanged: (v) {
    ref
        .read(contactStateProvider(contactId, sessionId).notifier)
        .updateFirstName(v);
    },
    /// If onClear is defined, the TextField has a ClearButton and this function
    /// will be executed
    onClear: (v) {
    ref
        .read(contactStateProvider(contactId, sessionId).notifier)
        .updateFirstName('');
    },
);
```
