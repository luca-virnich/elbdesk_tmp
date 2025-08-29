// TODO(all): Delete or refactor

// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';

// /// Creates and returns an [OverlayPortalController] using the Flutter Hooks
// /// pattern.
// ///
// /// This hook allows for the creation and management of an
// /// [OverlayPortalController] within a functional widget.
// ///
// /// The [debugLabel] parameter can be used to provide a descriptive label for
// /// debugging purposes.
// ///
// /// The [keys] parameter is a list of objects that uniquely identify this hook
// /// instance. If omitted, the hook will be considered to have no keys.
// ///
// /// {@tool snippet}
// ///
// /// ```dart
// /// final controller = useOverlayPortalController();
// ///
// /// return OverlayPortal(
// ///   controller: controller,
// ///   overlayChildBuilder: (BuildContext context) {
// ///     return const Text('Overlay Content');
// ///   },
// ///   child: ElevatedButton(
// ///     onPressed: () => controller.show(),
// ///     child: const Text('Show Overlay'),
// ///   ),
// /// );
// /// ```
// /// {@end-tool}
// ///
// /// See also:
// ///
// ///  * [OverlayPortalController], which this hook creates and manages.
// ///  * [OverlayPortal], a widget that uses [OverlayPortalController] to manage
// /// overlay entries.
// OverlayPortalController useOverlayPortalController({
//   String? debugLabel,
//   List<Object?>? keys,
// }) {
//   return use(
//     _OverlayPortalControllerHook(
//       debugLabel: debugLabel,
//       keys: keys,
//     ),
//   );
// }

// class _OverlayPortalControllerHook extends Hook<OverlayPortalController> {
//   const _OverlayPortalControllerHook({
//     this.debugLabel,
//     super.keys,
//   });

//   final String? debugLabel;

//   @override
//   HookState<OverlayPortalController, Hook<OverlayPortalController>>
//       createState() => _OverlayPortalControllerHookState();
// }

// class _OverlayPortalControllerHookState
//   extends HookState<OverlayPortalController, _OverlayPortalControllerHook> {
//   late final controller = OverlayPortalController();

//   @override
//   OverlayPortalController build(BuildContext context) => controller;

//   @override
//   String get debugLabel => 'useOverlayPortalController';
// }
