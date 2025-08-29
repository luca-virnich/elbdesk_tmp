import 'package:elbdesk_server/src/business/mailer/mailer.dart';
import 'package:serverpod/serverpod.dart';

extension MailerExtension on Serverpod {
  static Mailer? _mailer;

  Mailer get mailer {
    if (_mailer == null) {
      throw StateError('Mailer is not initialized. Call setMailer() first.');
    }
    return _mailer!;
  }

  void addMailer(Mailer mailer) {
    _mailer = mailer;
  }
}
