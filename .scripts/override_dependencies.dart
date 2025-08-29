import 'dart:io';

void main() {
  final file = File('servers/elbdesk_server/pubspec.yaml');
  final lines = file.readAsLinesSync();
  final newLines = <String>[];
  bool inDependencyOverrides = false;

  for (var line in lines) {
    if (line.trim() == 'dependency_overrides:') {
      inDependencyOverrides = true;
      newLines.add(line);
    } else if (inDependencyOverrides && line.trim().startsWith('#')) {
      // Preserve indentation by replacing only the first # character
      final leadingSpaces = line.substring(0, line.indexOf('#'));
      final uncommentedContent = line.substring(line.indexOf('#') + 1);
      newLines.add('$leadingSpaces$uncommentedContent');
    } else {
      if (line.trim().isEmpty) {
        inDependencyOverrides = false;
      }
      newLines.add(line);
    }
  }

  file.writeAsStringSync(newLines.join('\n'));
  print('Processed ${lines.length} lines');
}
