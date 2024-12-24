import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// COLORS
const Color gClr = Color(0xff0f4751);
const Color wClr = Color(0xffffffff);
// TEXT_STYLES
var arfontStyle = GoogleFonts.notoNaskhArabic;
final TextStyle arg12b =
    arfontStyle(color: gClr, fontSize: 12, fontWeight: FontWeight.w700);
final TextStyle arg16b =
    arfontStyle(color: gClr, fontSize: 16, fontWeight: FontWeight.w700);
final TextStyle arg18b =
    arfontStyle(color: gClr, fontSize: 18, fontWeight: FontWeight.w700);
final TextStyle arg20b =
    arfontStyle(color: gClr, fontSize: 20, fontWeight: FontWeight.w700);
final TextStyle arg24b =
    arfontStyle(color: gClr, fontSize: 24, fontWeight: FontWeight.w700);
final TextStyle arw12b =
    arfontStyle(color: wClr, fontSize: 12, fontWeight: FontWeight.w700);
final TextStyle arw16b =
    arfontStyle(color: wClr, fontSize: 16, fontWeight: FontWeight.w700);
final TextStyle arw18b =
    arfontStyle(color: wClr, fontSize: 18, fontWeight: FontWeight.w700);
final TextStyle arw20b =
    arfontStyle(color: wClr, fontSize: 20, fontWeight: FontWeight.w700);
var engfontStyle = GoogleFonts.poppins;
final TextStyle g12b =
    engfontStyle(color: gClr, fontSize: 12, fontWeight: FontWeight.w700);
final TextStyle g16b =
    engfontStyle(color: gClr, fontSize: 16, fontWeight: FontWeight.w700);
final TextStyle g18b =
    engfontStyle(color: gClr, fontSize: 18, fontWeight: FontWeight.w700);
final TextStyle g20b =
    engfontStyle(color: gClr, fontSize: 20, fontWeight: FontWeight.w700);
final TextStyle g24b =
    engfontStyle(color: gClr, fontSize: 24, fontWeight: FontWeight.w700);
final TextStyle w12b =
    engfontStyle(color: wClr, fontSize: 12, fontWeight: FontWeight.w700);
final TextStyle w16b =
    engfontStyle(color: wClr, fontSize: 16, fontWeight: FontWeight.w700);
final TextStyle w18b =
    engfontStyle(color: wClr, fontSize: 18, fontWeight: FontWeight.w700);
final TextStyle w20b =
    engfontStyle(color: wClr, fontSize: 20, fontWeight: FontWeight.w700);

// IMAGES
const AssetImage logoRemoveBg = AssetImage("assets/images/logo_removebg.png");
// ICONS
const Icon sync = Icon(Icons.sync_problem, color: gClr, size: 32);
const Icon syncproblem = Icon(Icons.sync_problem, color: gClr, size: 32);
const Icon signalWifiOff = Icon(Icons.signal_wifi_off, color: gClr, size: 32);
// Circular Progress Indicator
const CircularProgressIndicator cpi = CircularProgressIndicator(
  color: gClr,
  backgroundColor: Colors.transparent,
  strokeWidth: 4,
);

// Indexes
class Indexes {
  static int? surahIndex;
}
