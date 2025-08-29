import 'dart:async';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:project_core/project_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'company_employee_provider.g.dart';

@riverpod
CompanyEmployeeRepository companyEmployeeRepository(
  Ref ref,
) {
  return CompanyEmployeeRepository(
    ref: ref,
    endpoint: serverpodClient.companyEmployee,
  );
}

// ****************************************************************
// * Watching Updates for one company employee, need when the Employee
// * Cardis opened
// ****************************************************************

@riverpod
Stream<CompanyEmployee> watchCompanyEmployee(
  Ref ref, {
  required String sessionId,
  required int companyEmployeeId,
}) async* {
  final streamHelper =
      ServerpodStreamManager<CompanyEmployee, CompanyEmployeeDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () => serverpodClient.companyEmployee.watchEntity(
      sessionId: sessionId,
      entityId: companyEmployeeId,
    ),
    convertDtoToModel: CompanyEmployee.fromDTO,
    onError: (error) {
      dlog('Error occurred in streamCompanyEmployee: $error');
    },
  );
}

// 1. entity watchen (updates auf eine entity)
// 2. entity fetchen und watchen : STREAM
// 3. entity fetchen

// Stream = fetched und lauscht auf updates

// watch = nur updates
// fetch = nur fetched

// ****************************************************************
// * Company Card Open, we are checking the employees by company
// ****************************************************************

// * Streams all Employees by Company with filter Matching
@riverpod
class StreamEmployeesByCompany extends _$StreamEmployeesByCompany {
  @override
  Future<List<CompanyEmployee>> build(
    String sessionId, {
    required int companyId,
  }) async {
    // Get the sort and filter from the provider
    final (sort, filter) = ref.watch(
      tableSortAndFilterProvider(
        sessionId,
        TableType.companyEmployee.name,
      ),
    );

    // Get the initial data from the repository
    final repo = ref.watch(companyEmployeeRepositoryProvider);
    final initialData =
        await repo.fetchEmployeesByCompany(companyId, sort, filter);

    // Listen to updates using the new efficient stream
    ref.listen(
      watchEmployeeUpdatesProvider(
        sessionId,
        companyId: companyId,
      ),
      (_, next) {
        if (next.hasValue) {
          final (removedId, employee) = next.value!;
          _handleUpdate(removedId, employee);
        }
      },
    );

    return initialData;
  }

  void _handleUpdate(int? removedId, CompanyEmployee? employee) {
    state = StreamUpdateHandler.handleUpdateWithMetaId(
      currentState: state,
      removedId: removedId,
      entity: employee,
    );
  }
}

// * Watching Updates for employees by company with filter matching
@riverpod
Stream<(int?, CompanyEmployee?)> watchEmployeeUpdates(
  Ref ref,
  String sessionId, {
  required int companyId,
}) async* {
  final (_, filter) = ref.watch(
    tableSortAndFilterProvider(sessionId, TableType.companyEmployee.name),
  );

  final streamHelper = ServerpodStreamManager<(int?, CompanyEmployee?),
      (int?, CompanyEmployeeDTO?)>();

  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () =>
        serverpodClient.companyEmployee.watchEmployeeByCompanyUpdates(
      companyId: companyId,
      filter: filter,
    ),
    convertDtoToModel: (record) {
      final (removedId, dto) = record;
      return (
        removedId,
        dto != null ? CompanyEmployee.fromDTO(dto) : null,
      );
    },
    onError: (error) {
      dlog('Error occurred in watchEmployeeUpdates: $error');
    },
  );
}

@riverpod
Future<List<CompanyEmployee>> streamActiveEmployeesByCompany(
  Ref ref,
  String sessionId, {
  required int companyId,
}) async {
  final employees = await ref.watch(
    streamEmployeesByCompanyProvider(
      sessionId,
      companyId: companyId,
    ).future,
  );
  return employees.where((employee) => employee.active).toList();
}

// ****************************************************************
// * Contact Card Open, we are checking the companies by employee
// ****************************************************************

