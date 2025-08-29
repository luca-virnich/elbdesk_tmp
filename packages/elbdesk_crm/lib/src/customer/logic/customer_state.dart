import 'dart:async';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/elbdesk_crm.dart';
import 'package:elbdesk_crm/src/app_client/models/app_client.dart';
import 'package:elbdesk_crm/src/payment_code/models/payment_code.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_core/project_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'customer_state.g.dart';

/// Customer State
///
/// Used to manage and update the state of a customer
@riverpod
class CustomerState extends _$CustomerState implements EntityState<Customer> {
  /// @nodoc
  CustomerState() {
    _initializeStateManager();
  }
  late final EntityStateManager<Customer> _stateManager;

  @override
  Future<Customer> build(int entityId, String sessionId) async {
    return _stateManager.build(
      id: entityId,
      sessionId: sessionId,
      ref: ref,
    );
  }

  void _initializeStateManager() {
    _stateManager = EntityStateManager<Customer>(
      setLoadingState: () => state = const AsyncLoading(),
      setErrorState: (Object error, StackTrace stackTrace) =>
          state = AsyncError(error, stackTrace),
      setDataState: (Customer customer) => state = AsyncData(customer),
      fetchAndLockFn: () => ref
          .read(customerRepositoryProvider)
          .fetchAndLock(entityId, sessionId),
      releaseFn: () =>
          ref.read(customerRepositoryProvider).release(entityId, sessionId),
      fetchByIdFn: () =>
          ref.read(customerRepositoryProvider).fetchById(entityId),
      updateWithReleaseFn: () => ref.read(customerRepositoryProvider).update(
            entity: state.requireValue,
            release: true,
            sessionId: sessionId,
          ),
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

  /// Sets the customer lastLocalModifiedAt to the current time

  /// Update id
  void updateId(int id) {
    state = AsyncData(state.requireValue.copyWith.meta(id: id));
  }

  void updateVatId(String vatId) {
    state = AsyncData(
      state.requireValue.copyWith(
        vatId: vatId,
      ),
    );
  }

  void updateAssignedUser(LightUser? assignedUser) {
    state = AsyncData(
      state.requireValue.copyWith(
        assignedUser: assignedUser,
      ),
    );
  }

  void updateContractSovereignty(AppClient? contractSovereignty) {
    state = AsyncData(
      state.requireValue.copyWith(
        contractSovereignty: contractSovereignty,
      ),
    );
  }

  void updateInvoiceEmail(String invoiceEmail) {
    state = AsyncData(
      state.requireValue.copyWith(
        invoiceEmail: invoiceEmail,
      ),
    );
  }

  void updatePaymentCode(PaymentCode? paymentCode) {
    state = AsyncData(
      state.requireValue.copyWith(
        paymentCode: paymentCode,
      ),
    );
  }

  void updateInvoiceDeliveryMethod(
    InvoiceDeliveryMethod? invoiceDeliveryMethod,
  ) {
    state = AsyncData(
      state.requireValue.copyWith(
        invoiceDeliveryMethod: invoiceDeliveryMethod,
      ),
    );
  }

  void updateShippingMethod(ShippingMethod? shippingMethod) {
    state = AsyncData(
      state.requireValue.copyWith(
        shippingMethod: shippingMethod,
      ),
    );
  }

  void updateSalesOrderHintKeywords(String keywords) {
    state = AsyncData(
      state.requireValue.copyWith(
        salesOrderHints: state.requireValue.salesOrderHints.copyWith(
          keywords: keywords,
        ),
      ),
    );
  }

  void updateSalesOrderHintFirstReference(String firstReference) {
    state = AsyncData(
      state.requireValue.copyWith(
        salesOrderHints: state.requireValue.salesOrderHints.copyWith(
          firstReference: firstReference,
        ),
      ),
    );
  }

  void updateSalesOrderHintSecondReference(String secondReference) {
    state = AsyncData(
      state.requireValue.copyWith(
        salesOrderHints: state.requireValue.salesOrderHints.copyWith(
          secondReference: secondReference,
        ),
      ),
    );
  }

  void updateSalesOrderHintOrderNumber(String orderNumber) {
    state = AsyncData(
      state.requireValue.copyWith(
        salesOrderHints: state.requireValue.salesOrderHints.copyWith(
          orderNumber: orderNumber,
        ),
      ),
    );
  }

  void updateSalesOrderHints(CustomerSalesOrderHints hints) {
    state = AsyncData(
      state.requireValue.copyWith(
        salesOrderHints: hints,
      ),
    );
  }
}

@riverpod
Stream<Customer> watchCustomer(
  Ref ref, {
  required String sessionId,
  required int customerId,
}) async* {
  final streamHelper = ServerpodStreamManager<Customer, CustomerDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () => serverpodClient.customer.watch(
      sessionId: sessionId,
      entityId: customerId,
    ),
    convertDtoToModel: Customer.fromDTO,
    onError: (error) {
      dlog('Error occurred in streamCustomer: $error');
    },
  );
}
