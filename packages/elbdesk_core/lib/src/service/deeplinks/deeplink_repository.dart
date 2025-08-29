import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'deeplink_repository.g.dart';

@riverpod
DeeplinkCoreRepository deeplinkCoreRepository(Ref ref) {
  return DeeplinkCoreRepository(
    clientCore: EndpointDeeplinkCore(ElbDeskCore.client),
    ref: ref,
  );
}

class DeeplinkCoreRepository {
  DeeplinkCoreRepository({
    required this.clientCore,
    required this.ref,
  });

  final EndpointDeeplinkCore clientCore;
  final Ref ref;

  Future<String> getDeepLinkUrl(
    String floatingWindowType,
    int primaryId,
  ) async {
    final url = await clientCore.createDeeplink(
      primaryId: primaryId,
      floatingWindowType: floatingWindowType,
    );
    return url;
  }
}
