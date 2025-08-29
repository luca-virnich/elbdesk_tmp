import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

class ClassDocsLintRule extends DartLintRule {
  const ClassDocsLintRule() : super(code: _code);

  static const _code = LintCode(
    name: 'class_docs',
    problemMessage: 'Missing documentation for the class.',
  );

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    context.registry.addClassDeclaration((node) {
      if (!_isStateClass(node) && !_isPrivateClass(node)) {
        _checkDocstring(node, reporter);
      }
    });
  }

  bool _isStateClass(ClassDeclaration node) {
    final element = node.declaredElement;
    if (element == null) return false;
    return element.allSupertypes.any(
      (type) =>
          type.getDisplayString().startsWith('State<') ||
          type.getDisplayString().startsWith('ConsumerState<'),
    );
  }

  bool _isPrivateClass(ClassDeclaration node) {
    final element = node.declaredElement;
    if (element == null) return false;
    return element.isPrivate;
  }

  void _checkDocstring(ClassDeclaration node, ErrorReporter reporter) {
    final comment = node.documentationComment;
    if (comment == null || comment.tokens.isEmpty) {
      reporter.atToken(node.name, code);
    }
  }
}
