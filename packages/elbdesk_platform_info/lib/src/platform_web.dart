import 'package:web/web.dart' as web;

String getUserAgent() => web.window.navigator.userAgent.toLowerCase();

int getMaxTouchPoints() => web.window.navigator.maxTouchPoints;

void setBodyBackgroundColor(String colorHex) {
  final body = web.document.body;
  if (body != null) {
    body.style.backgroundColor = colorHex;
    // Set vendor-prefixed properties for better compatibility
    body.style.setProperty('-webkit-background-color', colorHex);
    body.style.setProperty('-moz-background-color', colorHex);
  }
}