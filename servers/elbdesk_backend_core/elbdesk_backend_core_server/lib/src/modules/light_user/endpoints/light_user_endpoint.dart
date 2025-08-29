import 'dart:async';

import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

class LightUserEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Stream<LightUserDTO> watch(
    Session session,
  ) async* {
    yield* lightUserStreamController.stream;
  }

  /// Fetch an LightUser by its id
  Future<LightUserDTO?> fetchById(
    Session session, {
    required int id,
    bool includeUserInfo = false,
  }) async {
    return LightUserDTO.db.findById(
      session,
      id,
      include: includeUserInfo
          ? LightUserDTO.include(userInfo: UserInfo.include())
          : null,
    );
  }

  /// Fetch an LightUser by its id
  Future<LightUserDTO?> fetchByUserInfoId(
    Session session, {
    required int userInfoId,
    bool includeUserInfo = false,
  }) async {
    return LightUserDTO.db.findFirstRow(
      session,
      where: (t) => t.userInfoId.equals(userInfoId),
      include: includeUserInfo
          ? LightUserDTO.include(userInfo: UserInfo.include())
          : null,
    );
  }

  /// Fetch all LightUsers
  Future<List<LightUserDTO>> fetchAll(
    Session session, {
    bool includeUserInfo = false,
    bool showInactive = false,
  }) async {
    return LightUserDTO.db.find(
      session,
      where: (t) => t.isActive.equals(showInactive),
      include: includeUserInfo
          ? LightUserDTO.include(userInfo: UserInfo.include())
          : null,
    );
  }
}
