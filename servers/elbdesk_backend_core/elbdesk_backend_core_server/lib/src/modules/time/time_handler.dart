import 'dart:async';

class TimeHandler {
  static final _instance = TimeHandler._internal();
  factory TimeHandler() => _instance;
  
  TimeHandler._internal() {
    // Start the timer when the handler is created
    Timer.periodic(const Duration(seconds: 1), (_) {
      _streamController.add(DateTime.now());
    });
  }
  
  final _streamController = StreamController<DateTime>.broadcast();
  
  Stream<DateTime> get stream => _streamController.stream;
}