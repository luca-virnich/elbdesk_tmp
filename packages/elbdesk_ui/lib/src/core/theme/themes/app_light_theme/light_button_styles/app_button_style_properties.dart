part of 'app_light_button_styles.dart';

final _primaryButtonStyle = AppButtonStyleProperties(
  backgroundColor: AppColorPalette.blue600,
  foregroundColor: AppColorPalette.neutral100,
  borderRadius: 4,
  shadowColor: AppColorPalette.withOpacity(
    AppColorPalette.black,
    0.12,
  ),
  overlayColor: AppColorPalette.withOpacity(
    AppColorPalette.black,
    0.08,
  ),
  borderColor: AppColorPalette.blue700,
  borderColorDisabled: AppColorPalette.slate300,
  foregroundColorDisabled: AppColorPalette.slate400,
  foregroundColorOnHover: AppColorPalette.white,
  borderColorOnHover: AppColorPalette.blue700,
  backgroundColorDisabled: AppColorPalette.slate200,
  elevation: 0,
);

final _secondaryButtonStyle = AppButtonStyleProperties(
  backgroundColor: AppColorPalette.slate100,
  foregroundColor: AppColorPalette.slate500,
  borderRadius: 4,
  shadowColor: AppColorPalette.transparent,
  overlayColor: AppColorPalette.withOpacity(
    AppColorPalette.black,
    0.08,
  ),
  borderColor: AppColorPalette.slate300,
  borderColorDisabled: AppColorPalette.slate300,
  foregroundColorDisabled: AppColorPalette.slate400,
  foregroundColorOnHover: AppColorPalette.slate700,
  borderColorOnHover: AppColorPalette.slate400,
  backgroundColorDisabled: AppColorPalette.slate200,
  elevation: 0,
);

const _textButtonStyle = AppButtonStyleProperties(
  backgroundColor: AppColorPalette.transparent,
  foregroundColor: AppColorPalette.slate500,
  borderRadius: 4,
  shadowColor: AppColorPalette.transparent,
  overlayColor: AppColorPalette.transparent,
  borderColor: AppColorPalette.transparent,
  borderColorDisabled: AppColorPalette.transparent,
  foregroundColorDisabled: AppColorPalette.slate300,
  foregroundColorOnHover: AppColorPalette.slate700,
  borderColorOnHover: AppColorPalette.transparent,
  backgroundColorDisabled: AppColorPalette.transparent,
  elevation: 0,
);

const _dangerButtonStyle = AppButtonStyleProperties(
  backgroundColor: AppColorPalette.slate100,
  foregroundColor: AppColorPalette.red700,
  borderRadius: 4,
  shadowColor: AppColorPalette.transparent,
  overlayColor: AppColorPalette.red700,
  borderColor: AppColorPalette.slate300,
  borderColorDisabled: AppColorPalette.slate300,
  foregroundColorDisabled: AppColorPalette.slate300,
  foregroundColorOnHover: AppColorPalette.white,
  borderColorOnHover: AppColorPalette.red700,
  backgroundColorDisabled: AppColorPalette.slate200,
  elevation: 0,
);

const _blankButtonStyle = AppButtonStyleProperties(
  backgroundColor: AppColorPalette.transparent,
  foregroundColor: AppColorPalette.blue500,
  borderRadius: 4,
  shadowColor: AppColorPalette.transparent,
  overlayColor: AppColorPalette.transparent,
  borderColor: AppColorPalette.transparent,
  borderColorDisabled: AppColorPalette.transparent,
  foregroundColorDisabled: AppColorPalette.blue400,
  foregroundColorOnHover: AppColorPalette.blue600,
  borderColorOnHover: AppColorPalette.transparent,
  backgroundColorDisabled: AppColorPalette.transparent,
  elevation: 0,
);

const _outlineButtonStyle = AppButtonStyleProperties(
  backgroundColor: AppColorPalette.transparent,
  foregroundColor: AppColorPalette.neutral900,
  borderRadius: 4,
  shadowColor: AppColorPalette.transparent,
  overlayColor: AppColorPalette.transparent,
  borderColor: AppColorPalette.neutral900,
  borderColorDisabled: AppColorPalette.slate200,
  foregroundColorDisabled: AppColorPalette.slate300,
  foregroundColorOnHover: AppColorPalette.black,
  borderColorOnHover: AppColorPalette.neutral900,
  backgroundColorDisabled: AppColorPalette.transparent,
  elevation: 0,
);

const _dangerTextButtonStyle = AppButtonStyleProperties(
  backgroundColor: AppColorPalette.transparent,
  foregroundColor: AppColorPalette.red600,
  borderRadius: 4,
  shadowColor: AppColorPalette.transparent,
  overlayColor: AppColorPalette.transparent,
  borderColor: AppColorPalette.transparent,
  borderColorDisabled: AppColorPalette.transparent,
  foregroundColorDisabled: AppColorPalette.slate300,
  foregroundColorOnHover: AppColorPalette.red500,
  borderColorOnHover: AppColorPalette.transparent,
  backgroundColorDisabled: AppColorPalette.transparent,
  elevation: 0,
);

final _addEntityInCardButtonStyle = AppButtonStyleProperties(
  backgroundColor: AppColorPalette.transparent,
  foregroundColor: AppColorPalette.neutral600,
  borderRadius: 30,
  shadowColor: AppColorPalette.transparent,
  overlayColor: AppColorPalette.withOpacity(AppColorPalette.neutral900, 0.05),
  borderColor: AppColorPalette.neutral400,
  borderColorDisabled: AppColorPalette.slate200,
  foregroundColorDisabled: AppColorPalette.slate300,
  foregroundColorOnHover: AppColorPalette.neutral900,
  borderColorOnHover: AppColorPalette.neutral400,
  backgroundColorDisabled: AppColorPalette.transparent,
  elevation: 0,
);

final _checkboxButtonStyle = AppButtonStyleProperties(
  backgroundColor: AppColorPalette.transparent,
  foregroundColor: appLightGeneralColors.onBackground,
  borderRadius: 4,
  shadowColor: AppColorPalette.transparent,
  overlayColor: AppColorPalette.transparent,
  borderColor: AppColorPalette.slate300,
  borderColorDisabled: AppColorPalette.slate200,
  foregroundColorDisabled: AppColorPalette.slate300,
  foregroundColorOnHover: AppColorPalette.black,
  borderColorOnHover: appLightGeneralColors.primary,
  backgroundColorDisabled: AppColorPalette.transparent,
  elevation: 0,
);
