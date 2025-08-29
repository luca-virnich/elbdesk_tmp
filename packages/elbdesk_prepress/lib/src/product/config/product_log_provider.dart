import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_prepress/src/product/logic/product_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_log_provider.g.dart';

/// Provider to fetch product log entries
@riverpod
Future<List<ProductLogDTO>> fetchProductLogs(
  Ref ref,
  int entityId,
  String sessionId,
) async {
  final repository = ref.watch(productRepositoryProvider);
  return repository.fetchProductLogs(entityId, TableType.productMaster);
}
