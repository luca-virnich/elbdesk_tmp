---
sidebar_position: 2
---

# EntityCard Children

A EntityCard can have multiple children which are controlled via the Side-Navigation.

In a FloatingCardBody, they are Wrapped by a `CardBodyItem`

We have two top-level Widgets for this case:

- `ScrollableCardItem`
- `SelfScrollableCardItem`

A `ScrollableCardItem` should be used when we want to add a View which has no own Scrolling-Behaviour, like a Column of many Widgets.

The `ScrollableCardItem.constrained` is wrapped in a `LayoutBuilder` and gives us access to the constraints. 

We should use the `CardSectionTitle` Widget as a Title for a Section inside the CardItem, it has an optional `trailingActions` parameter where you can pass a Button or an information.


### Example: CustomerShipping

```dart
class CustomerShipping extends ConsumerWidget {
  const CustomerShipping({
    required this.customerId,
    required this.sessionId,
    required this.navigatorKey,
    super.key,
  });

  final int customerId;

  final String sessionId;
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    /// We are using a ScrollableCardItem.unconstrained because we don't need
    /// any information regarding the constraints in this widget.
    return ScrollableCardItem.unconstrained(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          /// We are adding a CardSectionTitle...  
          CardSectionTitle(
            title: l10n.crm_customer_shipping_addresses,
            trailingActions: [
            /// ... with a TrailingAction
              AppButton.secondary(
                iconData: AppIcons.add,
                label: l10n.crm_customer_shipping_address,
                onPressed: () async {
                  final contact = await pushFadeInPage<Contact?>(
                    context: context,
                    page: _SelectContactFromTable(
                      customerId: customerId,
                      sessionId: sessionId,
                      navigatorKey: navigatorKey,
                    ),
                  );
                  if (contact != null) {
                    unawaited(
                      ref.read(customerRepositoryProvider).addShippingAddress(
                            customerId,
                            contact.meta.id!,
                          ),
                    );
                  }
                },
              ),
            ],
          ),
          const SizedBox(height: UiConstants.defaultPadding),
          _CustomerDeliveryAddresses(
            customerId: customerId,
            navigatorKey: navigatorKey,
          ),
        ],
      ),
    );
  }
}
```



