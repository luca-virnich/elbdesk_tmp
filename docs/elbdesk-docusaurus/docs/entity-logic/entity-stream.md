# Enity Stream/Watch (Client)

We have also to define the Stream to get Updates from an Entity:

```dart
@riverpod
Stream<LanguageCode> watchLanguageCode(
  WatchLanguageCodeRef ref, {
  required String sessionId,
  required int languageCodeId,
}) async* {
  final streamHelper = EntityStreamManager<LanguageCode, LanguageCodeDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () => serverpodClient.languageCode.watch(
      
      sessionId: sessionId,
      entityId: languageCodeId,
    ),
    convertDtoToModel: LanguageCode.fromDTO,
    onError: (error) {
      dlog('Error occurred in watchLanguageCode: $error');
    },
  );
}
```