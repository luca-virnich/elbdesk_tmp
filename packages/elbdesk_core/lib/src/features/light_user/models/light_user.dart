import 'package:elbdesk_backend_core_client/elbdesk_backend_core_client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'light_user.freezed.dart';
part 'light_user.g.dart';

@freezed
class LightUser with _$LightUser {
  const factory LightUser({
    required String email,
    required String fullName,
    required String initials,
    required String imageUrl,
    required int userInfoId,
    required bool isActive,
    required int lightUserId,
  }) = _LightUser;

  const LightUser._();

  factory LightUser.fromJson(Map<String, Object?> json) =>
      _$LightUserFromJson(json);

  factory LightUser.fromDTO(LightUserDTO dto) {
    return LightUser(
      lightUserId: dto.id!,
      email: dto.email,
      fullName: dto.fullName,
      initials: dto.initials,
      imageUrl: dto.imageUrl,
      userInfoId: dto.userInfoId!,
      isActive: dto.isActive,
    );
  }

  LightUserDTO toDTO() {
    return LightUserDTO(
      id: lightUserId,
      email: email,
      fullName: fullName,
      initials: initials,
      imageUrl: imageUrl,
      userInfoId: userInfoId,
      isActive: isActive,
    );
  }
}
