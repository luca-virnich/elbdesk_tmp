import 'package:analyzer/error/error.dart' as error;
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

class NoFlutterMaterialImportLintRule extends DartLintRule {
  const NoFlutterMaterialImportLintRule() : super(code: _code);

  static const _code = LintCode(
    name: 'no_flutter_material_import',
    problemMessage:
        'Importing `package:flutter/material.dart` is not allowed. Use `package:flutter/widgets.dart` instead.',
    errorSeverity: error.ErrorSeverity.ERROR,
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
