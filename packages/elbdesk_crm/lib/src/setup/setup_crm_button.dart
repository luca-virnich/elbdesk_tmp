import 'package:elbdesk_crm/src/country_code/logic/country_code_provider.dart';
import 'package:elbdesk_crm/src/department_code/logic/department_code_provider.dart';
import 'package:elbdesk_crm/src/language_code/logic/language_code_provider.dart';
import 'package:elbdesk_crm/src/payment_code/logic/payment_code_provider.dart';
import 'package:elbdesk_crm/src/salutation_code/logic/salutation_code_provider.dart';
import 'package:elbdesk_crm/src/shipping_method/_export_shipping_method.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SetupCRMButton extends HookConsumerWidget {
  const SetupCRMButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = useState<bool>(false);
    return AppButton.danger(
      label: 'Setup CRM',
      isLoading: isLoading.value,
      onPressed: () async {
        isLoading.value = true;
        try {
          await Future.wait([
            // setup initial country codes
            ref.read(countryCodeRepositoryProvider).initialSetup(),
            // setup initial language codes
            ref.read(languageCodeRepositoryProvider).initialSetup(),
            // setup initial payment codes
            ref.read(paymentCodeRepositoryProvider).initialSetup(),
            // setup initial salutation codes
            ref.read(salutationCodeRepositoryProvider).initialSetup(),
            // setup initial department codes
            ref.read(departmentCodeRepositoryProvider).initialSetup(),
            // setup initial shipping methods
            ref.read(shippingMethodRepositoryProvider).initialSetup(),
          ]);
        } catch (e) {
          if (context.mounted) {
            AppNotificationOverlay.error(
              context,
              e.toString(),
            );
          }
        } finally {
          if (context.mounted) {
            isLoading.value = false;
          }
        }
      },
    );
  }
}
