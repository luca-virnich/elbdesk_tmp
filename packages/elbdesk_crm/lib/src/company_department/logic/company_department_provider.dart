import 'dart:async';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:project_core/project_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'company_department_provider.g.dart';

@riverpod
CompanyDepartmentRepository companyDepartmentRepository(
  Ref ref,
) {
  return CompanyDepartmentRepository(
    endpoint: serverpodClient.companyDepartment,
  );
}

/// Find CompanyDepartment Provider
@riverpod
Future<List<CompanyDepartment>> findCompanyDepartments(
  Ref ref,
  String sessionId,
) async {
  final repository = ref.watch(companyDepartmentRepositoryProvider);
  final (sort, filter) = ref.watch(
    tableSortAndFilterProvider(
      sessionId,
      TableType.companyDepartment.name,
    ),
  );
  return repository.find(sort: sort, filter: filter);
}

@riverpod
Future<List<CompanyDepartment>> fetchCompanyDepartments(
  Ref ref,
) async {
  return ref.watch(companyDepartmentRepositoryProvider).fetchAll();
}

@riverpod
Future<CompanyDepartment?> fetchCompanyDepartment(
  Ref ref,
  int id,
) async {
  return ref.watch(companyDepartmentRepositoryProvider).fetchById(id);
}

@riverpod
Stream<CompanyDepartment> watchCompanyDepartment(
  Ref ref, {
  required int entityId,
  required String sessionId,
}) async* {
  final streamHelper =
      ServerpodStreamManager<CompanyDepartment, CompanyDepartmentDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () => serverpodClient.companyDepartment.watchEntity(
      sessionId: sessionId,
      entityId: entityId,
    ),
    convertDtoToModel: CompanyDepartment.fromDTO,
    onError: (error) {
      dlog('Error occurred in watchCompanyDepartment: $error');
    },
  );
}

/// Fetch departments by company provider
@riverpod
Future<List<CompanyDepartment>> fetchDepartmentsByCompany(
  Ref ref,
  String sessionId, {
  required int companyId,
}) async {
  final (sort, filter) = ref.watch(
    tableSortAndFilterProvider(
      sessionId,
      TableType.companyDepartment.name,
    ),
  );
  return ref
      .watch(companyDepartmentRepositoryProvider)
      .fetchDepartmentsByCompany(companyId, sort: sort, filter: filter);
}

/// Watch departments by company updates provider
@riverpod
Stream<CompanyDepartment> watchDepartmentsByCompanyUpdates(
  Ref ref,
  int companyId,
) async* {
  final streamHelper =
      ServerpodStreamManager<CompanyDepartment, CompanyDepartmentDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () =>
        serverpodClient.companyDepartment.watchDepartmentsByCompany(
      companyId: companyId,
    ),
    convertDtoToModel: CompanyDepartment.fromDTO,
    onError: (error) {
      dlog('Error occurred in watchDepartmentsByCompanyUpdates: $error');
    },
  );
}

/// Watch departments by company provider
@riverpod
class WatchDepartmentsByCompany extends _$WatchDepartmentsByCompany {
  @override
  Future<List<CompanyDepartment>> build(
    String sessionId, {
    required int companyId,
  }) async {
    final initial = await ref.watch(
      fetchDepartmentsByCompanyProvider(
        sessionId,
        companyId: companyId,
      ).future,
    );

    ref.listen(
      watchDepartmentsByCompanyUpdatesProvider(companyId),
      (previous, next) {
        if (next is AsyncData<CompanyDepartment>) {
          handleEvent(next.value);
        }
      },
    );

    return initial;
  }

