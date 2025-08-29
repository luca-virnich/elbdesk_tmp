import 'dart:async';

import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recent_window_repository.g.dart';

/// Recent Window Repository Provider
@riverpod
RecentWindowRepository recentWindowRepository(Ref ref) {
  return RecentWindowRepository(
    endpoint: EndpointRecentWindow(ElbDeskCore.client),
  );
}

/// Recent Window Repository
class RecentWindowRepository {
  /// Recent Window Repository constructor
  RecentWindowRepository({required this.endpoint});

  /// Serverpod Client
  final EndpointRecentWindow endpoint;

  /// Fetch Recent Windows
  Future<List<RecentWindow>> fetchRecentWindows() async {
    final dtos = await endpoint.fetchRecentWindows();
    return dtos.map(RecentWindow.fromDTO).toList();
  }

  /// Add Recent Window
  Future<void> addRecentWindow(
    RecentWindow window, {
    required bool isInserted,
  }) async {
    await endpoint.addRecentWindow(
      isInserted: isInserted,
      dto: window.toDTO(),
    );
  }
}
