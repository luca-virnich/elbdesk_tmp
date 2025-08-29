import 'package:serverpod/serverpod.dart';

import 'time_handler.dart';

class TimeEndpoint extends Endpoint {
  static final _handler = TimeHandler();

  Stream<DateTime> watchServerTime(Session session) async* {
    // Immediately send current time to new client
    yield DateTime.now();
    
    // Then subscribe to the broadcast stream for updates
    yield* _handler.stream;
  }
}
