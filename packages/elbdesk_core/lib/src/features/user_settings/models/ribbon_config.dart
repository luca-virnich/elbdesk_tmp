import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ribbon_config.freezed.dart';

@freezed
class RibbonConfig with _$RibbonConfig {
  const factory RibbonConfig({
    required bool useSmallRibbons,
    required bool hideRibbons,
  }) = _RibbonConfig;

  factory RibbonConfig.initial() => const RibbonConfig(
        useSmallRibbons: true,
        hideRibbons: false,
      );

  const RibbonConfig._();

  factory RibbonConfig.fromDTO(UserRibbonConfigDTO dto) {
    return RibbonConfig(
      useSmallRibbons: dto.useSmallRibbons,
      hideRibbons: dto.hideRibbons,
    );
  }

  UserRibbonConfigDTO toDTO() {
    return UserRibbonConfigDTO(
      useSmallRibbons: useSmallRibbons,
      hideRibbons: hideRibbons,
    );
  }
}
