import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class CloseWindowIntent extends Intent {
  const CloseWindowIntent();
}

class SaveAndCloseWindowIntent extends Intent {
  const SaveAndCloseWindowIntent();
}

class SaveWindowIntent extends Intent {
  const SaveWindowIntent();
}

class EntityCardNavUpIntent extends Intent {
  const EntityCardNavUpIntent();
}

class EntityCardNavDownIntent extends Intent {
  const EntityCardNavDownIntent();
}

class SendChatMessageIntent extends Intent {
  const SendChatMessageIntent();
}

class NewLineIntent extends Intent {
  const NewLineIntent();
}

class WindowManagerIntent extends Intent {
  const WindowManagerIntent();
}

class SuggestIntent extends Intent {
  const SuggestIntent();
}

final closeWindowShortcutMeta = LogicalKeySet(
  LogicalKeyboardKey.meta,
  LogicalKeyboardKey.keyW,
);

final entityCardNavUpMeta = LogicalKeySet(
  LogicalKeyboardKey.meta,
  LogicalKeyboardKey.arrowUp,
);

final windowManagerMeta = LogicalKeySet(
  LogicalKeyboardKey.altLeft,
  LogicalKeyboardKey.tab,
);
final windowManagerControl = LogicalKeySet(
  LogicalKeyboardKey.controlLeft,
  LogicalKeyboardKey.tab,
);
final entityCardNavDownMeta = LogicalKeySet(
  LogicalKeyboardKey.meta,
  LogicalKeyboardKey.arrowDown,
);

final entityCardNavUpControl = LogicalKeySet(
  LogicalKeyboardKey.control,
  LogicalKeyboardKey.arrowUp,
);

final entityCardNavDownControl = LogicalKeySet(
  LogicalKeyboardKey.control,
  LogicalKeyboardKey.arrowDown,
);

final globalMenuShortcutMeta = LogicalKeySet(
  LogicalKeyboardKey.meta,
  LogicalKeyboardKey.keyK,
);

final globalMenuShortcutControl = LogicalKeySet(
  LogicalKeyboardKey.control,
  LogicalKeyboardKey.keyK,
);

final suggestShortcutMeta = LogicalKeySet(
  LogicalKeyboardKey.meta,
  LogicalKeyboardKey.keyI,
);
final suggestShortcutControl = LogicalKeySet(
  LogicalKeyboardKey.control,
  LogicalKeyboardKey.keyI,
);

final closeWindowShortcutControl = LogicalKeySet(
  LogicalKeyboardKey.control,
  LogicalKeyboardKey.keyW,
);

final closeWindowShortcutAlt = LogicalKeySet(
  LogicalKeyboardKey.alt,
  LogicalKeyboardKey.keyW,
);

final saveAndCloseWindowShortcutMeta = LogicalKeySet(
  LogicalKeyboardKey.meta,
  LogicalKeyboardKey.enter,
);

final saveAndCloseWindowShortcutControl = LogicalKeySet(
  LogicalKeyboardKey.control,
  LogicalKeyboardKey.enter,
);

final saveWindowShortcutMeta = LogicalKeySet(
  LogicalKeyboardKey.meta,
  LogicalKeyboardKey.keyS,
);

final saveWindowShortcutControl = LogicalKeySet(
  LogicalKeyboardKey.control,
  LogicalKeyboardKey.keyS,
);

final newLineShortcut = LogicalKeySet(
  LogicalKeyboardKey.shift,
  LogicalKeyboardKey.enter,
);

final f2searchCustomerNumberShortcut = LogicalKeySet(
  LogicalKeyboardKey.f2,
);

final f3searchCustomerNameShortcut = LogicalKeySet(
  LogicalKeyboardKey.f3,
);
