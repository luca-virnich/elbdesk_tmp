import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/src/salutation_code/models/salutation_code.dart';

final List<SalutationCode> allSalutationCodesForSetup = [
  SalutationCode(
    meta: DataMeta.initial(),
    code: 'MR',
    description: 'Herr',
    isPrimaryPerson: true,
    isPrimaryCompany: false,
  ),
  SalutationCode(
    meta: DataMeta.initial(),
    code: 'MRS',
    description: 'Frau',
    isPrimaryPerson: false,
    isPrimaryCompany: false,
  ),
  SalutationCode(
    meta: DataMeta.initial(),
    code: 'FIRMA',
    description: 'Firma',
    isPrimaryPerson: false,
    isPrimaryCompany: true,
  ),
];
