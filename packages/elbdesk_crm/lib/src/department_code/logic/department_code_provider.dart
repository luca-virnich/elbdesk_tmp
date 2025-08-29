import 'dart:async';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/src/department_code/repositories/department_code_repository.dart';
import 'package:project_core/project_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'department_code_provider.g.dart';

@riverpod
DepartmentCodeRepository departmentCodeRepository(
  Ref ref,
) {
  final endpoint = serverpodClient.departmentCode;
  return DepartmentCodeRepository(endpoint: endpoint);
}

@riverpod
Future<DepartmentCode> fetchDepartmentCode(
  Ref ref,
  int id,
) async {
  return ref.watch(departmentCodeRepositoryProvider).fetchById(id);
}

/// Used to fetch all department codes when adding an entity which
/// requires a department code (like an app user).
@riverpod
Future<List<DepartmentCode>> fetchAllDepartmentCodes(
  Ref ref,
) async {
  return ref.watch(departmentCodeRepositoryProvider).fetchAll();
}

@riverpod
Future<List<DepartmentCode>> findDepartmentCodes(
  Ref ref,
  String sessionId,
) async {
  final sorting = ref.watch(appTableSortStateProvider(sessionId));
  final filtering = ref.watch(
    appTableFilterStateProvider(TableType.salutationCode.name, sessionId),
  );
  return ref
      .watch(departmentCodeRepositoryProvider)
      .find(sort: sorting, filter: filtering);
}

@riverpod
Stream<DepartmentCode> watchDepartmentCode(
  Ref ref, {
  required String sessionId,
  required int id,
}) async* {
  final streamHelper =
      ServerpodStreamManager<DepartmentCode, DepartmentCodeDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () => serverpodClient.departmentCode.watch(
      sessionId: sessionId,
      entityId: id,
    ),
    convertDtoToModel: DepartmentCode.fromDTO,
    onError: (error) {
      dlog('Error occurred in watchDepartmentCode: $error');
    },
  );
}
