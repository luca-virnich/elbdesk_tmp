import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/token.dart';
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

class AvoidMultiplePositionalParametersRule extends DartLintRule {
  const AvoidMultiplePositionalParametersRule() : super(code: _code);

  static const _code = LintCode(
    name: 'avoid_multiple_positional_parameters',
    problemMessage: 'Avoid using multiple positional parameters. '
        'Use named parameters instead.',
  );

  static final excludedSignatures = <_FunctionSignature>[
    const _FunctionSignature(
      functionName: 'build',
      parameterTypes: ['BuildContext', 'WidgetRef'],
    ),
  ];

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    final reportedNodes = <AstNode>{};

    void checkParameters(
      FormalParameterList? parameters,
      ErrorReporter reporter,
      AstNode node,
      Token nameToken,
    ) {
      if (parameters != null) {
        var positionalParameterCount = 0;
        for (final parameter in parameters.parameters) {
          if (parameter.isPositional) {
            positionalParameterCount++;
          }
        }

        if (positionalParameterCount > 2 && !reportedNodes.contains(node)) {
          if (_isExcludedFunction(node, parameters) ||
              node is FunctionExpression) {
            return;
          }

          reporter.atToken(nameToken, code);
          reportedNodes.add(node);
        }
      }
    }

    context.registry.addFunctionDeclaration((node) {
      if (!reportedNodes.contains(node)) {
        checkParameters(
          node.functionExpression.parameters,
          reporter,
          node,
          node.name,
        );
      }
    });

    context.registry.addMethodDeclaration((node) {
      if (!reportedNodes.contains(node)) {
        checkParameters(node.parameters, reporter, node, node.name);
      }
    });

    context.registry.addFunctionExpression((node) {
      if (!reportedNodes.contains(node)) {
        final nameToken = node.parameters?.leftParenthesis ?? node.beginToken;
        checkParameters(node.parameters, reporter, node, nameToken);
      }
    });
  }

  bool _isExcludedFunction(AstNode node, FormalParameterList parameters) {
    if (node is MethodDeclaration || node is FunctionDeclaration) {
      final functionName = node is MethodDeclaration
          ? node.name.lexeme
          : (node as FunctionDeclaration).name.lexeme;

      for (final signature in excludedSignatures) {
        if (signature.functionName == functionName) {
          // Überprüfen, ob die Parameter-Typen übereinstimmen
          if (_matchParameterTypes(signature.parameterTypes, parameters)) {
            return true;
          }
        }
      }
    }
    return false;
  }

  bool _matchParameterTypes(
    List<String> expectedTypes,
    FormalParameterList parameters,
  ) {
    if (parameters.parameters.length != expectedTypes.length) {
      return false;
    }

    for (var i = 0; i < parameters.parameters.length; i++) {
      final parameter = parameters.parameters[i];
      final parameterType = parameter is SimpleFormalParameter
          ? parameter.type?.toString() ?? ''
          : '';

      if (parameterType != expectedTypes[i]) {
        return false;
      }
    }
    return true;
  }
}

class _FunctionSignature {
  const _FunctionSignature({
    required this.functionName,
    required this.parameterTypes,
  });
  final String functionName;
  final List<String> parameterTypes;
}
