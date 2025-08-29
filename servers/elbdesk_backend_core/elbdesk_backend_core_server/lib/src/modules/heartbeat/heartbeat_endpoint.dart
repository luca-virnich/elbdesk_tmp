import 'dart:async';

import 'package:serverpod/serverpod.dart';

class HeartbeatEndpoint extends Endpoint {
  HeartbeatEndpoint() {
    _timer ??= Timer.periodic(const Duration(seconds: 30), (timer) {
      heartbeatStreamController.add(true);
    });
  }
  static final heartbeatStreamController = StreamController<bool>.broadcast();
  static Timer? _timer;

  Stream<bool> watchHeartbeat(Session session) async* {
    yield true;

    yield* heartbeatStreamController.stream;
  }
}
