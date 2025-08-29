import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

class MethodDocsLintRule extends DartLintRule {
  const MethodDocsLintRule() : super(code: _code);

  static const _code = LintCode(
    name: 'method_docs',
    problemMessage: 'Missing documentation for the method.',
  );

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    context.registry.addClassDeclaration((node) {
      for (final member in node.members) {
        if (member is MethodDeclaration) {
          _checkDocstring(member, reporter);
        }
      }
    });
  }

  void _checkDocstring(MethodDeclaration node, ErrorReporter reporter) {
    final comment = node.documentationComment;
    if (comment == null || comment.tokens.isEmpty) {
      reporter.atToken(node.name, code);
    }
  }
}
