import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'heartbeat_provider.g.dart';

@riverpod
Stream<bool> watchHeartbeat(Ref ref) async* {
  final streamHelper = ServerpodStreamManager<bool, bool>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () =>
        EndpointHeartbeat(ElbDeskCore.client).watchHeartbeat(),
    convertDtoToModel: (dto) => dto,
    onError: (error) {
      dlog('Error occurred in streamHeartbeat: $error');
    },
  );
}
