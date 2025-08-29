import 'package:flutter/services.dart';

enum RunMode {
  // dev(
  //   mode: 'development',
  //   apiUrl: 'https://coe-dev.api.serverpod.space/',
  //   readable: 'DEV',
  // ),
  dev(
    key: 'development',
    apiUrl: 'http://localhost:8080/',
    readable: 'DEV',
    backgroundColor: Color(0xFFAF0000),
    borderColor: Color(0xFF760000),
    foregroundColor: Color(0xFFFFFFFF),
  ),
  test(
    key: 'test',
    apiUrl: 'https://test.api.coe.elbdesk.cloud/',
    readable: 'TEST',
    backgroundColor: Color(0xFF00C3FF),
    borderColor: Color(0xff008ff4),
    foregroundColor: Color(0xFFFFFFFF),
  ),
  staging(
    key: 'staging',
    apiUrl: 'https://staging.api.coe.elbdesk.cloud/',
    readable: 'STAGING',
    backgroundColor: Color(0xFFFFDE3D),
    borderColor: Color(0xFFD4AC29),
    foregroundColor: Color(0x99000000),
  ),
  prod(
    key: 'production',
    apiUrl: 'https://api.coe.elbdesk.cloud/',
    readable: 'PROD',
    backgroundColor: Color(0xFF7B99CA),
    borderColor: Color(0xFF4D71B0),
    foregroundColor: Color(0xFFFFFFFF),
  );

  const RunMode({
    required this.key,
    required this.apiUrl,
    required this.readable,
    required this.backgroundColor,
    required this.borderColor,
    required this.foregroundColor,
  });

  /// The mode of the run.
  final String key;

  /// The API URL of the server.
  final String apiUrl;

  /// The readable name of the run mode.
  final String readable;

  /// The background color of the run mode.
  final Color backgroundColor;

  /// The foreground color of the run mode.
  final Color foregroundColor;

  /// The border color of the run mode.
  final Color borderColor;

  static RunMode fromString(String environment) {
    return switch (environment) {
      'development' => RunMode.dev,
      'test' => RunMode.test,
      'staging' => RunMode.staging,
      'production' => RunMode.prod,
      _ => RunMode.dev,
    };
  }

  bool get isTest => this == RunMode.test;
  bool get isStaging => this == RunMode.staging;
  bool get isProd => this == RunMode.prod;
  bool get isDev => this == RunMode.dev;
  bool get isNotTest => !isTest;
  bool get isNotStaging => !isStaging;
  bool get isNotProd => !isProd;
  bool get isNotDev => !isDev;
}
