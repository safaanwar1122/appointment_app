
import 'package:appointment_app/export.dart';



Widget customTextFieldUsingProvider({
  required TextEditingController controller,
  EdgeInsetsGeometry? padding,
  TextStyle? textStyle,
  TextStyle? hintStyle,
  String? hintText,
  Widget? prefixIcon,
  Widget? suffixIcon,
  String? errorText,
  String? label,
  String? labelText,
  TextInputType? keyboardType,
  EdgeInsets? contentPadding,
  bool isPasswordField = false,
  Function(dynamic value)? onChanged,
  Future<Null> Function()? onTap,
  bool? readOnly,
}) {
  return Consumer<AuthProvider>(
    builder: (context, provider, child) {
      return Padding(
        padding: padding ?? EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: controller,
              obscureText: isPasswordField && !provider.isPasswordVisible,
              style: textStyle ?? TextStyle(fontSize: 16.sp),
              keyboardType: keyboardType,
              readOnly: readOnly ?? false,
              onChanged: onChanged,
              onTap: onTap,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: hintStyle ?? TextStyle(fontSize: 16.sp),
                prefixIcon: prefixIcon,
                labelText: labelText,
                labelStyle: TextStyle(fontSize: 16.sp),
                errorText: errorText,
                suffixIcon: isPasswordField
                    ? GestureDetector(
                  onTap: () {
                    provider.togglePasswordVisibility();
                  },
                  child: Icon(
                    provider.isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: AppColors.black.withOpacity(0.3),
                  ),
                )
                    : suffixIcon,
                border: const UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.lightGrey),
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.lightGrey),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.lightGrey),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );




}