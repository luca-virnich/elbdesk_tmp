import 'dart:async';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:project_core/project_core.dart';
import 'package:project_core/src/app_user/models/app_scope_permission.dart';
import 'package:project_core/src/app_user/models/app_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_user_state.g.dart';

/// AppUser State
///
/// This state is used to manage and update the appUser details
@riverpod
class AppUserState extends _$AppUserState implements EntityState<AppUser> {
  AppUserState() {
    _initializeStateManager();
  }
  late final EntityStateManager<AppUser> _stateManager;

  void _initializeStateManager() {
    _stateManager = EntityStateManager<AppUser>(
      setLoadingState: () => state = const AsyncLoading(),
      setDataState: (AppUser appUser) => state = AsyncData(appUser),
      setErrorState: (Object error, StackTrace stackTrace) =>
          state = AsyncError(error, stackTrace),
      fetchAndLockFn: () =>
          ref.read(appUserRepositoryProvider).fetchAndLock(entityId, sessionId),
      releaseFn: () =>
          ref.read(appUserRepositoryProvider).release(entityId, sessionId),
      fetchByIdFn: () =>
          ref.read(fetchAppUserProvider(entityId, sessionId).future),
      updateWithReleaseFn: () => ref.read(appUserRepositoryProvider).update(
            entity: state.requireValue,
            sessionId: sessionId,
            release: true,
          ),
    );
  }

