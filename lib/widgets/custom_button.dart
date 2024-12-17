import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customButton({
  required String label,
  required VoidCallback onPressed,
  required Color buttonColor,
  required Color textColor,
  double? height,
  double? width,
  EdgeInsetsGeometry? padding,
  bool showProgress = false,
}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      backgroundColor: buttonColor,
      padding: padding ?? EdgeInsets.symmetric(vertical: 15, horizontal: 50),
      minimumSize: Size(width ?? double.infinity, height ?? 50),
    ),
    child: showProgress
        ? SizedBox(
      width: 24.w,
      height: 24.h,
      child: CircularProgressIndicator(
        color: textColor,
      ),
    )
        : Text(
      label,
      style: TextStyle(fontSize: 16.sp, color: textColor),
    ),
  );
}