  void handleEvent(CompanyDepartment updatedCompanyDepartment) {
    final currentList = state.valueOrNull ?? [];
    final isDeleted = updatedCompanyDepartment.meta.deletedAt != null;

    if (isDeleted) {
      state = AsyncValue.data(
        currentList
            .where((item) => item.meta.id != updatedCompanyDepartment.meta.id)
            .toList(),
      );
      return;
    }
    final existingIndex = currentList.indexWhere(
      (item) => item.meta.id == updatedCompanyDepartment.meta.id,
    );

    if (existingIndex != -1) {
      final updatedList = [...currentList];
      updatedList[existingIndex] = updatedCompanyDepartment;
      state = AsyncValue.data(updatedList);
    } else {
      state = AsyncValue.data(
        [...currentList, updatedCompanyDepartment],
      );
    }
  }
}

/// Fetch departments by employee provider
@riverpod
Future<List<CompanyDepartment>> fetchDepartmentsByEmployee(
  Ref ref,
  int employeeId,
) async {
  final repository = ref.watch(companyDepartmentRepositoryProvider);
  return repository.fetchDepartmentsByEmployee(
    employeeId,
  );
}

/// Watch departments by employee updates provider
@riverpod
Stream<CompanyDepartment> watchDepartmentsByEmployeeUpdates(
  Ref ref,
  int employeeId,
) async* {
  final streamHelper =
      ServerpodStreamManager<CompanyDepartment, CompanyDepartmentDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () =>
        serverpodClient.companyDepartment.watchDepartmentsByEmployee(
      employeeId: employeeId,
    ),
    convertDtoToModel: CompanyDepartment.fromDTO,
    onError: (error) {
      dlog('Error occurred in watchDepartmentsByEmployeeUpdates: $error');
    },
  );
}

/// Watch employee removals from any department provider
@riverpod
Stream<int> watchEmployeeRemovalsFromAnyDepartment(
  Ref ref,
  int employeeId,
) async* {
  final streamHelper = ServerpodStreamManager<int, int>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () =>
        serverpodClient.companyEmployee.watchEmployeeRemovalsFromAnyDepartment(
      employeeId: employeeId,
    ),
    convertDtoToModel: (dto) => dto, // No conversion needed for int
    onError: (error) {
      dlog('Error occurred in watchEmployeeRemovalsFromAnyDepartment: $error');
    },
  );
}

/// Watch departments by employee provider
///
/// Used to fetch all departments in the EmployeeCard
@riverpod
class WatchDepartmentsByEmployee extends _$WatchDepartmentsByEmployee {
  @override
  Future<List<CompanyDepartment>> build({
    required int employeeId,
  }) async {
    final initial = await ref.watch(
      fetchDepartmentsByEmployeeProvider(
        employeeId,
      ).future,
    );

    ref
      ..listen(
        watchDepartmentsByEmployeeUpdatesProvider(employeeId),
        (previous, next) {
          if (next is AsyncData<CompanyDepartment>) {
            handleEvent(next.value);
          }
        },
      )

      // Listen to employee removals from departments
      ..listen(
        watchEmployeeRemovalsFromAnyDepartmentProvider(employeeId),
        (previous, next) {
          if (next is AsyncData<int>) {
            handleDeletion(next.value);
          }
        },
      );

    return initial;
  }

  void handleEvent(CompanyDepartment updatedCompanyDepartment) {
    final currentList = state.valueOrNull ?? [];
    final isDeleted = updatedCompanyDepartment.meta.deletedAt != null;

    if (isDeleted) {
      state = AsyncValue.data(
        currentList
            .where((item) => item.meta.id != updatedCompanyDepartment.meta.id)
            .toList(),
      );
      return;
    }
    final existingIndex = currentList.indexWhere(
      (item) => item.meta.id == updatedCompanyDepartment.meta.id,
    );

    if (existingIndex != -1) {
      final updatedList = [...currentList];
      updatedList[existingIndex] = updatedCompanyDepartment;
      state = AsyncValue.data(updatedList);
    } else {
      state = AsyncValue.data(
        [...currentList, updatedCompanyDepartment],
      );
    }
  }

  void handleDeletion(int departmentId) {
    final currentList = state.valueOrNull ?? [];
    state = AsyncValue.data(
      currentList.where((item) => item.meta.id != departmentId).toList(),
    );
  }
}
