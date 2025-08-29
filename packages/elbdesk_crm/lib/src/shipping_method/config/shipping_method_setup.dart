import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/src/shipping_method/models/shipping_method.dart';

final List<ShippingMethod> allShippingMethodsForSetup = [
  ShippingMethod(
    code: 'GO',
    description: 'GO Standard',
    isActive: true,
    meta: DataMeta.initial(),
  ),
  ShippingMethod(
    code: 'GO_TERMIN',
    description: 'GO Termin',
    isActive: true,
    meta: DataMeta.initial(),
  ),
  ShippingMethod(
    code: 'NSE_REGULAR',
    description: 'NSE Regular',
    isActive: true,
    meta: DataMeta.initial(),
  ),
  ShippingMethod(
    code: 'UPS',
    description: 'UPS Standard',
    isActive: true,
    meta: DataMeta.initial(),
  ),
  ShippingMethod(
    code: 'UPS_SAFER',
    description: 'UPS Safer',
    isActive: true,
    meta: DataMeta.initial(),
  ),
  ShippingMethod(
    code: 'LITERAL5',
    description: 'Literal 5',
    isActive: true,
    meta: DataMeta.initial(),
  ),
  ShippingMethod(
    code: 'DHL',
    description: 'DHL Standard',
    isActive: true,
    meta: DataMeta.initial(),
  ),
  ShippingMethod(
    code: 'DHL_EXPRESS',
    description: 'DHL Express',
    isActive: true,
    meta: DataMeta.initial(),
  ),
  ShippingMethod(
    code: 'PICKUP',
    description: 'Selbstabholung',
    isActive: true,
    meta: DataMeta.initial(),
  ),
];
