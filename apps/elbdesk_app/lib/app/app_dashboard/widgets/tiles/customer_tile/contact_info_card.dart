import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/elbdesk_crm.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

// TODO(mh): Make more beautiful
// The clickable button that opens the FloatingWindow could probably also be
// in the title of the ContactCard instead of the header row of the dashboard
// tile
// Also this is currently not reactive to changes in the contact data

/// Displays detailed contact information
class ContactInfoCard extends StatelessWidget {
  const ContactInfoCard({
    required this.contact,
    required this.tileWidth,
    super.key,
  });

  /// The contact details to display
  final Contact contact;

  /// Width allocated to the widget
  final double tileWidth;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final generalColors = context.appTheme.generalColors;
    final borderRadiuses = context.appTheme.borderRadiuses;

    final address = contact.address;

    return Container(
      padding: const EdgeInsets.all(UiConstants.defaultPadding),
      margin: const EdgeInsets.symmetric(vertical: AppSpace.xs),
      decoration: BoxDecoration(
        color: generalColors.primarySurface,
        border: Border.all(
          color: generalColors.primarySurfaceBorder,
        ),
        borderRadius: BorderRadius.circular(borderRadiuses.m),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row
          Row(
            children: [
              ElbIcon(
                contact.isCompany ? AppIcons.company : AppIcons.person,
                size: AppIconSize.l,
              ),
              const SizedBox(width: AppSpace.s),
              // Name
              AppText(
                contact.general.name,
                maxLines: 1,
                style: context.appTheme.textStyles.h3,
              ),
            ],
          ),
          const SizedBox(height: AppSpace.s),
          const AppDivider(),
          const SizedBox(height: AppSpace.s),

          // Postal code and city if available
          if (address.postCode.isNotEmpty || address.city.isNotEmpty)
            AppText(
              (address.postCode.isEmpty ? '' : '${address.postCode} ') +
                  address.city,
              maxLines: 1,
            )
          else
            const AppText(''),

          // Full address if available
          if (address.address.isNotEmpty)
            AppText(
              address.address,
              maxLines: 1,
            )
          else
            const AppText(''),

          const SizedBox(height: AppSpace.s),

          // TODO(all): Use UrlLauncherHelper as soon as its available here

          // Contact action for phone call
          _ActionRow(
            icon: const ElbIcon(AppIcons.phone),
            tooltip: l10n.gen_call,
            displayText: contact.communication.phone,
            onPressed: !AppValidator.isValidPhoneNumber(
              contact.communication.phone,
            )
                ? null
                : () {
                    UriLauncher.launchPhoneNumber(
                      contact.communication.phone,
                    );
                  },
          ),
          const SizedBox(height: AppSpace.s),

          // Contact action for opening the website
          _ActionRow(
            icon: const ElbIcon(AppIcons.website),
            tooltip: l10n.gen_open_website,
            displayText: contact.communication.website,
            onPressed: !AppValidator.isValidUrl(
              contact.communication.website,
            )
                ? null
                : () {
                    UriLauncher.launchInBrowser(contact.communication.website);
                  },
          ),
          const SizedBox(height: AppSpace.s),

          // Contact action for sending an email
          _ActionRow(
            icon: const ElbIcon(AppIcons.email),
            tooltip: l10n.gen_send_email,
            displayText: contact.communication.email,
            onPressed: !AppValidator.isValidEmail(
              contact.communication.email,
            )
                ? null
                : () {
                    UriLauncher.launchEmail(contact.communication.email);
                  },
          ),
        ],
      ),
    );
  }
}

/// A row widget that displays an action button with an associated text
class _ActionRow extends StatelessWidget {
  const _ActionRow({
    required this.icon,
    required this.tooltip,
    required this.displayText,
    this.onPressed,
  });

  final Widget icon;

  final String tooltip;

  final String displayText;

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppButton.secondary(
          icon: icon,
          tooltip: tooltip,
          onPressed: onPressed,
        ),
        const SizedBox(width: AppSpace.s),
        Expanded(
          child: AppText(
            displayText,
            maxLines: 1,
          ),
        ),
      ],
    );
  }
}
