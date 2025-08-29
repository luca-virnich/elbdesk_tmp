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
      'run-mode',
      abbr: 'r',
      defaultsTo: 'production',
      allowed: ['development', 'test', 'staging', 'production'],
      help: 'Specifies the run mode for the build',
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

  final runMode = argResults['run-mode'] as String;

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

  print('\x1B[32m Creating temporary PFX certificate...\x1B[0m');

  // Create temporary certificate file
  final certBytes =
      base64.decode(Platform.environment['SIGNING_CERTIFICATE'] ?? '');
  final tempCert = File('${Directory.systemTemp.path}\\cert.pfx');
  await tempCert.writeAsBytes(certBytes);

  print('\x1B[32m Building MSIX...\x1B[0m');

  // Run the actual build command
  final msixProcess = await Process.start(
    'dart',
    [
      'run',
      'msix:create',
      '-v',
      '--release',
      '--install-certificate',
      'false',
      '--certificate-path',
      tempCert.path,
      '--certificate-password',
      Platform.environment['CERTIFICATE_PASSWORD'] ?? '',
      '--logo-path',
      'windows/runner/resources/app_icon_${runMode}_512.png',
      '--windows-build-args',
      '--dart-define=RUN_MODE=$runMode',
    ],
    runInShell: true,
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

  print('\x1B[32m MSIX build completed with exit code $exitCode\x1B[0m');

  if (tempCert.existsSync()) {
    print('\x1B[32m Deleting temporary PFX certificate...\x1B[0m');
    await tempCert.delete();
  }

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
