// This is the entrypoint of our custom linter
import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:elbdesk_lints/src/assists/convert_positional_to_named_formal.dart';
import 'package:elbdesk_lints/src/lints/avoid_flutter_material_import.dart';
import 'package:elbdesk_lints/src/lints/avoid_multiple_positional_parameters.dart';
import 'package:elbdesk_lints/src/lints/class_docs_lint.dart';
import 'package:elbdesk_lints/src/lints/method_docs_lint.dart';
import 'package:elbdesk_lints/src/lints/no_flutter_material_import.dart';
import 'package:elbdesk_lints/src/lints/use_design_system_item.dart';

PluginBase createPlugin() => _ElbDeskLinter();

/// A plugin class is used to list all the assists/lints defined by a plugin.
class _ElbDeskLinter extends PluginBase {
  /// We list all the custom warnings/infos/errors
  @override
  List<LintRule> getLintRules(CustomLintConfigs configs) => [
        const AvoidFlutterMaterialImportLintRule(),
        const ClassDocsLintRule(),
        // const ConstructorDocsLintRule(),
        const MethodDocsLintRule(),
        const NoFlutterMaterialImportLintRule(),
        const AvoidMultiplePositionalParametersRule(),
        ...UseDesignSystemItem.getRulesListFromConfigs(configs),
      ];

  @override
  List<Assist> getAssists() => [
        ConvertPositionalToNamedFormal(),
      ];
}
