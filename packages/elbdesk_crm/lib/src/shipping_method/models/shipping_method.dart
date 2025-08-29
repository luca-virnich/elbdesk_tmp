import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'shipping_method.freezed.dart';
part 'shipping_method.g.dart';

@freezed
class ShippingMethod with _$ShippingMethod, HasMetaData {
  const factory ShippingMethod({
    required String code,
    required String description,
    required bool isActive,
    required DataMeta meta,
    int? id,
  }) = _ShippingMethod;

  const ShippingMethod._();

  factory ShippingMethod.fromJson(Map<String, Object?> json) =>
      _$ShippingMethodFromJson(json);

  /// Creates a [ShippingMethod] from a [ShippingMethodDTO]
  factory ShippingMethod.fromDTO(ShippingMethodDTO dto) {
    final dataMeta = DataMeta.fromDTO(dto);
    return ShippingMethod(
      id: dto.id,
      code: dto.code,
      description: dto.description,
      isActive: dto.isActive,
      meta: dataMeta,
    );
  }

  factory ShippingMethod.initial() => ShippingMethod(
        code: '',
        description: '',
        isActive: true,
        meta: DataMeta.initial(),
      );

  ShippingMethodDTO toDTO() => ShippingMethodDTO(
        code: code,
        description: description,
        isActive: isActive,
        createdAt: DateTime.now(),
        isDraft: meta.isDraft,
        id: id,
      );
}
