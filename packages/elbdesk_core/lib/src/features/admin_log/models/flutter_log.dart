import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'flutter_log.freezed.dart';

/// Represents a Flutter error log entry in the application
@freezed
class FlutterLog with _$FlutterLog {
  /// Creates a FlutterLog
  const factory FlutterLog({
    required int? id,
    required DateTime time,
    required String exception,
    String? context,
    String? flutterLibrary,
    String? stack,
    bool? silent,
    String? information,
    String? deviceId,
    int? userId,
    String? platform,
    String? appVersion,
    String? buildNumber,
  }) = _FlutterLog;

  const FlutterLog._();

  /// Creates a FlutterLog from a DTO
  factory FlutterLog.fromDTO(FlutterLogDTO dto) {
    return FlutterLog(
      id: dto.id,
      time: dto.time.toLocal(),
      exception: dto.exception,
      context: dto.context,
      flutterLibrary: dto.flutterLibrary,
      stack: dto.stack,
      silent: dto.silent,
      information: dto.information,
      deviceId: dto.deviceId,
      userId: dto.userId,
      platform: dto.platform,
      appVersion: dto.appVersion,
      buildNumber: dto.buildNumber,
    );
  }

  /// Converts FlutterLog to a DTO
  FlutterLogDTO toDTO() {
    return FlutterLogDTO(
      id: id,
      time: time,
      exception: exception,
      context: context,
      flutterLibrary: flutterLibrary,
      stack: stack,
      silent: silent,
      information: information,
      deviceId: deviceId,
      userId: userId,
      platform: platform,
      appVersion: appVersion,
      buildNumber: buildNumber,
    );
  }
}
