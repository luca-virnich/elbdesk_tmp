import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_core/src/app_user/models/user_info_extension.dart';
import 'package:project_core/src/service_user/models/service_user_token.dart';
import 'package:serverpod_auth_client/serverpod_auth_client.dart';

part 'service_user.freezed.dart';
part 'service_user.g.dart';

/// ServiceUser
///
/// The ServiceUser model is our client model for the ServiceUserDTO
///
/// The ServiceUser contains user information that cant be stored in the server side
/// UserInfo table which is provided by serverpod_auth.
///
/// New ServiceUsers can be created by an admin. Admins can also update and delete
/// ServiceUsers. To provide a UserTable which is similar to all other tables, the
/// ServiceUser also holds metaData like editingBy and lastModifiedAt.
@freezed
class ServiceUser with _$ServiceUser, HasMetaData {
  /// ServiceUser constructor
  const factory ServiceUser({
    required DataMeta meta,
    required UserInfo userInfo,
    required String serviceName,
    required String serviceDescription,
    required bool isActive,
    required List<ServiceUserToken> tokens,
  }) = _ServiceUser;

  /// Constructor
  const ServiceUser._();

  factory ServiceUser.fromJson(Map<String, Object?> json) =>
      _$ServiceUserFromJson(json);

  /// ServiceUser from DTO
  factory ServiceUser.fromDTO(ServiceUserDTO dto) {
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
    );

    final serviceUser = ServiceUser(
      userInfo: dto.userInfo ??
          UserInfo(
            userIdentifier: '',
            email: '',
            created: DateTime.now(),
            scopeNames: [],
            blocked: false,
            fullName: '',
          ),
      serviceName: dto.serviceName,
      serviceDescription: dto.serviceDescription,
      isActive: dto.isActive,
      tokens: dto.tokens?.map(ServiceUserToken.fromDTO).toList() ?? [],
      meta: dataMeta,
    );

    return serviceUser;
  }

  /// ServiceUser to DTO
  ServiceUserDTO toDTO() {
    return ServiceUserDTO(
      serviceName: serviceName,
      serviceDescription: serviceDescription,
      id: meta.id,
      lastModifiedAt: meta.lastModifiedAt,
      createdAt: meta.createdAt!,
      isDraft: false,
      userInfoId: userInfo.id,
      userInfo: userInfo.copyWith(
        scopeNames: userInfo.scopeNames,
      ),
      tokens: tokens.map((e) => e.toDTO()).toList(),
      isActive: isActive,
    );
  }

  void requirePermissions(Set<String> permissions) {
    userInfo.requirePermissions(permissions);
  }

  bool hasPermissions(Set<String> permissions) {
    return userInfo.hasPermissions(permissions);
  }
}
