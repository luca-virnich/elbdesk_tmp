import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:serverpod_auth_client/serverpod_auth_client.dart';

part 'service_user_token.freezed.dart';
part 'service_user_token.g.dart';

/// AppUser
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
class ServiceUserToken with _$ServiceUserToken, HasMetaData {
  /// ServiceUser constructor
  const factory ServiceUserToken({
    required DataMeta meta,
    required AuthKey? authKey,
    required String tokenDescription,
  }) = _ServiceUserToken;

  /// Constructor
  const ServiceUserToken._();

  factory ServiceUserToken.fromJson(Map<String, Object?> json) =>
      _$ServiceUserTokenFromJson(json);

  /// AppUser from DTO
  factory ServiceUserToken.fromDTO(ServiceUserTokenDTO dto) {
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

    final serviceUserToken = ServiceUserToken(
      authKey: dto.authKey,
      tokenDescription: dto.tokenDescription,
      meta: dataMeta,
    );

    return serviceUserToken;
  }

  /// ServiceUserToken to DTO
  ServiceUserTokenDTO toDTO() {
    return ServiceUserTokenDTO(
      authKey: authKey,
      id: meta.id,
      lastModifiedAt: meta.lastModifiedAt,
      createdAt: meta.createdAt!,
      isDraft: false,
      tokenDescription: tokenDescription,
    );
  }
}
