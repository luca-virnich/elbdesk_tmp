import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/elbdesk_crm.dart';
import 'package:elbdesk_sales/elbdesk_sales.dart';
import 'package:project_core/project_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sales_order_state.g.dart';

/// Sales Order State
///
/// This state is used to manage and update the sales order details
@riverpod
class SalesOrderState extends _$SalesOrderState
    implements EntityState<SalesOrder> {
  ///@nodoc
  SalesOrderState() {
    _initializeStateManager();
  }
  late final EntityStateManager<SalesOrder> _stateManager;

  void _initializeStateManager() {
    _stateManager = EntityStateManager<SalesOrder>(
      setLoadingState: () => state = const AsyncLoading(),
      setDataState: (SalesOrder salesOrder) => state = AsyncData(salesOrder),
      setErrorState: (Object error, StackTrace stackTrace) =>
          state = AsyncError(error, stackTrace),
      fetchAndLockFn: () => ref
          .read(salesOrderRepositoryProvider)
          .fetchAndLock(entityId, sessionId),
      releaseFn: () =>
          ref.read(salesOrderRepositoryProvider).release(entityId, sessionId),
      fetchByIdFn: () =>
          ref.read(salesOrderRepositoryProvider).fetchById(entityId),
      updateWithReleaseFn: () => ref.read(salesOrderRepositoryProvider).update(
            entity: state.requireValue,
            release: true,
            sessionId: sessionId,
          ),
    );
  }

  @override
  Future<SalesOrder> build(int entityId, String sessionId) async {
    return _stateManager.build(
      id: entityId,
      sessionId: sessionId,
      ref: ref,
    );
  }

  @override
  Future<void> refetchWithLock() {
    return _stateManager.refetchWithLock();
  }

  @override
  Future<void> refetchWithoutLock() {
    return _stateManager.refetchWithoutLock();
  }

  @override
  Future<void> saveAndUnlockAndRefetch() async {
    return _stateManager.saveAndUnlockAndRefetch();
  }

  @override
  void updateMetaAfterSave() {
    final userId = ref.read(authUserStateProvider)!.id!;

    state = AsyncData(
      state.requireValue.copyWith.meta(
        lastModifiedAt: DateTime.now(),
        lastModifiedById: userId,
        isDraft: false,
      ),
    );
  }

  // *
  // * General
  // *

  /// Update the order name

  /// Update the description
  void updateDescription(String description) {
    state = AsyncData(
      state.requireValue.copyWith(description: description),
    );
  }

  /// Update the status
  void updateStatus(SalesOrderStatus status) {
    state = AsyncData(state.requireValue.copyWith(status: status));
  }

  /// Update the order date
  void updateOrderDate(DateTime? orderDate) {
    state = AsyncData(
      state.requireValue.copyWith(orderDate: orderDate),
    );
  }

  /// Update the order number coe
  void updateOrderNumber(String orderNumber) {
    state = AsyncData(
      state.requireValue.copyWith(orderNumber: orderNumber),
    );
  }

  /// Update the billing address
  void updateBillingAddress(Customer? billingAddress) {
    state = AsyncData(
      state.requireValue.copyWith(billingAddress: billingAddress),
    );
  }

  /// Update the shipping address
  void updateShippingAddress(Contact? shippingAddress) {
    state = AsyncData(
      state.requireValue.copyWith(shippingAddress: shippingAddress),
    );
  }

  void updateAssignedUser(LightUser? lightUser) {
    state = AsyncData(state.requireValue.copyWith(assignedUser: lightUser));
  }

  /// remove assigned App User
  void removeAssignedAppUser() {
    state = AsyncData(
      state.requireValue.copyWith(
        assignedUser: null,
      ),
    );
  }

  /// Update the keywords
  void updateKeywords(String keywords) {
    state = AsyncData(
      state.requireValue.copyWith(keywords: keywords),
    );
  }

  // *
  // * Customer
  // *

  /// Update the customer
  void updateCustomer(Customer? customer) {
    state = AsyncData(
      state.requireValue.copyWith(
        customer: customer,
      ),
    );
  }

  void updateCustomerCustomer(CustomerCustomer? customerCustomer) {
    state = AsyncData(
      state.requireValue.copyWith(
        customerCustomer: customerCustomer,
      ),
    );
  }

  void updateCustomerContactPerson(Contact? customerContactPerson) {
    state = AsyncData(
      state.requireValue.copyWith(
        customerContactPerson: customerContactPerson,
      ),
    );
  }

  void updateCustomerCustomerContactPerson(
    Contact? customerCustomerContactPerson,
  ) {
    state = AsyncData(
      state.requireValue.copyWith(
        customerCustomerContactPerson: customerCustomerContactPerson,
      ),
    );
  }

  void updateCustomerCustomerReference(String customerCustomerReference) {
    state = AsyncData(
      state.requireValue.copyWith(
        customerCustomerReference: customerCustomerReference,
      ),
    );
  }

  void updateCustomerFirstReference(String customerFirstReference) {
    state = AsyncData(
      state.requireValue.copyWith(
        customerFirstReference: customerFirstReference,
      ),
    );
  }

  void updateCustomerSecondReference(String customerSecondReference) {
    state = AsyncData(
      state.requireValue.copyWith(
        customerSecondReference: customerSecondReference,
      ),
    );
  }
}
