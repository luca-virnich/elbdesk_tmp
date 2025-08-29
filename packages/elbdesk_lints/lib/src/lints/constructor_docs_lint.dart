// class ConstructorDocsLintRule extends DartLintRule {
//   const ConstructorDocsLintRule() : super(code: _code);

//   static const _code = LintCode(
//     name: 'constructor_docs',
//     problemMessage: 'Missing documentation for the class constructor.',
//   );

//   @override
//   void run(
//     CustomLintResolver resolver,
//     ErrorReporter reporter,
//     CustomLintContext context,
//   ) {
//     context.registry.addClassDeclaration((node) {
//       for (final member in node.members) {
//         if (member is ConstructorDeclaration && !_isPrivateClass(node)) {
//           _checkDocstring(member, reporter);
//         }
//       }
//     });
//   }

//   bool _isPrivateClass(ClassDeclaration node) {
//     final element = node.declaredElement;
//     if (element == null) return false;
//     return element.isPrivate;
//   }

//   void _checkDocstring(ConstructorDeclaration node, ErrorReporter reporter) {
//     final comment = node.documentationComment;
//     if (comment == null || comment.tokens.isEmpty) {
//       if (node.name != null) {
//         reporter.atToken(node.name!, code);
//       }
//       reporter.reportErrorForName(code, node);
//     }
//   }
// }
