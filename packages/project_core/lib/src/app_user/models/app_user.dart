import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/elbdesk_crm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_core/src/app_user/models/user_info_extension.dart';
import 'package:serverpod_auth_client/serverpod_auth_client.dart';

part 'app_user.freezed.dart';
part 'app_user.g.dart';

/// AppUser
///
/// The AppUser model is our client model for the AppUserDTO
///
/// The AppUser contains user information that cant be stored in the server side
/// UserInfo table which is provided by serverpod_auth.
///
/// New AppUsers can be created by an admin. Admins can also update and delete
/// AppUsers. To provide a UserTable which is similar to all other tables, the
/// AppUser also holds metaData like editingBy and lastModifiedAt.
@freezed
class AppUser with _$AppUser, HasMetaData {
  /// AppUser constructor
  const factory AppUser({
    required DataMeta meta,
    required UserInfo userInfo,
    required AppUserGeneral general,
    required AppUserCommunication communication,
    required AppUserAddress address,
    required AppUserEmployee employee,
  }) = _AppUser;

  /// Constructor
  const AppUser._();

  factory AppUser.fromJson(Map<String, Object?> json) =>
      _$AppUserFromJson(json);

  /// Initial AppUser
  factory AppUser.initial(
    String sessionId,
  ) {
    final created = DateTime.now();
    final dataMeta = DataMeta(
      id: 999999999999,
      isDraft: true,
      lastModifiedAt: null,
      lastModifiedById: null,
      createdAt: created,
      createdById: null,
      editingSessionId: sessionId,
      editingById: null,
      editingSince: null,
      deletedById: null,
      deletedAt: null,
    );

    final userInfo = UserInfo(
      userIdentifier: '',
      email: '',
      created: created,
      scopeNames: [],
      blocked: false,
    );
    return AppUser(
      meta: dataMeta,
      userInfo: userInfo,
      general: const AppUserGeneral(
        firstName: '',
        lastName: '',
        initials: '',
      ),
      communication: const AppUserCommunication(
        phone: '',
        mobile: '',
        privateEmail: '',
      ),
      address: const AppUserAddress(
        address: '',
        address2: '',
        postCode: '',
        city: '',
        state: '',
        countryCode: null,
      ),
      employee: const AppUserEmployee(
        employeeNumber: '',
        entryDate: null,
        terminationDate: null,
        department: null,
        position: '',
        costCenter: '',
        isActive: true,
      ),
    );
  }

  /// AppUser from DTO
  factory AppUser.fromDTO(AppUserDTO dto) {
    final dataMeta = DataMeta(
      isDraft: dto.isDraft,
      lastModifiedAt: dto.lastModifiedAt?.toLocal(),
      id: dto.id,
      createdById: dto.createdById,
      createdAt: dto.createdAt.toLocal(),
      lastModifiedById: dto.lastModifiedById,
      editingSessionId: dto.editingSession,
      editingById: dto.editingById,
      editingSince: dto.editingSince?.toLocal(),
      deletedById: dto.deletedById,
      deletedAt: dto.deletedAt?.toLocal(),

      // lastLocalModifiedAt: null,
    );

    final general = AppUserGeneral(
      firstName: dto.firstName ?? '',
      lastName: dto.lastName ?? '',
      initials: dto.initials ?? '',
    );

    final communication = AppUserCommunication(
      phone: dto.phone,
      mobile: dto.mobile,
      privateEmail: dto.privateEmail,
    );

    final address = AppUserAddress(
      address: dto.address,
      address2: dto.address2,
      postCode: dto.postCode,
      city: dto.city,
      state: dto.state,
      countryCode: dto.countryCode != null
          ? CountryCode.fromDTO(dto.countryCode!)
          : null,
    );

    final employee = AppUserEmployee(
      employeeNumber: dto.employeeNumber,
      entryDate: dto.entryDate,
      terminationDate: dto.terminationDate,
      department: dto.department != null
          ? DepartmentCode.fromDTO(dto.department!)
          : null,
      position: dto.position,
      costCenter: dto.costCenter,
      isActive: dto.isActive,
    );

    final appUser = AppUser(
      userInfo: dto.userInfo ??
          UserInfo(
            userIdentifier: '',
            email: '',
            created: DateTime.now(),
            scopeNames: [],
            blocked: false,
            fullName: general.fullName,
          ),
      meta: dataMeta,
      general: general,
      communication: communication,
      address: address,
      employee: employee,
    );

    return appUser;
  }

  /// AppUser to DTO
  AppUserDTO toDTO() {
    return AppUserDTO(
      privateEmail: communication.privateEmail,
      id: meta.id,
      lastModifiedAt: meta.lastModifiedAt,
      createdAt: meta.createdAt!,
      isDraft: false,
      userInfoId: userInfo.id,
      userInfo: userInfo.copyWith(
        fullName: general.fullName,
        scopeNames: userInfo.scopeNames,
      ),
      firstName: general.firstName,
      lastName: general.lastName,
      initials: general.initials,
      address: address.address,
      address2: address.address2,
      postCode: address.postCode,
      city: address.city,
      state: address.state,
      countryCode: address.countryCode?.toDTO(),
      countryCodeId: address.countryCode?.id,
      phone: communication.phone,
      mobile: communication.mobile,
      employeeNumber: employee.employeeNumber,
      entryDate: employee.entryDate,
      terminationDate: employee.terminationDate,
      department: employee.department?.toDTO(),
      departmentId: employee.department?.id,
      position: employee.position,
      costCenter: employee.costCenter,
      isActive: employee.isActive,
    );
  }

  void requirePermissions(Set<String> permissions) {
    userInfo.requirePermissions(permissions);
  }

  bool hasPermissions(Set<String> permissions) {
    return userInfo.hasPermissions(permissions);
  }
}

@freezed
class AppUserGeneral with _$AppUserGeneral {
  /// AppUserGeneral constructor
  const factory AppUserGeneral({
    required String firstName,
    required String lastName,
    required String initials,
    DateTime? birthDate,
  }) = _AppUserGeneral;

  const AppUserGeneral._();

  factory AppUserGeneral.fromJson(Map<String, Object?> json) =>
      _$AppUserGeneralFromJson(json);

  /// Full name
  String get fullName => '$firstName $lastName';
}

@freezed
class AppUserCommunication with _$AppUserCommunication {
  /// Communication constructor
  const factory AppUserCommunication({
    required String phone,
    required String mobile,
    required String privateEmail,
  }) = _AppUserCommunication;

  const AppUserCommunication._();

  factory AppUserCommunication.fromJson(Map<String, Object?> json) =>
      _$AppUserCommunicationFromJson(json);
}

@freezed
class AppUserAddress with _$AppUserAddress {
  /// Address constructor
  const factory AppUserAddress({
    required String address,
    required String address2,
    required String postCode,
    required String city,
    required String state,
    required CountryCode? countryCode,
  }) = _AppUserAddress;

  const AppUserAddress._();

  factory AppUserAddress.fromJson(Map<String, Object?> json) =>
      _$AppUserAddressFromJson(json);
}

@freezed
class AppUserEmployee with _$AppUserEmployee {
  /// Employee constructor
  const factory AppUserEmployee({
    required String employeeNumber,
    required DateTime? entryDate,
    required DateTime? terminationDate,
    required DepartmentCode? department,
    required String position,
    required String costCenter,
    required bool isActive,
  }) = _AppUserEmployee;

  const AppUserEmployee._();

  factory AppUserEmployee.fromJson(Map<String, Object?> json) =>
      _$AppUserEmployeeFromJson(json);
}
