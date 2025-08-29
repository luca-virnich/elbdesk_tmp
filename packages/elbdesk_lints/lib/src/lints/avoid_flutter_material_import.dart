import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

class AvoidFlutterMaterialImportLintRule extends DartLintRule {
  const AvoidFlutterMaterialImportLintRule() : super(code: _code);

  static const _code = LintCode(
    name: 'avoid_flutter_material_import',
    problemMessage: 'Avoid importing `package:flutter/material.dart`.',
  );

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    context.registry.addImportDirective((node) {
      if (node.uri.stringValue == 'package:flutter/material.dart') {
        reporter.atNode(node, code);
      }
    });
  }
}
