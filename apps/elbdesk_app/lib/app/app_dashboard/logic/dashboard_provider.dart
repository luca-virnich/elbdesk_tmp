import 'dart:async';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_sales/elbdesk_sales.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_core/project_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dashboard_provider.g.dart';

/// Find all SOI Artworks currently assigned to this user
@riverpod
Future<List<SoiPrepareArtwork>> soiArtworksForLocalUser(
  Ref ref,
) async {
  final userInfo = ref.watch(authUserStateProvider);

  final repo = ref.watch(soiPrepareArtworkRepositoryProvider);

  final filter = Filter(
    filterGroups: [
      FilterGroup(
        nextOperator: FilterOperator.and,
        filters: [
          FilterField(
            fieldKey: SoiPrepareArtworkField.assignedUser.name,
            value: userInfo?.id?.toString() ?? '',
            fieldType: FilterFieldType.number,
            filterOperator: FilterOperator.and,
            uuid: const Uuid().v4(),
            type: FilterType.equal,
          ),
        ],
      ),
    ],
  );
  final soiArtworks = await repo.find(
    filter: filter,
  );

  return soiArtworks;
}
