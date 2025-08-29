---
sidebar_position: 2.7
---

# TwoColumnWrap

One of our Main-Widgets for an EntityCard is the `TwoColumnWrap`.
We are using this to have a block of two columns next to each other on a slightly
wider view, and on a small viewport the two column will be among themselves.

#### Example: ContactCommunication

```dart
 TwoColumnWrap(
    width: width,
    builder: (labelPosition, childWidth) {
    return [
        Column(
        children: [
            NextCardFormField.phone(
            labelPosition: labelPosition,
            focusOrder: 30,           
            label: l10n.crm_contact_phone,
            ),
            NextCardFormField.phone(
            labelPosition: labelPosition,
            focusOrder: 31,
            label: l10n.crm_contact_mobile,
            ),
        ],
        ),
        Column(
        children: [
            NextCardFormField.website(
            labelPosition: labelPosition,
            focusOrder: 32,
            label: l10n.crm_contact_website,
            ),
            NextCardFormField.email(
            labelPosition: labelPosition,
            focusOrder: 33,      
            label: l10n.crm_contact_email,
    
            ),
        ],
        ),
    ];
    },
),
```

As shown, we are passing two Column to the returned Array, the Widget needs the available width, (`ScrollableCardItem.constrained` or `LayouBuilder`).

We have then access to the labelPosition for `NextCardFormField`s and the width for the Colum (`childWidth`).
