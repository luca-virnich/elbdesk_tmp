// import 'package:elbdesk_core/elbdesk_core.dart';
// import 'package:elbdesk_ui/elbdesk_ui.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';

// /// @nodic
// class FloatingJsonTemplateTable extends HookWidget {
//   const FloatingJsonTemplateTable({required this.data, super.key});

//   final FloatingJsonTemplateTableWindowData data;

//   @override
//   Widget build(BuildContext context) {
//     final floatingWindowFocus = useFocusNode();
//     final l10n = context.l10n;
//     return FloatingWindow(
//       key: Key('floating-${data.floatingWindowId}'),
//       windowType: data.type,
//       windowId: data.floatingWindowId,
//       floatingWindowFocus: floatingWindowFocus,
//       child: CustomCard(
//         floatingWindowFocus: floatingWindowFocus,
//         iconData: AppIcons.json,
//         baseTitle: l10n.json_template_singular,
//         floatingWindowId: data.floatingWindowId,
//         childBuilder: (context, entityId, navigatorKey) => FloatingCardBody(
//           floatingWindowId: data.floatingWindowId,
//           navigatorKey: navigatorKey,
//           children: [
//             CardBodyItem(
//               child: const SelfScrollableCardItem(
//                 child: JsonTemplateTable(),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
