/// Defines valid run modes for the Serverpod.
// class AppRunMode {
//   /// The app is run in development mode on a local machine.
//   static const development = 'development';

//   /// The app is run in test mode.
//   // static const test = 'test';

//   /// The app is run in staging mode.
//   static const staging = 'staging';

//   /// The app is run in production mode.
//   static const production = 'production';
// }

/// Parses the command line arguments passed to Serverpod.
// class AppCommandLineArgs {
//   /// Parses the command line arguments passed to App and creates a
//   /// [AppCommandLineArgs] object.
//   AppCommandLineArgs(List<String> args) {
//     try {
//       final argParser = ArgParser()
//         ..addOption(
//           'mode',
//           abbr: 'm',
//           allowed: [
//             RunMode.dev.key,
//             RunMode.staging.key,
//             RunMode.prod.key,
//           ],
//           defaultsTo: RunMode.dev.key,
//         );
//       final results = argParser.parse(args);

//       runMode = results['mode'] as String;
//     } catch (e) {
//       stdout.writeln(
//         'Failed to parse command line arguments. Using default values. $e',
//       );
//       runMode = RunMode.dev.key;
//     }
//   }

//   /// The run mode of the app. This can be set to either `development`,
//   /// `staging`, or `production`. Depending on where the app is deployed.
//   late final String runMode;

//   @override
//   String toString() {
//     return 'mode: $runMode';
//   }
// }
