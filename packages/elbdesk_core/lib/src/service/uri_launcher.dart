import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:url_launcher/url_launcher.dart';

/// Service for launching URLs
class UriLauncher {
  const UriLauncher._();

  /// Launches a URL in the default browser
  static Future<bool> launchInBrowser(String url) async {
    final uri = Uri.parse(url.startsWith('http') ? url : 'https://$url');
    return launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );
  }

  /// Launches a phone number
  static Future<bool> launchPhoneNumber(String phoneNumber) async {
    final clearedPhoneNumber = Parser.parsePhoneNumber(phoneNumber);
    final uri = Uri.parse('tel:$clearedPhoneNumber');
    return launchUrl(uri);
  }

  /// Launches an email client
  static Future<bool> launchEmail(String email) async {
    final uri = Uri.parse('mailto:$email');
    return launchUrl(uri);
  }

  /// Launch in external application
  static Future<bool> launchFileInExternalApplication(String filePath) async {
    final uri = Uri.file(filePath);
    return launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );
  }

  /// Opens a file path in the default system viewer
  static Future<bool> openFilePath(String filePath) async {
    try {
      return launchFileInExternalApplication(filePath);
    } catch (e) {
      throw ElbException(
        exceptionType: ElbExceptionType.fileOperationException,
        message: 'Failed to open file path'.hc,
      );
    }
  }

  /// Checks if URL can be launched
  static Future<bool> canLaunch(String url) async {
    final uri = Uri.parse(url);
    return canLaunchUrl(uri);
  }
}
