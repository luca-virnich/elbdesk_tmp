---
sidebar_position: 1
---

# Floating Entity Card

The `EntityCard<T>` is a widget that provides a standardized way to display and edit entity data in a floating window. It handles all the common functionality needed for entity management including:

- State management and data fetching
- Form handling and validation
- Navigation between different sections/views
- Save, delete and update operations
- Locking mechanism for concurrent edits
- Changelog tracking
- Customizable ribbons and navigation items

The card provides a consistent layout with:
- A title bar showing the entity name and icon
- Side navigation with grouped items
- Main content area for different views
- Footer with save/delete actions
- Optional ribbon area for additional actions

To implement a floating card for your entity, you need to:
1. Create a widget that extends `HookConsumerWidget`
2. Configure the `EntityCard<T>` with your entity type
3. Implement required callbacks like `stateRefetchWithoutLock`, `invalidateEntityState`, `onSavePressed`. Most of these callbacks can simply be implemented by using the corresponding methods from the `StateProvider`.
4. Define other values like `floatingWindowId`, `iconData`, and `formKey`.
5. Return a `FloatingCardBody` with the `formKey`, `footer`, `navigation groups` and it's `children`

Below is a complete example implementation for a Customer entity:

```dart
class CustomerCard extends HookConsumerWidget {
  const CustomerCard({
    required this.floatingWindowId,
    required this.customerId,
    super.key,
  });

  /// Passing an optional floatingWindowId, we need this when the Card is shown
  /// in a Floating Window
  final String? floatingWindowId;

  /// The entity-Id we want fetch in this Card
  final int customerId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final generalValidationGroupId = useUuid();
    final formKey = useFormKey();
    final l10n = context.l10n;

    Future<void> onSavePressed(
      int entityId,
      String sessionId,
    ) async {
      final customer = ref
          .read(customerStateProvider(entityId, sessionId))
          .requireValue;
      await ref.read(customerRepositoryProvider).update(
            entity: customer,
            release: false,
            sessionId: sessionId,
          );
    }

    /// The EntityCard<T> provides all functionality to deal with the Entity
    return EntityCard<Customer>(
      formKey: formKey,
      onSavePressed: onSavePressed,

      /// The entityId, which can be null if the Card should create the Entity
      /// itself
      entityId: customerId,
      
      /// Example with ribbons, we get back the EntityId, the SessionId and the 
      /// current navigatorKey to handle actions inside the FloatingWindow, also
      /// the showRibbonsNotifier to hide and show the Ribbon-Area. 
      /// This is only needed if the Card should have ribbons.
      ribbonsBuilder:
          (showRibbonsNotifier, entityId, sessionId, navigatorKey) =>
              ContactCardRibbons(
        showRibbonsNotifier: showRibbonsNotifier,
        contactId: entityId,
        sessionId: sessionId,
        navigatorKey: navigatorKey,
      ),

      /// Simply use the corresponding Method from the StateProvider
      stateRefetchWithoutLock: (entityId, sessionId) async {
        await ref
            .read(customerStateProvider(entityId, sessionId).notifier)
            .refetchWithoutLock();
      },

      /// Simply use the corresponding Method from the StateProvider
      stateSaveUnlockRefetch: (editSessionId, dataId, navigatorKey) async {
        await ref
            .read(customerStateProvider(dataId, editSessionId).notifier)
            .saveAndUnlockAndRefetch();
      },

      /// Simply use the corresponding Method from the StateProvider
      stateRefetchWithLock: (entityId, sessionId) => ref
          .read(customerStateProvider(entityId, sessionId).notifier)
          .refetchWithLock(),

      /// Invalidate-Method for the StateProvider
      invalidateEntityState: (entityId, sessionId) async {
        ref.invalidate(
          customerStateProvider(entityId, sessionId),
        );
      },

      /// The EntityStream/Watch
      streamDataProvider: ({
        required sessionId,
        required dataId,
      }) =>
          watchCustomerProvider(
        sessionId: sessionId,
        customerId: dataId,
      ),

      /// The Comparable-Class we defined earlier for this Entity
      toComparable: CustomerComparable.fromCustomer,

      /// The corresponding TableType for this Entity
      tableType: TableType.customer,

      /// The optional Floating Window Id  
      floatingWindowId: floatingWindowId,

      /// The State-Provider itself
      stateProvider: customerStateProvider.call,

      /// The Methdo to create an Entity, this is used when the EntityCard can
      /// be called without an ID, so the Entity will be created automatically,
      /// for example in the ContactCard
      createEntity: (sessionId) => Future.value(customerId),

      /// Could be deprecated in the future    
      baseTitle: '',

      /// The Method which is used to show/Change the Text in the FloatingWindow
      /// TitleBar
      getTitle: (entity) => entity.contact!.general.name,

      /// The Icon for the Titlebar
      iconData: TableTypeWrapper(TableType.customer).tableIcon,

      /// The childBuilder provides access to all information needed while working 
      /// with the fetched/created entity. It returns:
      /// - entityId: ID of created/fetched entity
      /// - sessionId: Current session ID
      /// - selectedNavIndexRef: Reference to selected navigation index
      /// - navigatorKey: Key for navigation within floating window
      /// - readOnly: If entity is in read-only mode
      /// - meta: Metadata about the entity
      /// - initialEntity: The initial entity state
      /// - isSaving: Whether entity is currently being saved
      /// - savedOrInitialEntity: Either saved or initial entity state
      childBuilder: (
        context,
        entityId,
        sessionId,
        selectedNavIndexRef,
        navigatorKey,
        readOnly,
        meta,
        initialEntity,
        isSaving,
        savedOrInitialEntity,
      ) {
        /// Every EntityCard in a Floating Window should return the 
        /// FloatingCardBody, where we can define different Widgets
        return FloatingCardBody(

          /// The formKey for the entire Entity Form, defined in this Widget at
          /// the beginning of the build() Method.
          formKey: formKey,
          footer: DefaultCardFooter<Customer>(
            savedOrInitialEntity: savedOrInitialEntity,
            isSaving: isSaving,
            onSavePressed: () async {
              await onSavePressed(entityId, sessionId);
            },
            readOnly: readOnly,
            /// We are passing the navigatorKey here to show Overlays inside 
            /// the Floating Window
            navigatorKey: navigatorKey,
            onDeletePressed: () async {
              Future<void> deleteOperation() async {
                await ref.read(customerRepositoryProvider).delete(
                      entityId,
                      sessionId,
                    );
              }

              final (:success, :errorMessage, :data) =
                  await AsyncHandler.handleAsyncOperation(
                context,
                deleteOperation,
                successMessage: l10n.gen_saving_success,
                successNavigatorKey: navigatorKey,
                errorNavigatorKey: navigatorKey,
              );
              if (success) {
                ref
                    .read(
                      floatingWindowDataStateProvider.notifier,
                    )
                    .removeWindow(floatingWindowId!);
              }
            },
            formKey: formKey,
            meta: meta,
            windowId: floatingWindowId,
          ),

          /// Navigation groups define the side navigation items
          /// A NavigationGroup can have multiple NavigationItems
          navigationGroups: [
            CardNavigationGroup(
              items: [
                CardNavigationItem(
                  icon: AppIcons.home,
                  label: l10n.crm_general,
                  showErrorBadge: ref.watch(
                    validationGroupProvider(generalValidationGroupId).select(
                      (value) => value.isNotEmpty,
                    ),
                  ),
                ),
              ],
            ),
            CardNavigationGroup(
              items: [
                CardNavigationItem(
                  icon: AppIcons.shipping,
                  label: l10n.crm_customer_shipping,
                ),
                CardNavigationItem(
                  icon: AppIcons.payments,
                  label: l10n.crm_customer_payments,
                ),
              ],
            ),
            // Additional navigation groups...

            /// The Changelog NavigationGroup
            /// This is only needed if the Entity has a Changelog, it should
            /// be the last NavigationGroup
            CardNavigationGroup(
              items: [
                CardNavigationItems.changelog(l10n),
              ],
            ),
          ],

          /// Children correspond to navigation items in same order
          children: [
            /// We have to pass a CardBodyItem, we can define this as keepAlive
            /// or not. That means, that the Widget/Child will be disposed if 
            /// keepAlive is false and we are navigating to a different child.
            /// The default value is true.
            CardBodyItem(
              child: CustomerGeneralView(
                validationGroupId: generalValidationGroupId,
                customerId: entityId,
                sessionId: sessionId,
                readOnly: readOnly,
              ),
            ),
            CardBodyItem(
              child: CustomerShipping(
                customerId: entityId,
                sessionId: sessionId,
                navigatorKey: navigatorKey,
              ),
            ),
            CardBodyItem(
              child: CustomerPaymentView(
                customerId: entityId,
                sessionId: sessionId,
                navigatorKey: navigatorKey,
              ),
            ),
            /// Additional children...

            /// The Changelog Child
            /// This is only needed if the Entity has a Changelog
            CardBodyItem(
              keepAlive: false,
              child: EntityLogTable(
                fieldTitle: (log) => CustomerFieldWrapper.fromFieldKey(
                  log.field,
                ).readable(l10n),
                entityId: entityId,
                tableType: TableType.customer,
                navigatorKey: navigatorKey,
              ),
            ),
          ],
        );
      },
    );
  }
}
```