@riverpod
Future<List<CompanyEmployee>> fetchCompaniesByEmployee(
  Ref ref,
  String sessionId, {
  required int employeeId,
}) async {
  final (sort, filter) = ref.watch(
    tableSortAndFilterProvider(
      sessionId,
      TableType.companyEmployee.name,
    ),
  );
  return ref
      .watch(companyEmployeeRepositoryProvider)
      .fetchCompaniesByEmployee(employeeId, sort, filter);
}

@riverpod
Stream<CompanyEmployee> watchCompaniesByEmployeeUpdates(
  Ref ref,
  int employeeId,
) async* {
  final streamHelper =
      ServerpodStreamManager<CompanyEmployee, CompanyEmployeeDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () =>
        serverpodClient.companyEmployee.watchCompaniesByEmployee(
      employeeId: employeeId,
    ),
    convertDtoToModel: CompanyEmployee.fromDTO,
    onError: (error) {
      dlog('Error occurred in streamCompanyEmployeesForCompanyUpdates: $error');
    },
  );
}

@riverpod
class WatchCompaniesByEmployee extends _$WatchCompaniesByEmployee {
  @override
  Future<List<CompanyEmployee>> build(
    String sessionId, {
    required int employeeId,
  }) async {
    final inital = await ref.watch(
      fetchCompaniesByEmployeeProvider(
        sessionId,
        employeeId: employeeId,
      ).future,
    );

    ref.listen(
      watchCompaniesByEmployeeUpdatesProvider(employeeId),
      (previous, next) {
        if (next is AsyncData<CompanyEmployee>) {
          handleEvent(next.value);
        }
      },
    );

    return inital;
  }

  void handleEvent(CompanyEmployee updatedCompanyEmployee) {
    final currentList = state.valueOrNull ?? [];
    // check if artwork is already in list
    final isDeleted = updatedCompanyEmployee.meta.deletedAt != null;

    if (isDeleted) {
      state = AsyncValue.data(
        currentList
            .where((item) => item.meta.id != updatedCompanyEmployee.meta.id)
            .toList(),
      );
      return;
    }
    final existingIndex = currentList.indexWhere(
      (item) => item.meta.id == updatedCompanyEmployee.meta.id,
    );

    if (existingIndex != -1) {
      // Update existing artwork
      final updatedList = [...currentList];
      updatedList[existingIndex] = updatedCompanyEmployee;
      state = AsyncValue.data(updatedList);
    } else {
      state = AsyncValue.data(
        [...currentList, updatedCompanyEmployee],
      );
    }
  }
}

// @riverpod
// Future<List<CompanyEmployee>> watchActiveEmployeesByCompany(
//   Ref ref,
//   String sessionId, {
//   required int companyId,
// }) async {
//   final employees = await ref.watch(
//     watchEmployeesByCompanyProvider(
//       sessionId,
//       companyId: companyId,
//     ).future,
//   );
//   return employees.where((employee) => employee.active).toList();
// }

/// Fetch employees by company and department provider
@riverpod
Future<List<CompanyEmployee>> fetchEmployeesByCompanyAndDepartment(
  Ref ref,
  String sessionId, {
  required int companyId,
  required int departmentId,
}) async {
  final (sort, filter) = ref.watch(
    tableSortAndFilterProvider(
      sessionId,
      TableType.companyEmployee.name,
    ),
  );
  return ref
      .watch(companyEmployeeRepositoryProvider)
      .fetchEmployeesByCompanyAndDepartment(
        companyId,
        departmentId,
        sort,
        filter,
      );
}

