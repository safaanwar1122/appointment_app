import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

Widget customText({
  required String text,
  required FontWeight fontWeight,
  required double fontSize,
  required Color color,
  double? lineHeight,
  TextDecoration? decoration,
  Color? decorationColor,

}) {
  return Text(
    text,
    style: TextStyle(
      fontWeight: fontWeight,
      fontSize: fontSize.sp,
      color: color,
      height: lineHeight?.h,
      decoration: decoration,
      fontFamily: GoogleFonts.inter().fontFamily,
      decorationColor: decorationColor,
    ),
  );
}
