import 'dart:io';

void main() {
  final file = File('pubspec.yaml');
  final lines = file.readAsLinesSync();
  final newLines = <String>[];
  bool inWorkspace = false;

  for (var line in lines) {
    if (line.trim() == 'workspace:') {
      inWorkspace = true;
      newLines.add(line);
    } else if (inWorkspace && line.trim().startsWith('-')) {
      final package = line.trim().substring(1).trim();
      if (isFlutterPackage(package)) {
        // Comment out Flutter packages
        newLines.add('#${line}');
      } else {
        newLines.add(line);
      }
    } else {
      inWorkspace = false;
      newLines.add(line);
    }
  }

  final processedLines = commentOutFlutterSdk(newLines);
  file.writeAsStringSync(processedLines.join('\n'));
}

bool isFlutterPackage(String packagePath) {
  // Check if the package's pubspec.yaml contains flutter: as a dependency
  final pubspecPath = '$packagePath/pubspec.yaml';
  try {
    final pubspecFile = File(pubspecPath);
    if (!pubspecFile.existsSync()) return false;

    final content = pubspecFile.readAsStringSync();
    return content.contains('\nflutter:') ||
        content.contains('sdk: flutter') ||
        content.contains('flutter:');
  } catch (e) {
    print('Error checking package $packagePath: $e');
    return false;
  }
}

List<String> commentOutFlutterSdk(List<String> lines) {
  return lines.map((line) {
    if (line.trim().startsWith('flutter:')) {
      return '#${line}';
    }
    return line;
  }).toList();
}