/// Watch employees by company and department provider
@riverpod
class WatchEmployeesByCompanyAndDepartment
    extends _$WatchEmployeesByCompanyAndDepartment {
  @override
  Future<List<CompanyEmployee>> build(
    String sessionId, {
    required int companyId,
    required int departmentId,
  }) async {
    final initial = await ref.watch(
      fetchEmployeesByCompanyAndDepartmentProvider(
        sessionId,
        companyId: companyId,
        departmentId: departmentId,
      ).future,
    );

    ref
      ..listen(
        watchEmployeesByCompanyAndDepartmentUpdatesProvider(
          companyId: companyId,
          departmentId: departmentId,
        ),
        (previous, next) {
          if (next is AsyncData<CompanyEmployee>) {
            handleEvent(next.value);
          }
        },
      )

      // Listen to deletions
      ..listen(
        watchEmployeesByDepartmentDeletionProvider(departmentId),
        (previous, next) {
          if (next is AsyncData<int>) {
            handleDeletion(next.value);
          }
        },
      );

    return initial;
  }

  void handleDeletion(int deletedEmployeeId) {
    final currentList = state.valueOrNull ?? [];
    state = AsyncValue.data(
      currentList.where((item) => item.meta.id != deletedEmployeeId).toList(),
    );
  }

  void handleEvent(CompanyEmployee updatedCompanyEmployee) {
    final currentList = state.valueOrNull ?? [];
    final isDeleted = updatedCompanyEmployee.meta.deletedAt != null;

    if (isDeleted) {
      state = AsyncValue.data(
        currentList
            .where((item) => item.meta.id != updatedCompanyEmployee.meta.id)
            .toList(),
      );
      return;
    }
    final existingIndex = currentList.indexWhere(
      (item) => item.meta.id == updatedCompanyEmployee.meta.id,
    );

    if (existingIndex != -1) {
      final updatedList = [...currentList];
      updatedList[existingIndex] = updatedCompanyEmployee;
      state = AsyncValue.data(updatedList);
    } else {
      state = AsyncValue.data(
        [...currentList, updatedCompanyEmployee],
      );
    }
  }
}

/// Watch employees by company and department updates provider
@riverpod
Stream<CompanyEmployee> watchEmployeesByCompanyAndDepartmentUpdates(
  Ref ref, {
  required int companyId,
  required int departmentId,
}) async* {
  final streamHelper =
      ServerpodStreamManager<CompanyEmployee, CompanyEmployeeDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () =>
        serverpodClient.companyEmployee.watchEmployeesByCompanyAndDepartment(
      companyId: companyId,
      departmentId: departmentId,
    ),
    convertDtoToModel: CompanyEmployee.fromDTO,
    onError: (error) {
      dlog(
        'Error occurred in watchEmployeesByCompanyAndDepartmentUpdates: $error',
      );
    },
  );
}

/// Watch employees by department deletion provider
@riverpod
Stream<int> watchEmployeesByDepartmentDeletion(
  Ref ref,
  int departmentId,
) async* {
  final streamHelper = ServerpodStreamManager<int, int>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () =>
        serverpodClient.companyEmployee.watchEmployeesByDepartmentDeletion(
      departmentId: departmentId,
    ),
    convertDtoToModel: (dto) => dto,
    onError: (error) {
      dlog('Error occurred in watchEmployeesByDepartmentDeletion: $error');
    },
  );
}

/// Efficient provider that combines fetch and watch using the new
/// record-based stream

@riverpod
class FetchAndWatchCompaniesByEmployee
    extends _$FetchAndWatchCompaniesByEmployee {
  @override
  Future<List<CompanyEmployee>> build(
    String sessionId, {
    required int employeeId,
  }) async {
    final inital = await ref.watch(
      fetchCompaniesByEmployeeProvider(
        sessionId,
        employeeId: employeeId,
      ).future,
    );

    ref.listen(
      watchCompaniesByEmployeeUpdatesProvider(employeeId),
      (previous, next) {
        if (next is AsyncData<CompanyEmployee>) {
          handleEvent(next.value);
        }
      },
    );

    return inital;
  }

  void handleEvent(CompanyEmployee updatedCompanyEmployee) {
    final currentList = state.valueOrNull ?? [];
    // check if artwork is already in list
    final isDeleted = updatedCompanyEmployee.meta.deletedAt != null;

    if (isDeleted) {
      state = AsyncValue.data(
        currentList
            .where((item) => item.meta.id != updatedCompanyEmployee.meta.id)
            .toList(),
      );
      return;
    }
    final existingIndex = currentList.indexWhere(
      (item) => item.meta.id == updatedCompanyEmployee.meta.id,
    );

    if (existingIndex != -1) {
      // Update existing artwork
      final updatedList = [...currentList];
      updatedList[existingIndex] = updatedCompanyEmployee;
      state = AsyncValue.data(updatedList);
    } else {
      state = AsyncValue.data(
        [...currentList, updatedCompanyEmployee],
      );
    }
  }
}
