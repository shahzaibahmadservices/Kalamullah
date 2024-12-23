import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//                                  COLORS
const Color gClr = Color(0xff0f4751);
const Color wClr = Color(0xffffffff);
//                                   THEME
var fontStyle = GoogleFonts.poppins;
ThemeData theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    primary: gClr,
    seedColor: gClr,
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: gClr,
    selectionColor: gClr.withAlpha(100),
  ),
  textTheme: TextTheme(
    headlineLarge:
        fontStyle(color: gClr, fontSize: 24, fontWeight: FontWeight.w700),
    headlineMedium:
        fontStyle(color: gClr, fontSize: 20, fontWeight: FontWeight.w700),
    headlineSmall:
        fontStyle(color: gClr, fontSize: 18, fontWeight: FontWeight.w700),
    titleMedium:
        fontStyle(color: gClr, fontSize: 16, fontWeight: FontWeight.w700),
    titleSmall:
        fontStyle(color: gClr, fontSize: 12, fontWeight: FontWeight.w700),
    bodySmall:
        fontStyle(color: gClr, fontSize: 12, fontWeight: FontWeight.w500),
    bodyMedium:
        fontStyle(color: gClr, fontSize: 16, fontWeight: FontWeight.w500),
    bodyLarge:
        fontStyle(color: gClr, fontSize: 18, fontWeight: FontWeight.w500),
  ),
);
//                                   IMAGES
const AssetImage logo = AssetImage("assets/logo/logo.png");
const AssetImage onboarding01 = AssetImage("assets/on_boardings/01.png");
const AssetImage onboarding02 = AssetImage("assets/on_boardings/02.png");
const AssetImage onboarding03 = AssetImage("assets/on_boardings/03.png");
const AssetImage bgImage = AssetImage("assets/others/bg_image.jpg");

const Icon syncproblem = Icon(Icons.sync_problem, color: gClr, size: 32);
const Icon sync = Icon(Icons.sync_problem, color: gClr, size: 32);
const Icon signalWifiOff = Icon(Icons.signal_wifi_off, color: gClr, size: 48);
//                         Circular Progress Indicator
const CircularProgressIndicator cpi = CircularProgressIndicator(
  color: gClr,
  backgroundColor: Colors.transparent,
  strokeWidth: 4,
);

//                                    Indexes
class Indexes {
  static int? surahIndex;
}
