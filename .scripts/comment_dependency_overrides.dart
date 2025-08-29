import 'dart:io';

void main() {
  final file = File('pubspec.yaml');
  final lines = file.readAsLinesSync();
  final newLines = <String>[];
  bool inDependencyOverrides = false;
  int baseIndentation = -1;

  for (var line in lines) {
    if (line.trim() == 'dependency_overrides:') {
      inDependencyOverrides = true;
      baseIndentation = line.indexOf('dependency_overrides:');
      newLines.add('#$line');
    } else if (inDependencyOverrides) {
      if (line.trim().isEmpty) {
        inDependencyOverrides = false;
        newLines.add(line);
      } else {
        // Check if we're still in the dependency_overrides section by indentation
        final currentIndentation = line.indexOf(line.trim());
        if (currentIndentation > baseIndentation) {
          // Still in the section, comment out the line
          newLines.add('#$line');
        } else {
          // Back to base indentation or less, exit the section
          inDependencyOverrides = false;
          newLines.add(line);
        }
      }
    } else {
      newLines.add(line);
    }
  }

  file.writeAsStringSync(newLines.join('\n'));
  print('Processed ${lines.length} lines, commented out dependency overrides');
}
