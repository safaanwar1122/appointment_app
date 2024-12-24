import 'package:appointment_app/export.dart';

Widget customText({
  required String text,
  required FontWeight fontWeight,
  required double fontSize,
  required Color color,
  double? lineHeight,
  TextDecoration? decoration,
  Color? decorationColor,
TextAlign? textAlign,

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
    textAlign: textAlign,
  );
}