  @override
  Future<AppUser> build(int entityId, String sessionId) async {
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

  void updateUser(AppUser user) {
    state = AsyncData(user);
  }

  // *
  // * AppUserInfo
  // *

  /// Update full name
  void updateFullName(String fullName) {
    state = AsyncData(
      state.requireValue.copyWith(
        userInfo: state.requireValue.userInfo.copyWith(fullName: fullName),
      ),
    );
  }

  /// Update appUser name
  void updateAppUserName(String appUserName) {
    state = AsyncData(
      state.requireValue.copyWith(
        userInfo: state.requireValue.userInfo.copyWith(userName: appUserName),
      ),
    );
  }

  /// Update email
  void updateEmail(String email) {
    state = AsyncData(
      state.requireValue.copyWith(
        userInfo: state.requireValue.userInfo.copyWith(email: email.trim()),
      ),
    );
  }

  /// Update birth date
  void updateBirthDate(DateTime? birthDate) {
    state =
        AsyncData(state.requireValue.copyWith.general(birthDate: birthDate));
  }

  /// Update the first name of the contact
  void updateFirstName(String firstName) {
    state = AsyncData(
      state.requireValue.copyWith.general(firstName: firstName),
    );
  }

  /// Update the last name of the contact
  void updateSurname(String surname) {
    state = AsyncData(
      state.requireValue.copyWith.general(
        lastName: surname,
      ),
    );
  }

  /// Updates the name of the contact when its linkeed

  // *
  // * Communication
  // *

  // * Address

  /// Updates the address of the contact
  void updateAddress1(String address1) {
    state = AsyncData(
      state.requireValue.copyWith.address(
        address: address1,
      ),
    );
  }

  /// Updates the address of the contact
  void updateAddress2(String address2) {
    state = AsyncData(
      state.requireValue.copyWith.address(
        address2: address2,
      ),
    );
  }

  /// Updates the address of the contact

  /// Updates the city of the contact
  void updateCity(String city) {
    state = AsyncData(
      state.requireValue.copyWith.address(
        city: city,
      ),
    );
  }

  /// Updates the state of the contact
  void updateState(String newState) {
    state = AsyncData(
      state.requireValue.copyWith.address(
        state: newState,
      ),
    );
  }

  /// Updates the post code of the contact
  void updatePostCode(String postCode) {
    state = AsyncData(
      state.requireValue.copyWith.address(
        postCode: postCode,
      ),
    );
  }

  /// Updates the country of the contact
  void updateCountry(CountryCode countryCode) {
    state = AsyncData(
      state.requireValue.copyWith.address(
        countryCode: countryCode,
      ),
    );
  }

  void updateInitials(String initials) {
    state = AsyncData(
      state.requireValue.copyWith.general(initials: initials),
    );
  }

  // * Contact
  /// Updates the phone number of the contact
  void updatePhone(String phone) {
    state = AsyncData(
      state.requireValue.copyWith.communication(
        phone: phone,
      ),
    );
  }

  /// Updates the mobile number of the contact
  void updateMobile(String mobile) {
    state = AsyncData(
      state.requireValue.copyWith.communication(
        mobile: mobile,
      ),
    );
  }

  /// Updates the private email of the contact
  void updatePrivateEmail(String privateEmail) {
    state = AsyncData(
      state.requireValue.copyWith.communication(privateEmail: privateEmail),
    );
  }

  void updateScopePermissions({
    required AppScope scope,
    required AppScopePermission scopePermission,
  }) {
    final scopePermissions = scopePermission.scopePermissions(scope);

    // Remove scopePermissions for the given scope from the state
    final cleanScopePermissions = state.requireValue.userInfo.scopeNames
        .where((value) => value.split('.').first != scope.name)
        .toList();

    // Add the new scopePermissions to the state
    final updatedScopePermissions = [
      ...cleanScopePermissions,
      ...scopePermissions,
    ];
    state = AsyncData(
      state.requireValue.copyWith(
        userInfo: state.requireValue.userInfo
            .copyWith(scopeNames: updatedScopePermissions),
      ),
    );
  }

  /// Update Scopes
  void updateScopes(List<String> scopeNames) {
    state = AsyncData(
      state.requireValue.copyWith(
        userInfo: state.requireValue.userInfo.copyWith(scopeNames: scopeNames),
      ),
    );
  }

  /// Update blocked
  void updateBlocked({bool blocked = false}) {
    state = AsyncData(
      state.requireValue.copyWith(
        userInfo: state.requireValue.userInfo.copyWith(blocked: blocked),
      ),
    );
  }

  /// Update Employee Number
  void updateEmployeeNumber(String employeeNumber) {
    state = AsyncData(
      state.requireValue.copyWith(
        employee: state.requireValue.employee
            .copyWith(employeeNumber: employeeNumber),
      ),
    );
  }

  /// Update Entry Date
  void updateEntryDate(DateTime? entryDate) {
    state = AsyncData(
      state.requireValue.copyWith(
        employee: state.requireValue.employee.copyWith(entryDate: entryDate),
      ),
    );
  }

  /// Update Termination Date
  void updateTerminationDate(DateTime? terminationDate) {
    state = AsyncData(
      state.requireValue.copyWith(
        employee: state.requireValue.employee
            .copyWith(terminationDate: terminationDate),
      ),
    );
  }

  /// Update Department
  void updateDepartment(DepartmentCode? department) {
    state = AsyncData(
      state.requireValue.copyWith(
        employee: state.requireValue.employee.copyWith(department: department),
      ),
    );
  }

  /// Update Position
  void updatePosition(String position) {
    state = AsyncData(
      state.requireValue.copyWith(
        employee: state.requireValue.employee.copyWith(position: position),
      ),
    );
  }

  /// Update Cost Center
  void updateCostCenter(String costCenter) {
    state = AsyncData(
      state.requireValue.copyWith(
        employee: state.requireValue.employee.copyWith(costCenter: costCenter),
      ),
    );
  }

  /// Update Is Active
  void updateIsActive(bool isActive) {
    state = AsyncData(
      state.requireValue.copyWith(
        employee: state.requireValue.employee.copyWith(isActive: isActive),
      ),
    );
  }
}

@riverpod
Stream<AppUser> watchAppUser(
  Ref ref, {
  required String sessionId,
  required int appUserId,
}) async* {
  final streamHelper = ServerpodStreamManager<AppUser, AppUserDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () => serverpodClient.appUser.watch(
      sessionId: sessionId,
      entityId: appUserId,
    ),
    convertDtoToModel: AppUser.fromDTO,
    onError: (error) {
      dlog('Error occurred in streamAppUser: $error');
    },
  );
}
