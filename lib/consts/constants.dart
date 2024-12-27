import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//  COLORS
const Color gClr = Color(0xff0f4751);
final Color gClrwithAlpha = gClr.withAlpha(200);
const Color wClr = Color(0xffffffff);

// IMAGES
const AssetImage logoRemoveBg = AssetImage("assets/logo_removebg.png");

// ICONS
const Icon sync = Icon(Icons.sync, color: gClr, size: 32);
const Icon syncproblem = Icon(Icons.sync_problem, color: gClr, size: 32);
const Icon signalWifiOff = Icon(Icons.signal_wifi_off, color: gClr, size: 32);

// BoxShadow
final BoxShadow shadowBox = BoxShadow(
  color: gClr.withAlpha(100),
  offset: const Offset(0, 6),
  blurRadius: 7,
  spreadRadius: 1,
);

// Circular Progress Indicator
const CircularProgressIndicator progressIndicator = CircularProgressIndicator(
  color: gClr,
  backgroundColor: Colors.transparent,
  strokeWidth: 4,
);

// TEXT_STYLES

// arfontStyle
var arfontStyle = GoogleFonts.notoNaskhArabic;
final TextStyle arg20 =
    arfontStyle(color: gClr, fontSize: 20, fontWeight: FontWeight.w700);
final TextStyle arg24 =
    arfontStyle(color: gClr, fontSize: 24, fontWeight: FontWeight.w700);

// engfontStyle
var engfontStyle = GoogleFonts.poppins;
final TextStyle g16 =
    engfontStyle(color: gClr, fontSize: 16, fontWeight: FontWeight.w700);
final TextStyle g18 =
    engfontStyle(color: gClr, fontSize: 18, fontWeight: FontWeight.w700);
final TextStyle g24 =
    engfontStyle(color: gClr, fontSize: 24, fontWeight: FontWeight.w700);
final TextStyle g24withAlpha = engfontStyle(
    color: gClrwithAlpha, fontSize: 24, fontWeight: FontWeight.w700);
final TextStyle w12 =
    engfontStyle(color: wClr, fontSize: 12, fontWeight: FontWeight.w700);
