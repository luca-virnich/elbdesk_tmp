import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';

class AddressCommunicationTileContent extends StatelessWidget {
  const AddressCommunicationTileContent({
    required this.address,
    required this.address2,
    required this.address3,
    required this.postCode,
    required this.city,
    required this.country,
    required this.mobileNumber,
    required this.phoneNumber,
    required this.email,
    super.key,
    this.jobTitle,
    this.department,
  });

  final String? address;
  final String? address2;
  final String? address3;
  final String? postCode;
  final String? city;
  final String? country;
  final String? mobileNumber;
  final String? phoneNumber;
  final String? email;
  final String? jobTitle;
  final String? department;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Position and department
        if (jobTitle != null && jobTitle!.isNotEmpty ||
            department != null && department!.isNotEmpty)
          Column(
            children: [
              Row(
                children: [
                  if (jobTitle != null && jobTitle!.isNotEmpty) ...[
                    AppText(jobTitle!),
                    if (department != null && department!.isNotEmpty) ...[
                      const SizedBox(width: AppSpace.s),
                      const AppText('|'),
                      const SizedBox(width: AppSpace.s),
                    ],
                  ],
                  if (department != null && department!.isNotEmpty)
                    AppText(department!),
                ],
              ),
              const SizedBox(height: AppSpace.xs),
            ],
          ),
        // Address information
        if (address != null && address!.isNotEmpty) AppText(address!),
        if (address2 != null && address2!.isNotEmpty) AppText(address2!),
        if (address3 != null && address3!.isNotEmpty) AppText(address3!),
        if (postCode != null && postCode!.isNotEmpty ||
            city != null && city!.isNotEmpty)
          Row(
            children: [
              if (postCode != null && postCode!.isNotEmpty) ...[
                AppText(postCode!),
                if (city != null && city!.isNotEmpty)
                  const SizedBox(width: AppSpace.s),
              ],
              if (city != null && city!.isNotEmpty) AppText(city!),
            ],
          ),
        if (country != null && country!.isNotEmpty) AppText(country!),
        const SizedBox(height: AppSpace.m),

        // Communication details
        if (mobileNumber != null && mobileNumber!.isNotEmpty)
          AppMobilePhoneButton(
            mobileNumber: mobileNumber!,
          ),

        if (phoneNumber != null && phoneNumber!.isNotEmpty) ...[
          const SizedBox(height: AppSpace.s),
          AppPhoneButton(
            phoneNumber: phoneNumber!,
          ),
        ],

        if (email != null && email!.isNotEmpty) ...[
          const SizedBox(height: AppSpace.s),
          AppEmailButton(
            email: email!,
          ),
        ],
      ],
    );
  }
}
