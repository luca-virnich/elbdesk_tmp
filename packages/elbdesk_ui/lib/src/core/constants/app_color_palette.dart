import 'package:flutter/material.dart';

/// A collection of colors using the OKLCH color space values
/// Converted from OKLCH to sRGB hex values for Flutter compatibility
/// We used https://tailwindcss.com/docs/customizing-colors as inspiration

class AppColorPalette {
  const AppColorPalette._();

  static Color withOpacity(Color color, double opacity) {
    assert(
      opacity >= 0.0 && opacity <= 1.0,
      'Opacity must be between 0.0 and 1.0',
    );
    return color.withValues(
      alpha: opacity,
    );
  }

  static const transparent = Colors.transparent;
  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF000000);

  // Red
  static const red50 = Color(0xFFFEF2F2);
  static const red100 = Color(0xFFFFE4E5);
  static const red200 = Color(0xFFFFCCD1);
  static const red300 = Color(0xFFFA9AA7);
  static const red400 = Color(0xFFF15B6C);
  static const red500 = Color(0xFFE02D41);
  static const red600 = Color(0xFFC41E32);
  static const red700 = Color(0xFFA11825);
  static const red800 = Color(0xFF84141E);
  static const red900 = Color(0xFF671016);
  static const red950 = Color(0xFF450A0C);

  // Orange
  static const orange50 = Color(0xFFFFF8ED);
  static const orange100 = Color(0xFFFFEBD4);
  static const orange200 = Color(0xFFFFD4A8);
  static const orange300 = Color(0xFFFFB77C);
  static const orange400 = Color(0xFFFF8F44);
  static const orange500 = Color(0xFFF76707);
  static const orange600 = Color(0xFFE85D00);
  static const orange700 = Color(0xFFC24D00);
  static const orange800 = Color(0xFF9A3E00);
  static const orange900 = Color(0xFF7C3200);
  static const orange950 = Color(0xFF431A03);

  // Amber
  static const amber50 = Color(0xFFFFFBEB);
  static const amber100 = Color(0xFFFEF3C7);
  static const amber200 = Color(0xFFFDE68A);
  static const amber300 = Color(0xFFFCD34D);
  static const amber400 = Color(0xFFFBBF24);
  static const amber500 = Color(0xFFF59E0B);
  static const amber600 = Color(0xFFD97706);
  static const amber700 = Color(0xFFB45309);
  static const amber800 = Color(0xFF92400E);
  static const amber900 = Color(0xFF78350F);
  static const amber950 = Color(0xFF451A03);

  // Yellow
  static const yellow50 = Color(0xFFFEFCE8);
  static const yellow100 = Color(0xFFFEF9C3);
  static const yellow200 = Color(0xFFFEF08A);
  static const yellow300 = Color(0xFFFDE047);
  static const yellow400 = Color(0xFFFACC15);
  static const yellow500 = Color(0xFFEAB308);
  static const yellow600 = Color(0xFFCA8A04);
  static const yellow700 = Color(0xFFA16207);
  static const yellow800 = Color(0xFF854D0E);
  static const yellow900 = Color(0xFF713F12);
  static const yellow950 = Color(0xFF422006);

  // Lime
  static const lime50 = Color(0xFFF7FEE7);
  static const lime100 = Color(0xFFECFCCB);
  static const lime200 = Color(0xFFD9F99D);
  static const lime300 = Color(0xFFBEF264);
  static const lime400 = Color(0xFFA3E635);
  static const lime500 = Color(0xFF84CC16);
  static const lime600 = Color(0xFF65A30D);
  static const lime700 = Color(0xFF4D7C0F);
  static const lime800 = Color(0xFF3F6212);
  static const lime900 = Color(0xFF365314);
  static const lime950 = Color(0xFF1A2E05);

  // Green
  static const green50 = Color(0xFFF0FDF4);
  static const green100 = Color(0xFFDCFCE7);
  static const green200 = Color(0xFFBBF7D0);
  static const green300 = Color(0xFF86EFAC);
  static const green400 = Color(0xFF4ADE80);
  static const green500 = Color(0xFF22C55E);
  static const green600 = Color(0xFF16A34A);
  static const green700 = Color(0xFF15803D);
  static const green800 = Color(0xFF166534);
  static const green900 = Color(0xFF14532D);
  static const green950 = Color(0xFF052E16);

  // Emerald
  static const emerald50 = Color(0xFFECFDF5);
  static const emerald100 = Color(0xFFD1FAE5);
  static const emerald200 = Color(0xFFA7F3D0);
  static const emerald300 = Color(0xFF6EE7B7);
  static const emerald400 = Color(0xFF34D399);
  static const emerald500 = Color(0xFF10B981);
  static const emerald600 = Color(0xFF059669);
  static const emerald700 = Color(0xFF047857);
  static const emerald800 = Color(0xFF065F46);
  static const emerald900 = Color(0xFF064E3B);
  static const emerald950 = Color(0xFF022C22);

  // Teal
  static const teal50 = Color(0xFFF0FDFA);
  static const teal100 = Color(0xFFCCFBF1);
  static const teal200 = Color(0xFF99F6E4);
  static const teal300 = Color(0xFF5EEAD4);
  static const teal400 = Color(0xFF2DD4BF);
  static const teal500 = Color(0xFF14B8A6);
  static const teal600 = Color(0xFF0D9488);
  static const teal700 = Color(0xFF0F766E);
  static const teal800 = Color(0xFF115E59);
  static const teal900 = Color(0xFF134E4A);
  static const teal950 = Color(0xFF042F2E);

  // Cyan
  static const cyan50 = Color(0xFFECFEFF);
  static const cyan100 = Color(0xFFCFFAFE);
  static const cyan200 = Color(0xFFA5F3FC);
  static const cyan300 = Color(0xFF67E8F9);
  static const cyan400 = Color(0xFF22D3EE);
  static const cyan500 = Color(0xFF06B6D4);
  static const cyan600 = Color(0xFF0891B2);
  static const cyan700 = Color(0xFF0E7490);
  static const cyan800 = Color(0xFF155E75);
  static const cyan900 = Color(0xFF164E63);
  static const cyan950 = Color(0xFF083344);

  // Sky
  static const sky50 = Color(0xFFF0F9FF);
  static const sky100 = Color(0xFFE0F2FE);
  static const sky200 = Color(0xFFBAE6FD);
  static const sky300 = Color(0xFF7DD3FC);
  static const sky400 = Color(0xFF38BDF8);
  static const sky500 = Color(0xFF0EA5E9);
  static const sky600 = Color(0xFF0284C7);
  static const sky700 = Color(0xFF0369A1);
  static const sky800 = Color(0xFF075985);
  static const sky900 = Color(0xFF0C4A6E);
  static const sky950 = Color(0xFF082F49);

  // Blue
  static const blue50 = Color(0xFFEFF6FF);
  static const blue100 = Color(0xFFDBEAFE);
  static const blue200 = Color(0xFFBFDBFE);
  static const blue300 = Color(0xFF93C5FD);
  static const blue400 = Color(0xFF60A5FA);
  static const blue500 = Color(0xFF3B82F6);
  static const blue600 = Color(0xFF2563EB);
  static const blue700 = Color(0xFF1D4ED8);
  static const blue800 = Color(0xFF1E40AF);
  static const blue900 = Color(0xFF1E3A8A);
  static const blue950 = Color(0xFF172554);

  // Indigo
  static const indigo50 = Color(0xFFEEF2FF);
  static const indigo100 = Color(0xFFE0E7FF);
  static const indigo200 = Color(0xFFC7D2FE);
  static const indigo300 = Color(0xFFA5B4FC);
  static const indigo400 = Color(0xFF818CF8);
  static const indigo500 = Color(0xFF6366F1);
  static const indigo600 = Color(0xFF4F46E5);
  static const indigo700 = Color(0xFF4338CA);
  static const indigo800 = Color(0xFF3730A3);
  static const indigo900 = Color(0xFF312E81);
  static const indigo950 = Color(0xFF1E1B4B);

  // Violet
  static const violet50 = Color(0xFFF5F3FF);
  static const violet100 = Color(0xFFEDE9FE);
  static const violet200 = Color(0xFFDDD6FE);
  static const violet300 = Color(0xFFC4B5FD);
  static const violet400 = Color(0xFFA78BFA);
  static const violet500 = Color(0xFF8B5CF6);
  static const violet600 = Color(0xFF7C3AED);
  static const violet700 = Color(0xFF6D28D9);
  static const violet800 = Color(0xFF5B21B6);
  static const violet900 = Color(0xFF4C1D95);
  static const violet950 = Color(0xFF2E1065);

  // Purple
  static const purple50 = Color(0xFFFAF5FF);
  static const purple100 = Color(0xFFF3E8FF);
  static const purple200 = Color(0xFFE9D5FF);
  static const purple300 = Color(0xFFD8B4FE);
  static const purple400 = Color(0xFFC084FC);
  static const purple500 = Color(0xFFA855F7);
  static const purple600 = Color(0xFF9333EA);
  static const purple700 = Color(0xFF7E22CE);
  static const purple800 = Color(0xFF6B21A8);
  static const purple900 = Color(0xFF581C87);
  static const purple950 = Color(0xFF3B0764);

  // Fuchsia
  static const fuchsia50 = Color(0xFFFDF4FF);
  static const fuchsia100 = Color(0xFFFAE8FF);
  static const fuchsia200 = Color(0xFFF5D0FE);
  static const fuchsia300 = Color(0xFFF0ABFC);
  static const fuchsia400 = Color(0xFFE879F9);
  static const fuchsia500 = Color(0xFFD946EF);
  static const fuchsia600 = Color(0xFFC026D3);
  static const fuchsia700 = Color(0xFFA21CAF);
  static const fuchsia800 = Color(0xFF86198F);
  static const fuchsia900 = Color(0xFF701A75);
  static const fuchsia950 = Color(0xFF4A044E);

  // Pink
  static const pink50 = Color(0xFFFDF2F8);
  static const pink100 = Color(0xFFFCE7F3);
  static const pink200 = Color(0xFFFBCFE8);
  static const pink300 = Color(0xFFF9A8D4);
  static const pink400 = Color(0xFFF472B6);
  static const pink500 = Color(0xFFEC4899);
  static const pink600 = Color(0xFFDB2777);
  static const pink700 = Color(0xFFBE185D);
  static const pink800 = Color(0xFF9D174D);
  static const pink900 = Color(0xFF831843);
  static const pink950 = Color(0xFF500724);

  // Rose
  static const rose50 = Color(0xFFFFF1F2);
  static const rose100 = Color(0xFFFFE4E6);
  static const rose200 = Color(0xFFFECDD3);
  static const rose300 = Color(0xFFFDA4AF);
  static const rose400 = Color(0xFFFB7185);
  static const rose500 = Color(0xFFF43F5E);
  static const rose600 = Color(0xFFE11D48);
  static const rose700 = Color(0xFFBE123C);
  static const rose800 = Color(0xFF9F1239);
  static const rose900 = Color(0xFF881337);
  static const rose950 = Color(0xFF4C0519);

  // Slate
  static const slate50 = Color(0xFFF8FAFC);
  static const slate100 = Color(0xFFF1F5F9);
  static const slate200 = Color(0xFFE2E8F0);
  static const slate300 = Color(0xFFCBD5E1);
  static const slate400 = Color(0xFF94A3B8);
  static const slate500 = Color(0xFF64748B);
  static const slate600 = Color(0xFF475569);
  static const slate700 = Color(0xFF334155);
  static const slate800 = Color(0xFF1E293B);
  static const slate900 = Color(0xFF0F172A);
  static const slate950 = Color(0xFF020617);

  // Gray
  static const gray50 = Color(0xFFF9FAFB);
  static const gray100 = Color(0xFFF3F4F6);
  static const gray200 = Color(0xFFE5E7EB);
  static const gray300 = Color(0xFFD1D5DB);
  static const gray400 = Color(0xFF9CA3AF);
  static const gray500 = Color(0xFF6B7280);
  static const gray600 = Color(0xFF4B5563);
  static const gray700 = Color(0xFF374151);
  static const gray800 = Color(0xFF1F2937);
  static const gray900 = Color(0xFF111827);
  static const gray950 = Color(0xFF030712);

  // Zinc
  static const zinc50 = Color(0xFFFAFAFA);
  static const zinc100 = Color(0xFFF4F4F5);
  static const zinc200 = Color(0xFFE4E4E7);
  static const zinc300 = Color(0xFFD4D4D8);
  static const zinc400 = Color(0xFFA1A1AA);
  static const zinc500 = Color(0xFF71717A);
  static const zinc600 = Color(0xFF52525B);
  static const zinc700 = Color(0xFF3F3F46);
  static const zinc800 = Color(0xFF27272A);
  static const zinc900 = Color(0xFF18181B);
  static const zinc950 = Color(0xFF09090B);

  // Neutral
  static const neutral50 = Color(0xFFFAFAFA);
  static const neutral100 = Color(0xFFF5F5F5);
  static const neutral200 = Color(0xFFE5E5E5);
  static const neutral300 = Color(0xFFD4D4D4);
  static const neutral350 = Color(0xFFBEBEBE);
  static const neutral400 = Color(0xFFA3A3A3);
  static const neutral500 = Color(0xFF737373);
  static const neutral600 = Color(0xFF525252);
  static const neutral700 = Color(0xFF404040);
  static const neutral750 = Color(0xFF333333);
  static const neutral800 = Color(0xFF262626);
  static const neutral850 = Color(0xFF1F1F1F);
  static const neutral900 = Color(0xFF171717);
  static const neutral950 = Color(0xFF0A0A0A);

  // Stone
  static const stone50 = Color(0xFFFAFAF9);
  static const stone100 = Color(0xFFF5F5F4);
  static const stone200 = Color(0xFFE7E5E4);
  static const stone300 = Color(0xFFD6D3D1);
  static const stone400 = Color(0xFFA8A29E);
  static const stone500 = Color(0xFF78716C);
  static const stone600 = Color(0xFF57534E);
  static const stone700 = Color(0xFF44403C);
  static const stone800 = Color(0xFF292524);
  static const stone900 = Color(0xFF1C1917);
  static const stone950 = Color(0xFF0C0A09);

  // Update Windows 11 specific colors with subtle blue tints
  static const win11BackgroundPrimary = Color(0xFF1B1D24);
  static const win11BackgroundSecondary = Color(0xFF171921);
  static const win11AccentBlue = Color.fromARGB(255, 11, 131, 223);
  static const win11AccentBlueDark = Color(0xFF005FB3);
  static const win11AccentBlueLight = Color(0xFF429CE3);
  static const win11Grey100 = Color(0xFFE6E7EA);
  static const win11Grey200 = Color(0xFFCDCFD4);
  static const win11Grey300 = Color(0xFFB4B7BE);
  static const win11Grey400 = Color(0xFF9BA0A8);
  static const win11Grey500 = Color(0xFF828792);
  static const win11Grey600 = Color(0xFF696E7B);
  static const win11Grey700 = Color(0xFF4F5465);
  static const win11Grey800 = Color(0xFF373B4A);
  static const win11Grey900 = Color(0xFF23262F);
}
