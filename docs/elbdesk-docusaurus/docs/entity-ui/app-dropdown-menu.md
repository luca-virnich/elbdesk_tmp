---
sidebar_position: 4
---

# AppDropdownMenu

This is the Widget to use when to work with a Dropdown Selection.

```dart
AppDropdownMenu<T>(

    /// indicates if the User must select a value
    isMandatory: true,

    /// The focusOrder like in the [NextCardFormField]
    focusOrderId: 13.5,

    /// Enables the Filter, this means, that the User only see the Values which
    /// are matching the input
    enableFilter: true,

    /// The labelPosition, see [NextCardFormField]
    labelPosition: labelPosition,

    /// We need the previous FocusNode to be able to have a smooth keyboard
    /// Navigation, this means, when there is a TextField before this Widget for
    /// example, you have to define the FocusNode for the TextField by your own
    previousFocusNode: previousFocusNode,

    /// indicates if the user can change the value
    readOnly: readOnly,

    /// The initial selected value
    initialSelection: ref
        .read(contactStateProvider(contactId, sessionId))
        .requireValue
        .general
        .salutationCode,

    /// We need to pass the width for the Dropdown, when the widget is wrapped
    /// inside a [TwoColumnWrap] you should use the provided childWidth, 
    /// otherwise you have to wrap the widget with a LayouBuilder
    width: width,

    /// The Label
    labelText: l10n.crm_salutation_code_singular,

    /// The heigh of the Menu which is shown with the possible entries. In many
    /// cases we want to limit this.
    menuHeight: 200,

    /// The focusNode 
    focusNode: focusNode,

    /// The onSelect Method
    onSelected: (value) {
        if (value != null) {
        ref
            .read(
                contactStateProvider(contactId, sessionId).notifier,
            )
            .updateSalutationCode(value);
        }
    },

    /// The Values
    dropdownMenuEntries: salutations
        .map(
            (e) => AppDropdownMenuEntry<SalutationCode>(
            value: e,
            label: e.description,
            ),
        )
        .toList(),
    ),  
```
