// import 'package:elbdesk_core/elbdesk_core.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';

// /// @nodic
// class FloatingJsonTemplateCard extends HookWidget {
//   const FloatingJsonTemplateCard({required this.data, super.key});

//   final FloatingJsonTemplateWindowData data;

//   @override
//   Widget build(BuildContext context) {
//     final floatingWindowFocus = useFocusNode();
//     return FloatingWindow(
//       key: Key('floating-${data.floatingWindowId}'),
//       windowType: data.type,
//       windowId: data.floatingWindowId,
//       floatingWindowFocus: floatingWindowFocus,
//       child: JsonTemplateCard(
//         id: data.id,
//         floatingWindowId: data.floatingWindowId,
//         floatingWindowFocus: floatingWindowFocus,
//       ),
//     );
//   }
// }
