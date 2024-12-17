
import 'package:appointment_app/controllers/auth_provider.dart';
import 'package:appointment_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
Widget customTextField( {
  required TextEditingController controller,
  //required String labelText,
  // required bool obscureText,
  EdgeInsetsGeometry? padding,
  TextStyle? textStyle,
  TextStyle? hintStyle,
  String? hintText,
  Widget? prefixIcon,
  Widget? suffixIcon,
  String? errorText,
  String ? label,
  String? labelText,
  required EdgeInsets contentPadding,
  bool isPasswordField=false,
}) {
  return Consumer<AuthProvider>(builder: (context, provider, child ){
    return  Padding(
      padding: padding ?? EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: controller,
            obscureText:isPasswordField&&  !provider.isPasswordVisible,
            style: textStyle ?? TextStyle(fontSize: 16.sp),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle:hintStyle?? TextStyle(fontSize: 16.sp),
              prefixIcon: prefixIcon,
              labelText: labelText,
              labelStyle: TextStyle(fontSize: 16.sp),
              suffixIcon:isPasswordField?  GestureDetector(
                onTap: (){
                  provider.togglePasswordVisibility();
                },
                child:
                Icon(provider.isPasswordVisible? Icons.visibility:Icons.visibility_off,
                
                color:AppColors.black.withOpacity(0.3),),
              ):null,
              border: const UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.lightGrey)
              ),
              enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.lightGrey)
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.lightGrey),
              ),
            ),
          ),
        ],
      ),
    );
  });
}