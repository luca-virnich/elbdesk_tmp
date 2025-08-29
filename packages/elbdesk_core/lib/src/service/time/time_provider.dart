import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'time_provider.g.dart';

@riverpod
Stream<DateTime> watchTime(Ref ref) async* {
  final streamHelper = ServerpodStreamManager<DateTime, DateTime>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: EndpointTime(ElbDeskCore.client).watchServerTime,
    convertDtoToModel: (dto) => dto.toLocal(),
  );
}
