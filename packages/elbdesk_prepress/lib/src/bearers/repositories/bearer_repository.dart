import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:project_core/project_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bearer_repository.g.dart';

/// Fetch Bearers Provider
///
/// This provider is used to fetch bearers from the server. It's possible to
/// add a sort and filter to the fetch request
@riverpod
Future<List<Bearer>> fetchBearers(
  Ref ref,
  TableType tableType,
  String sessionId,
) async {
  final repo = ref.watch(bearerRepositoryProvider);
  final sort = ref.watch(appTableSortStateProvider(sessionId));
  final filter =
      ref.watch(appTableFilterStateProvider(tableType.name, sessionId));
  return repo.fetchBearers(sort, filter);
}

/// Fetch Bearer Provider
///
/// This provider is used to fetch a single bearer from the server
/// based on the provided bearerId and sessionId
///
/// The sessionId is required to lock the bearer for editing
@riverpod
Future<Bearer?> fetchBearer(
  Ref ref,
  int id,
  String sessionId,
) async {
  final repo = ref.watch(bearerRepositoryProvider);

  return repo.fetchBearerForEdit(id, sessionId);
}

/// Fetch Filtered Bearers Provider
///
/// This provider is used to fetch bearers from the server. It's possible to
/// add addtional sort and filter arguments to the fetch request
@riverpod
Future<List<Bearer>> fetchFilteredBearers(
  Ref ref, {
  required Sort sort,
  required Filter filter,
}) async {
  final repo = ref.watch(bearerRepositoryProvider);
  return repo.fetchBearers(sort, filter);
}

/// Fetch Bearers by Customer Provider
///
/// This provider is used to fetch bearers from the server. It's possible to
/// add addtional sort and filter arguments to the fetch request
@riverpod
Future<List<Bearer>> fetchBearersByCustomer(
  Ref ref,
  int customerId,
  TableType tableType,
  String sessionId,
) async {
  final repo = ref.watch(bearerRepositoryProvider);
  final sort = ref.watch(appTableSortStateProvider(sessionId));
  final filter =
      ref.watch(appTableFilterStateProvider(tableType.name, sessionId));
  return repo.fetchBearersByCustomer(sort, filter, customerId);
}

/// Bearer Repository Provider
@riverpod
BearerRepository bearerRepository(Ref ref) {
  return BearerRepository(
    client: serverpodClient,
  );
}

/// Bearer Repository
///
/// This repository is used to interact with the Bearer Endpoint
/// of the serverpod backend.
///
/// It can be used to trigger CRUD operations & more on the Bearers Table
class BearerRepository {
  /// Constructor
  BearerRepository({
    required this.client,
  });

  /// Serverpod Client
  /// Necessary to interact with the serverpod backend
  final Client client;

  /// Create Bearer
  ///
  /// Used to create a new bearer
  Future<Bearer> createBearer(String sessionId, Bearer bearer) async {
    throw UnimplementedError();
    // final newBearer =
    //     await client.bearer.createBearer(sessionId, bearer.toDTO());

    // return Bearer.fromDTO(newBearer);
  }

  /// Delete Bearer
  ///
  /// Delete a Bearer based on the provided bearerId and sessionId
  /// The sessionId is used to check if the bearer is locked by the same id
  Future<bool> deleteBearer({
    required int bearerId,
    required String sessionId,
  }) async {
    throw UnimplementedError();
    // return client.bearer.deleteBearer(bearerId: bearerId, sessionId: sessionId);
  }

  /// Fetch Bearer by Id
  ///
  /// Used to fetch a single Bearer by its id
  Future<Bearer?> fetchBearerById(
    int id,
  ) async {
    throw UnimplementedError();
    // final bearer = await client.bearer.findBearerById(id);
    // if (bearer == null) return null;

    // return Bearer.fromDTO(bearer);
  }

  /// Update Bearer
  ///
  /// Used to update a Bearer in the database
  Future<Bearer> updateBearer(Bearer bearer, String sessionId) async {
    throw UnimplementedError();
    // final newBearer = await client.bearer
    //     .updateBearer(bearer.toDTO(), sessionId, deleteOldType: true);

    // return Bearer.fromDTO(
    //   newBearer,
    // );
  }

  /// Fetch Bearers
  ///
  /// Used to fetch all or several filtered Bearers at once
  Future<List<Bearer>> fetchBearers(Sort? sort, Filter? filter) async {
    throw UnimplementedError();
    // // final bearers =
    // //     (await client.bearer.findBearers(sort: sort, filter: filter))
    // //         .map(
    //           Bearer.fromDTO,
    //         )
    //         .toList();
    // return bearers;
  }

  /// Fetch Bearer by Customer
  ///
  /// Used to fetch all or several filtered Bearers at once
  Future<List<Bearer>> fetchBearersByCustomer(
    Sort? sort,
    Filter? filter,
    int customerId,
  ) async {
    throw UnimplementedError();
    // final bearers = (await client.bearer.findBearersByCustomer(
    //   customerId,
    // ))
    //     .map(
    //       Bearer.fromDTO,
    //     )
    //     .toList();

    // return bearers;
  }

  /// Fetch Bearer for Edit
  ///
  /// Used to fetch a Bearer for editing. This method locks the Bearer
  /// for editing and returns it. The Bearer can be edited and saved
  /// with the provided sessionId
  Future<Bearer?> fetchBearerForEdit(int bearerId, String sessionId) async {
    throw UnimplementedError();
    // final bearer = await client.bearer
    //     .fetchAndLockBearer(id: bearerId, sessionId: sessionId);

    // return bearer != null ? Bearer.fromDTO(bearer) : null;
  }

  /// Save and release a Bearer
  ///
  /// This method saves and releases a Bearer. This means that the
  /// Bearer is saved to the backend and the editingSession is removed.
  ///
  /// This can be used for autosave or when the user wants to release the
  /// Bearer directly after saving it.
  ///
  /// Usually it is released on disposing the state provider.
  Future<void> saveAndReleaseBearer(Bearer bearer, String sessionId) async {
    throw UnimplementedError();
    // try {

    //   await client.bearer.saveAndReleaseBearer(
    //     bearer: bearer.toDTO(),
    //     sessionId: sessionId,
    //   );
    // } catch (e) {
    //   debugPrint('cant save and release bearer $e');
    // }
  }

  /// Release a Bearer
  ///
  /// This method releases a Bearer. This means that the editingSession is
  /// removed from the Bearer and is free to be edited again
  Future<void> releaseBearer(int bearerId, String sessionId) async {
    throw UnimplementedError();
    // try {
    //   await client.bearer.release(entityId: bearerId, sessionId: sessionId);
    // } catch (e) {
    //   debugPrint('cant release bearer, maybe its deleted $e');
    // }
  }
}
