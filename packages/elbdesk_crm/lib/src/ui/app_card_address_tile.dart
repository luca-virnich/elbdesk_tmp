import 'package:elbdesk_crm/src/ui/address_communication_tile_content.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';

enum _Type {
  addressOnly,
  addressAndCommunication,
}

class AppCardAddressAndCommunicationTile extends StatelessWidget {
  const AppCardAddressAndCommunicationTile.addressOnly({
    required this.address,
    required this.titleOutsideCard,
    required this.readOnly,
    required this.onTitleInsideCardTap,
    required this.onEditTap,
    required this.titleInsideCard,
    this.onDelete,
    this.footer,
    this.onShiftPressed,
    super.key,
  })  : _type = _Type.addressOnly,
        communication = null;

  const AppCardAddressAndCommunicationTile.addressAndCommunication({
    required this.address,
    required this.communication,
    required this.titleOutsideCard,
    required this.readOnly,
    required this.onTitleInsideCardTap,
    required this.onEditTap,
    required this.titleInsideCard,
    this.onShiftPressed,
    this.onDelete,
    this.footer,
    super.key,
  }) : _type = _Type.addressAndCommunication;

  final _Type _type;

  final ContactAddress? address;
  final ContactCommunication? communication;
  final String? titleOutsideCard;
  final bool readOnly;
  final String titleInsideCard;
  final VoidCallback onTitleInsideCardTap;
  final VoidCallback? onEditTap;
  final VoidCallback? onDelete;
  final VoidCallback? onShiftPressed;
  final Widget? footer;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (titleOutsideCard != null)
          Padding(
            padding: UiConstants.cardFieldPadding,
            child: Align(
              alignment: Alignment.centerLeft,
              child: AppText(
                titleOutsideCard!,
                textAlign: TextAlign.left,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        AppCardTile(
          onTitleShiftPressed: onShiftPressed,
          title: titleInsideCard,
          onTitleTap: onTitleInsideCardTap,
          onDelete: onDelete,
          trailing: [
            if (onEditTap != null)
              AppIconButton.secondary(
                icon: const Icon(AppIcons.edit),
                onPressed: readOnly ? null : onEditTap,
              ),
          ],
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              switch (_type) {
                _Type.addressOnly => AddressCommunicationTileContent(
                    address: address?.address,
                    address2: address?.address2,
                    address3: address?.address3,
                    postCode: address?.postCode,
                    city: address?.city,
                    country: address?.countryCode?.name,
                    mobileNumber: null,
                    phoneNumber: null,
                    email: null,
                  ),
                _Type.addressAndCommunication =>
                  AddressCommunicationTileContent(
                    address: address?.address,
                    address2: address?.address2,
                    address3: address?.address3,
                    postCode: address?.postCode,
                    city: address?.city,
                    country: address?.countryCode?.name,
                    mobileNumber: communication?.mobile,
                    phoneNumber: communication?.phone,
                    email: communication?.email,
                  ),
              },
              if (footer != null) footer!,
            ],
          ),
        ),
      ],
    );
  }
}
