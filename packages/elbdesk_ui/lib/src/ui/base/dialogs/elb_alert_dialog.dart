// import 'dart:ui';

// import 'package:elbdesk_core/elbdesk_core.dart';
// import 'package:elbdesk_ui/elbdesk_ui.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';

// class ElbAlertDialog extends HookWidget {
//   const ElbAlertDialog({
//     this.child,
//     this.maxWidth,
//     this.maxHeight,
//     this.titleText,
//     this.titleIcon,
//     this.onCancel,
//     this.blockShortcuts = false,
//     this.onSaveAndCloseShortcut,
//     this.footer,
//     this.contentText,
//     this.isLoading = false,
//     this.hideCloseButton = false,
//     this.actions = const [],
//     this.insetPadding,
//     this.minWidth,
//     this.hideTitlebar = false,
//     this.blurBackground = false,
//     this.contentPadding,
//     super.key,
//   });

//   final Widget? child;
//   final double? maxWidth;
//   final double? maxHeight;
//   final String? titleText;
//   final IconData? titleIcon;
//   final VoidCallback? onCancel;
//   final bool blockShortcuts;
//   final VoidCallback? onSaveAndCloseShortcut;

//   final Widget? footer;
//   final bool isLoading;

//   final String? contentText;
//   final bool hideCloseButton;
//   final List<Widget>? actions;
//   final double? minWidth;
//   final bool hideTitlebar;
//   final bool blurBackground;
//   final EdgeInsets? contentPadding;
//   final EdgeInsets? insetPadding;

//   @override
//   Widget build(BuildContext context) {
//     return ElbDialog(
//       floatingWindowId: null,
//       minWidth: minWidth,
//       hideCloseButton: hideCloseButton,
//       title: titleText,
//       actions: actions,
//       maxWidth: maxWidth ?? 400,
//       maxHeight: maxHeight,
//       contentPadding: contentPadding,
//       hideTitlebar: hideTitlebar,
//       onCancel: onCancel,
//       onSaveAndCloseShortcut: onSaveAndCloseShortcut,
//       footer: footer,
//       isLoading: isLoading,
//       blockShortcuts: blockShortcuts,
//       dialogMode: ElbDialogMode.normal,
//       child: child ?? AppText(contentText ?? ''),
//     );

//     final inWindowFocus = useFocusNode(debugLabel: 'uncontrolled Window Focus');

//     final generalColors = context.appTheme.generalColors;

//     final effectiveContentPadding =
//         contentPadding ?? const EdgeInsets.all(UiConstants.defaultPadding);
//     // return const Text('test');

//     double geteffetctiveMaxWidth() {
//       if (minWidth == null) {
//         return maxWidth ?? 400;
//       } else {
//         return (maxWidth ?? 400.0).clamp(minWidth!, double.infinity);
//       }
//     }

//     final dialog = Shortcuts(
//       shortcuts: {
//         if (!kIsWeb) closeWindowShortcutMeta: const CloseWindowIntent(),
//         closeWindowShortcutControl: const CloseWindowIntent(),
//         closeWindowShortcutAlt: const CloseWindowIntent(),
//         if (!kIsWeb)
//           saveAndCloseWindowShortcutMeta: const SaveAndCloseWindowIntent(),
//         saveAndCloseWindowShortcutControl: const SaveAndCloseWindowIntent(),
//         if (!kIsWeb) saveWindowShortcutMeta: const SaveWindowIntent(),
//         saveWindowShortcutControl: const SaveWindowIntent(),
//         LogicalKeySet(LogicalKeyboardKey.escape):
//             const CloseFloatingWindowDialogIntent(),
//       },
//       child: Actions(
//         actions: {
//           CloseWindowIntent: CallbackAction<CloseWindowIntent>(
//             onInvoke: (intent) async {
//               if (blockShortcuts) {
//                 return null;
//               }

//               if (onCancel == null) {
//                 Navigator.of(context).pop();
//               } else {
//                 onCancel?.call();
//               }
//               return null;
//             },
//           ),
//           SaveAndCloseWindowIntent: CallbackAction<SaveAndCloseWindowIntent>(
//             onInvoke: (intent) async {
//               if (blockShortcuts) {
//                 return null;
//               }
//               if (onSaveAndCloseShortcut != null) {
//                 onSaveAndCloseShortcut!.call();
//                 return;
//               }
//               Navigator.of(context).pop();
//               return null;
//             },
//           ),
//           SaveWindowIntent: CallbackAction<SaveWindowIntent>(
//             onInvoke: (intent) async {
//               return null;
//             },
//           ),
//           CloseFloatingWindowDialogIntent:
//               CallbackAction<CloseFloatingWindowDialogIntent>(
//             onInvoke: (intent) async {
//               if (blockShortcuts) return null;
//               Navigator.of(context).pop();
//               return null;
//             },
//           ),
//         },
//         child: Focus(
//           autofocus: true,
//           skipTraversal: true,
//           focusNode: inWindowFocus,
//           child: Dialog(
//             alignment: Alignment.topCenter,
//             insetPadding: insetPadding ??
//                 const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
//             child: LayoutBuilder(
//               builder: (context, constraints) {
//                 final effectiveMaxHeight = maxHeight != null
//                     ? maxHeight!.clamp(0.0, constraints.maxHeight)
//                     : constraints.maxHeight;

//                 return Container(
//                   constraints: BoxConstraints(
//                     maxWidth: geteffetctiveMaxWidth(),
//                     maxHeight: effectiveMaxHeight,
//                     minWidth: minWidth ?? 0,
//                   ),
//                   clipBehavior: Clip.hardEdge,
//                   decoration: BoxDecoration(
//                     color: generalColors.background,
//                     borderRadius: BorderRadius.circular(
//                       context.appTheme.borderRadiuses.m,
//                     ),
//                     border: Border.all(
//                       color: generalColors.primarySurfaceBorder,
//                       strokeAlign: BorderSide.strokeAlignOutside,
//                     ),
//                   ),
//                   child: FocusScope(
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       crossAxisAlignment: CrossAxisAlignment.stretch,
//                       children: [
//                         if (!hideTitlebar)
//                           AppWindowTitlebar(
//                             skipCloseButtonFocus: true,
//                             titleText: titleText,
//                             titleIconData: titleIcon,
//                             hideCloseButton: hideCloseButton,
//                             onClose: isLoading
//                                 ? null
//                                 : onCancel ?? () => Navigator.of(context).pop(),
//                           ),
//                         Flexible(
//                           child: SingleChildScrollView(
//                             padding: effectiveContentPadding,
//                             child: Column(
//                               mainAxisSize: MainAxisSize.min,
//                               crossAxisAlignment: CrossAxisAlignment.stretch,
//                               children: [
//                                 child ?? AppText(contentText ?? ''),
//                                 if (actions != null && actions!.isNotEmpty) ...[
//                                   const SizedBox(
//                                     height: UiConstants.defaultPadding * 1.5,
//                                   ),
//                                   AppWrap(
//                                     crossAxisAlignment: WrapCrossAlignment.end,
//                                     alignment: WrapAlignment.end,
//                                     children: actions!,
//                                   ),
//                                 ],
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ),
//       ),
//     );

//     if (blurBackground) {
//       return BackdropFilter(
//         filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
//         child: dialog,
//       );
//     }

//     return dialog;
//   }
// }
