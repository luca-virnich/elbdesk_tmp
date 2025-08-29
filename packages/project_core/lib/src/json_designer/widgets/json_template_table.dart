// import 'package:elbdesk_core/elbdesk_core.dart';
// import 'package:elbdesk_core/src/features/json_designer/models/json_template.dart';
// import 'package:elbdesk_core/src/features/json_designer/repositories/json_template_repository.dart';
// import 'package:elbdesk_ui/elbdesk_ui.dart';
// import 'package:flutter/widgets.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// class JsonTemplateTable extends HookConsumerWidget {
//   const JsonTemplateTable({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final sessionId = useUuid();
//     final templates = ref.watch(fetchAllJsonTemplatesProvider(sessionId));
//     return templates.fastWhen(
//       data: (templates) => _Table(templates: templates),
//     );
//   }
// }

// class _Table extends ConsumerWidget {
//   const _Table({required this.templates});
//   final List<JsonTemplate> templates;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final l10n = context.l10n;
//     return Column(
//       children: [
//         CardSectionTitle(
//           title: l10n.json_template_plural,
//           setTrailingPadding: true,
//           trailingWidgets: [
//             AppButton.primary(
//               onPressed: () {
//                 ref.read(floatingWindowDataStateProvider.notifier).addWindow(
//                       FloatingJsonTemplateWindowData(id: null),
//                     );
//               },
//               tooltip: l10n.gen_add_entity(l10n.json_template_singular),
//               iconData: AppIcons.add,
//             ),
//           ],
//         ),
//         if (templates.isEmpty)
//           Align(
//             alignment: Alignment.centerLeft,
//             child: AppText(l10n.json_template_no_templates),
//           )
//         else
//           Expanded(
//             child: ListView.separated(
//               shrinkWrap: true,
//               itemCount: templates.length,
//               padding: const EdgeInsets.only(right: UiConstants.defaultPadding),
//               separatorBuilder: (context, index) =>
//                   const AppListViewSeperator.divider(),
//               itemBuilder: (context, index) {
//                 final template = templates[index];
//                 return AppListTile(
//                   titleText: template.name,
//                   onPressed: () {
//                     ref
//                         .read(floatingWindowDataStateProvider.notifier)
//                         .addWindow(
//                           FloatingJsonTemplateWindowData(
//                             id: template.id,
//                           ),
//                         );
//                   },
//                 );
//               },
//             ),
//           ),
//       ],
//     );
//   }
// }
