// This script is used to build the Windows application with the correct icon
// based on the run mode.
//
// Usage:
//
// ```
// dart build_windows.dart --dart-define=RUN_MODE=dev
// ```
import 'dart:io';
import 'package:args/args.dart';
import 'package:path/path.dart' as p;

void main(List<String> args) async {
  final parser = ArgParser()
    ..addOption(
      'app-version',
      abbr: 'a',
      help: 'Specifies the app version for the build',
    )
    ..addOption(
      'run-mode',
      abbr: 'r',
      defaultsTo: 'production',
      allowed: ['development', 'test', 'staging', 'production'],
      help: 'Specifies the run mode for the build',
    )
    ..addOption(
      'msix-version',
      abbr: 'v',
      defaultsTo: '0.1.0.0',
      help: 'Specifies the MSIX version for the build',
    )
    ..addOption(
      'certificate-password',
      abbr: 'p',
      help: 'Specifies the password for the certificate',
    );

  ArgResults argResults;
  try {
    argResults = parser.parse(args);
  } catch (e) {
    print('Error: ${e.toString()}\n');
    print('Usage:');
    print(parser.usage);
    exit(1);
  }

  final appVersion = argResults['app-version'] as String;
  final runMode = argResults['run-mode'] as String;
  final msixVersion = argResults['msix-version'] as String;
  // final certificatePassword = argResults['certificate-password'] as String;

  print('------------------ARGUMENTS------------------');
  print('App version: $appVersion');
  print('Run mode: $runMode');
  print('MSIX version: $msixVersion');
  print('---------------------------------------------');

  final runModeReadable = switch (runMode) {
    'development' => 'DEV',
    'test' => 'TEST',
    'staging' => 'STAGING',
    _ => 'PROD',
  };

  // Windows icon
  final windowsIconSource = p.join(
      'windows',
      'runner',
      'resources',
      switch (runMode) {
        'development' => 'app_icon_development.ico',
        'test' => 'app_icon_test.ico',
        'staging' => 'app_icon_staging.ico',
        _ => 'app_icon_production.ico',
      });

  //* SETUP ICONS

  print('\x1B[32m Setting up icons for $runMode run mode...\x1B[0m');

  await File(windowsIconSource).copy('windows/runner/resources/app_icon.ico');
  await Future.delayed(const Duration(seconds: 5));

  //* CLEAN

  print('\x1B[32m Cleaning up...\x1B[0m');

  final cleanProcess = await Process.start(
    'flutter',
    ['clean'],
    runInShell: true,
  );
  cleanProcess.stdout.listen((data) {
    stdout.add(data);
  });
  cleanProcess.stderr.listen((data) {
    stderr.add(data);
  });

  await cleanProcess.exitCode;

  //* PUB GET

  print('\x1B[32m Running flutter pub get...\x1B[0m');
  // First, build the Windows app
  final flutterPath = await _getFlutterPath();
  final pubGetProcess = await Process.start(
    flutterPath,
    [
      'pub',
      'get',
    ],
    runInShell: true,
  );

  pubGetProcess.stdout.listen((data) {
    stdout.add(data);
  });
  pubGetProcess.stderr.listen((data) {
    stderr.add(data);
  });

  // Wait for the build to complete
  final pubGetExitCode = await pubGetProcess.exitCode;
  if (pubGetExitCode != 0) {
    print('Flutter pub get failed with exit code $pubGetExitCode');
    exit(pubGetExitCode);
  }

  //* FLUTTER BUILD PROCESS

  // print('\x1B[32m Building Windows app...\x1B[0m');
  // // First, build the Windows app
  // final flutterPath = await _getFlutterPath();
  // final buildProcess = await Process.start(
  //   flutterPath,
  //   [
  //     'build',
  //     'windows',
  //     '--release',
  //     '--dart-define=RUN_MODE=$runMode',
  //   ],
  //   runInShell: true,
  // );

  // // Forward stdout and stderr in real-time
  // buildProcess.stdout.listen((data) => stdout.add(data));
  // buildProcess.stderr.listen((data) => stderr.add(data));

  // // Wait for the build to complete
  // final buildExitCode = await buildProcess.exitCode;
  // if (buildExitCode != 0) {
  //   print('Flutter build failed with exit code $buildExitCode');
  //   exit(buildExitCode);
  // }

  //* MSIX PROCESS

  print('\x1B[32m Building MSIX...\x1B[0m');

  final scriptDir = Directory.current;

  // Run the actual build command
  final msixProcess = await Process.start(
    'dart',
    [
      'run',
      'msix:create',
      '-v',
      '--display-name',
      'ElbDesk - Carl Ostermann Erben (${runModeReadable})',
      '--publisher-display-name',
      'App Ahoi GmbH',
      '--identity-name',
      'com.elbdesk.coe.${runMode}',
      '--release',
      '--install-certificate',
      'false',
      '--version',
      msixVersion,
      '--logo-path',
      'windows/runner/resources/app_icon_${runMode}_512.png',
      '--windows-build-args',
      '--dart-define=APP_VERSION="$appVersion" --dart-define=RUN_MODE="$runMode"',
    ],
    runInShell: true,
    workingDirectory: scriptDir.path,
  );
  // Forward stdout and stderr in real-time
  msixProcess.stdout.listen((data) {
    stdout.add(data);
  });
  msixProcess.stderr.listen((data) {
    stderr.add(data);
  });

  // Wait for the process to complete and get the exit code
  final exitCode = await msixProcess.exitCode;

  //* CLEANUP ICONS
  final windowsDevelopmentIconSource =
      p.join('windows', 'runner', 'resources', 'app_icon_development.ico');
  await File(windowsDevelopmentIconSource)
      .copy('windows/runner/resources/app_icon.ico');

  exit(exitCode);
}

Future<String> _getFlutterPath() async {
  // use environment-variable 'flutter' by default
  var flutterPath = 'flutter';

  // e.g. C:\Users\MyUser\fvm\versions\3.7.12\bin\cache\dart-sdk\bin\dart.exe
  final dartPath = p.split(Platform.executable);

  // if contains 'cache\dart-sdk' we can know where is the 'flutter' located
  if (dartPath.contains('dart-sdk') && dartPath.length > 4) {
    // e.g. C:\Users\MyUser\fvm\versions\3.7.12\bin\flutter
    final flutterRelativePath = p.joinAll([
      ...dartPath.sublist(0, dartPath.length - 4),
      flutterPath,
    ]);

    if (await File(flutterRelativePath).exists()) {
      flutterPath = flutterRelativePath;
    }
  }

  return flutterPath;
}
