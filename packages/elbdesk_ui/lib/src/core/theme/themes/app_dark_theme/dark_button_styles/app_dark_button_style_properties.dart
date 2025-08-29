part of 'app_dark_button_styles.dart';

final _primaryButtonStyle = AppButtonStyleProperties(
  backgroundColor: const Color(0xff4493f8),
  foregroundColor: AppColorPalette.neutral100,
  borderRadius: 4,
  shadowColor: AppColorPalette.withOpacity(
    AppColorPalette.white,
    0.12,
  ),
  overlayColor: AppColorPalette.withOpacity(AppColorPalette.white, 0.08),
  borderColor: AppColorPalette.blue700,
  borderColorDisabled: AppColorPalette.neutral600,
  foregroundColorDisabled: AppColorPalette.neutral500,
  foregroundColorOnHover: AppColorPalette.white,
  borderColorOnHover: AppColorPalette.blue700,
  backgroundColorDisabled: AppColorPalette.neutral700,
  elevation: 0,
);

final _secondaryButtonStyle = AppButtonStyleProperties(
  backgroundColor: AppColorPalette.neutral700,
  foregroundColor: AppColorPalette.white,
  borderRadius: 4,
  shadowColor: AppColorPalette.transparent,
  overlayColor: AppColorPalette.withOpacity(AppColorPalette.white, 0.08),
  borderColor: AppColorPalette.neutral600,
  borderColorDisabled: AppColorPalette.neutral600,
  foregroundColorDisabled: AppColorPalette.neutral500,
  foregroundColorOnHover: AppColorPalette.white,
  borderColorOnHover: AppColorPalette.neutral600,
  backgroundColorDisabled: AppColorPalette.neutral700,
  elevation: 0,
);

const _textButtonStyle = AppButtonStyleProperties(
  backgroundColor: AppColorPalette.transparent,
  foregroundColor: AppColorPalette.slate200,
  borderRadius: 4,
  shadowColor: AppColorPalette.transparent,
  overlayColor: AppColorPalette.transparent,
  borderColor: AppColorPalette.transparent,
  borderColorDisabled: AppColorPalette.transparent,
  foregroundColorDisabled: AppColorPalette.neutral600,
  foregroundColorOnHover: AppColorPalette.slate400,
  borderColorOnHover: AppColorPalette.transparent,
  backgroundColorDisabled: AppColorPalette.transparent,
  elevation: 0,
);

const _dangerButtonStyle = AppButtonStyleProperties(
  backgroundColor: AppColorPalette.neutral700,
  foregroundColor: AppColorPalette.rose500,
  borderRadius: 4,
  shadowColor: AppColorPalette.transparent,
  overlayColor: AppColorPalette.rose500,
  borderColor: AppColorPalette.neutral600,
  borderColorDisabled: AppColorPalette.neutral600,
  foregroundColorDisabled: AppColorPalette.neutral600,
  foregroundColorOnHover: AppColorPalette.white,
  borderColorOnHover: AppColorPalette.red500,
  backgroundColorDisabled: AppColorPalette.neutral700,
  elevation: 0,
);

final _blankButtonStyle = AppButtonStyleProperties(
  backgroundColor: AppColorPalette.transparent,
  foregroundColor: const Color(0xff4493f8),
  borderRadius: 4,
  shadowColor: AppColorPalette.transparent,
  overlayColor: AppColorPalette.transparent,
  borderColor: AppColorPalette.transparent,
  borderColorDisabled: AppColorPalette.transparent,
  foregroundColorDisabled:
      AppColorPalette.withOpacity(AppColorPalette.blue600, 0.38),
  foregroundColorOnHover: AppColorPalette.blue600,
  borderColorOnHover: AppColorPalette.transparent,
  backgroundColorDisabled: AppColorPalette.transparent,
  elevation: 0,
);

final _outlineButtonStyle = AppButtonStyleProperties(
  backgroundColor: AppColorPalette.transparent,
  foregroundColor: AppColorPalette.white,
  borderRadius: 4,
  shadowColor: AppColorPalette.transparent,
  overlayColor: AppColorPalette.withOpacity(AppColorPalette.white, 0.1),
  borderColor: AppColorPalette.white,
  borderColorDisabled: AppColorPalette.neutral600,
  foregroundColorDisabled: AppColorPalette.neutral600,
  foregroundColorOnHover: AppColorPalette.white,
  borderColorOnHover: AppColorPalette.white,
  backgroundColorDisabled: AppColorPalette.transparent,
  elevation: 0,
);

const _dangerTextButtonStyle = AppButtonStyleProperties(
  backgroundColor: AppColorPalette.transparent,
  foregroundColor: AppColorPalette.red500,
  borderRadius: 4,
  shadowColor: AppColorPalette.transparent,
  overlayColor: AppColorPalette.transparent,
  borderColor: AppColorPalette.transparent,
  borderColorDisabled: AppColorPalette.transparent,
  foregroundColorDisabled: AppColorPalette.neutral600,
  foregroundColorOnHover: AppColorPalette.red400,
  borderColorOnHover: AppColorPalette.transparent,
  backgroundColorDisabled: AppColorPalette.transparent,
  elevation: 0,
);

final _addEntityInCardButtonStyle = AppButtonStyleProperties(
  backgroundColor: AppColorPalette.transparent,
  foregroundColor: AppColorPalette.neutral200,
  borderRadius: 30,
  shadowColor: AppColorPalette.transparent,
  overlayColor: AppColorPalette.withOpacity(AppColorPalette.white, 0.1),
  borderColor: AppColorPalette.neutral400,
  borderColorDisabled: AppColorPalette.neutral600,
  foregroundColorDisabled: AppColorPalette.neutral600,
  foregroundColorOnHover: AppColorPalette.white,
  borderColorOnHover: AppColorPalette.neutral400,
  backgroundColorDisabled: AppColorPalette.transparent,
  elevation: 0,
);

final _checkboxButtonStyle = AppButtonStyleProperties(
  backgroundColor: AppColorPalette.transparent,
  foregroundColor: appDarkGeneralColors.onBackground,
  borderRadius: 4,
  shadowColor: AppColorPalette.transparent,
  overlayColor: AppColorPalette.transparent,
  borderColor: appDarkGeneralColors.primarySurfaceBorder,
  borderColorDisabled: AppColorPalette.neutral600,
  foregroundColorDisabled: AppColorPalette.neutral600,
  foregroundColorOnHover: AppColorPalette.white,
  borderColorOnHover: appDarkGeneralColors.primary,
  backgroundColorDisabled: AppColorPalette.transparent,
  elevation: 0,
);
