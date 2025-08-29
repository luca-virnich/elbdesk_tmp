import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations.dart';

extension InvoiceDeliveryMethodExt on InvoiceDeliveryMethod {
  String readable(ElbCrmLocalizations crmL10n) {
    return switch (this) {
      InvoiceDeliveryMethod.post => crmL10n.customer_invoice_method_post,
      InvoiceDeliveryMethod.email => crmL10n.customer_invoice_method_email,
    };
  }
}
