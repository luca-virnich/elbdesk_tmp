import 'dart:async';

import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

final lightUserStreamController = StreamController<LightUserDTO>.broadcast();

class LightUserHandler {
  const LightUserHandler._();

  static Future<LightUserDTO?> fetchByUserInfoId(
    Session session, {
    required int userInfoId,
    bool includeUserInfo = false,
    Transaction? transaction,
  }) async {
    return LightUserDTO.db.findFirstRow(
      session,
      where: (t) => t.userInfoId.equals(userInfoId),
      include: includeUserInfo
          ? LightUserDTO.include(userInfo: UserInfo.include())
          : null,
      transaction: transaction,
    );
  }

  static Future<LightUserDTO?> update(
    Session session, {
    required LightUserDTO lightUser,
    required Transaction transaction,
  }) async {
    return LightUserDTO.db.updateRow(
      session,
      lightUser,
      transaction: transaction,
    );
  }

  static Future<LightUserDTO> create(
    Session session, {
    required LightUserDTO lightUser,
    required Transaction transaction,
  }) async {
    return LightUserDTO.db
        .insertRow(session, lightUser, transaction: transaction);
  }
}
