import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/src/department_code/models/department_code.dart';

final List<DepartmentCode> allDepartmentCodesForSetup = [
  /// Graphic design and artwork editing
  DepartmentCode(
    code: 'MOP',
    description: 'Media Operation',
    meta: DataMeta.initial(),
  ),

  /// Order and Customer Management
  DepartmentCode(
    code: 'AV',
    description: 'Auftragsverarbeitung',
    meta: DataMeta.initial(),
  ),

  /// Marketing
  DepartmentCode(
    code: 'MRKT',
    description: 'Marketing',
    meta: DataMeta.initial(),
  ),
];
