/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class FlutterLogDTO implements _i1.SerializableModel {
  FlutterLogDTO._({
    this.id,
    this.deviceId,
    this.userId,
    this.context,
    required this.exception,
    this.flutterLibrary,
    this.stack,
    this.silent,
    this.information,
    required this.time,
    this.platform,
    this.appVersion,
    this.buildNumber,
  });

  factory FlutterLogDTO({
    int? id,
    String? deviceId,
    int? userId,
    String? context,
    required String exception,
    String? flutterLibrary,
    String? stack,
    bool? silent,
    String? information,
    required DateTime time,
    String? platform,
    String? appVersion,
    String? buildNumber,
  }) = _FlutterLogDTOImpl;

  factory FlutterLogDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return FlutterLogDTO(
      id: jsonSerialization['id'] as int?,
      deviceId: jsonSerialization['deviceId'] as String?,
      userId: jsonSerialization['userId'] as int?,
      context: jsonSerialization['context'] as String?,
      exception: jsonSerialization['exception'] as String,
      flutterLibrary: jsonSerialization['flutterLibrary'] as String?,
      stack: jsonSerialization['stack'] as String?,
      silent: jsonSerialization['silent'] as bool?,
      information: jsonSerialization['information'] as String?,
      time: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['time']),
      platform: jsonSerialization['platform'] as String?,
      appVersion: jsonSerialization['appVersion'] as String?,
      buildNumber: jsonSerialization['buildNumber'] as String?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String? deviceId;

  int? userId;

  String? context;

  String exception;

  String? flutterLibrary;

  String? stack;

  bool? silent;

  String? information;

  DateTime time;

  String? platform;

  String? appVersion;

  String? buildNumber;

  /// Returns a shallow copy of this [FlutterLogDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  FlutterLogDTO copyWith({
    int? id,
    String? deviceId,
    int? userId,
    String? context,
    String? exception,
    String? flutterLibrary,
    String? stack,
    bool? silent,
    String? information,
    DateTime? time,
    String? platform,
    String? appVersion,
    String? buildNumber,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (deviceId != null) 'deviceId': deviceId,
      if (userId != null) 'userId': userId,
      if (context != null) 'context': context,
      'exception': exception,
      if (flutterLibrary != null) 'flutterLibrary': flutterLibrary,
      if (stack != null) 'stack': stack,
      if (silent != null) 'silent': silent,
      if (information != null) 'information': information,
      'time': time.toJson(),
      if (platform != null) 'platform': platform,
      if (appVersion != null) 'appVersion': appVersion,
      if (buildNumber != null) 'buildNumber': buildNumber,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _FlutterLogDTOImpl extends FlutterLogDTO {
  _FlutterLogDTOImpl({
    int? id,
    String? deviceId,
    int? userId,
    String? context,
    required String exception,
    String? flutterLibrary,
    String? stack,
    bool? silent,
    String? information,
    required DateTime time,
    String? platform,
    String? appVersion,
    String? buildNumber,
  }) : super._(
          id: id,
          deviceId: deviceId,
          userId: userId,
          context: context,
          exception: exception,
          flutterLibrary: flutterLibrary,
          stack: stack,
          silent: silent,
          information: information,
          time: time,
          platform: platform,
          appVersion: appVersion,
          buildNumber: buildNumber,
        );

  /// Returns a shallow copy of this [FlutterLogDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  FlutterLogDTO copyWith({
    Object? id = _Undefined,
    Object? deviceId = _Undefined,
    Object? userId = _Undefined,
    Object? context = _Undefined,
    String? exception,
    Object? flutterLibrary = _Undefined,
    Object? stack = _Undefined,
    Object? silent = _Undefined,
    Object? information = _Undefined,
    DateTime? time,
    Object? platform = _Undefined,
    Object? appVersion = _Undefined,
    Object? buildNumber = _Undefined,
  }) {
    return FlutterLogDTO(
      id: id is int? ? id : this.id,
      deviceId: deviceId is String? ? deviceId : this.deviceId,
      userId: userId is int? ? userId : this.userId,
      context: context is String? ? context : this.context,
      exception: exception ?? this.exception,
      flutterLibrary:
          flutterLibrary is String? ? flutterLibrary : this.flutterLibrary,
      stack: stack is String? ? stack : this.stack,
      silent: silent is bool? ? silent : this.silent,
      information: information is String? ? information : this.information,
      time: time ?? this.time,
      platform: platform is String? ? platform : this.platform,
      appVersion: appVersion is String? ? appVersion : this.appVersion,
      buildNumber: buildNumber is String? ? buildNumber : this.buildNumber,
    );
  }
}
