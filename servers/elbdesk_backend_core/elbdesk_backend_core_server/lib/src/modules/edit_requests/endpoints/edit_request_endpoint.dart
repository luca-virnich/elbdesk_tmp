import 'dart:async';

import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_backend_core_server/src/utils/core_utils.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

/// Edit Request Endpoint
///
/// Used to send edit requests to the client.
///
class EditRequestEndoint extends Endpoint {
  @override
  bool get requireLogin => true;

  final editRequestStreamController =
      StreamController<EditRequestDTO>.broadcast();

  final editRequestCanceldStreamController =
      StreamController<RejectEditRequestDTO>.broadcast();

  /// Stream edit requests
  Stream<EditRequestDTO> streamEditRequests(
    Session session, {
    required int primaryKey,
    required String tableType,
  }) async* {
    yield* editRequestStreamController.stream.where(
      (event) =>
          event.tablePrimaryKey == primaryKey && event.tableType == tableType,
    );
  }

  Stream<RejectEditRequestDTO> watchRejectEditRequests(
    Session session, {
    required int primaryKey,
    required String tableType,
  }) async* {
    yield* editRequestCanceldStreamController.stream.where(
      (event) =>
          event.tablePrimaryKey == primaryKey && event.tableType == tableType,
    );
  }

  /// Send edit request
  ///
  /// The edit request will be displayed for the user that is currently
  /// blocking the entity. It will display the name of the sender and the
  /// request message.
  ///
  /// The user can then either approve or reject the request.
  Future<void> sendRequest(
    Session session,
    EditRequestDTO request,
  ) async {
    final (:now, :userId) = await CoreUtils.getCurrentTimeAndUser(session);

    // Fetch the user's full name from the serverpod user table

    final user = await UserInfo.db.findById(session, userId);

    final createdByName = user?.fullName ?? '';

    // query user for permissions
    final r = request.copyWith(
      createdAt: now,
      createdByName: createdByName,
    );
    editRequestStreamController.add(r);

    return;
  }

  Future<void> rejectRequest(
    Session session,
    RejectEditRequestDTO request,
  ) async {
    final (:now, :userId) = await CoreUtils.getCurrentTimeAndUser(session);

    // Fetch the user's full name from the serverpod user table

    final user = await UserInfo.db.findById(session, userId);

    final createdByName = user?.fullName ?? '';
    final r = request.copyWith(
      createdAt: now,
      createdByName: createdByName,
    );
    editRequestCanceldStreamController.add(r);
  }
}
