
import 'package:appointment_app/screen/user_data_screen.dart';
import 'package:appointment_app/utils/app_images.dart';
import 'package:appointment_app/widgets/spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../utils/app_colors.dart';
import '../utils/app_constants.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custome_text.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscurePassword = false;
  final  bool _isLoading = false;
  String? _emailError;
  String? _passwordError;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: AppColors.white,
    ));
    return Scaffold(
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(139),
        child: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            width: double.infinity,
            height: 139.h,
            decoration: BoxDecoration(
              color: AppColors.blue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.r),
                bottomRight: Radius.circular(20.r),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 296,
                  top: 0,
                  child: SvgPicture.asset(
                    AppImages.whiteShade,

                  ),
                ),
                Column(
                  children: [
                    verticalSpacer(80),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 16.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: CircleAvatar(
                                radius: 15,
                                backgroundColor: AppColors.white.withOpacity(0.2),
                                child: const Icon(Icons.arrow_back, color: AppColors.white)
                            ),
                          ),
                          const Spacer(),
                          customText(
                            text: AppConstants.signUp,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white,
                            lineHeight: null,
                          ),
                          horizontalSpacer(160)
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(

        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 40.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              customTextField(
                controller: usernameController,
              //  obscureText: false,
                hintText: "Enter email..",
                hintStyle: TextStyle(
                  color: AppColors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  height: 2.2.h,
                ),
                contentPadding: EdgeInsets.only(left: 5.w),
                prefixIcon: SvgPicture.asset(
                  AppImages.emailSvg,
                  width: 18.w,
                  height: 14.h,
                  fit: BoxFit.scaleDown,
                ),
                padding: EdgeInsets.symmetric(horizontal:0.5.w ,vertical: 7.h),
                errorText: _emailError,
                textStyle: const TextStyle(
                  color: AppColors.iconColor,
                ),
              ),
              customTextField(
                controller: passwordController,
               isPasswordField: true,
               // obscureText: _obscurePassword,
                hintText: "Enter password..",
                hintStyle:  TextStyle(
                  decoration: TextDecoration.none,
                  color: AppColors.grey,
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                  height: 2.2,
                ),
                contentPadding:const EdgeInsets.only(left: -1.0) ,
                prefixIcon: SvgPicture.asset(
                  AppImages.lockSvg,
                  width: 16.w,
                  height: 19.h,
                  fit: BoxFit.scaleDown,
                ),

                padding: EdgeInsets.symmetric(vertical: 0.h),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                  child: SvgPicture.asset(
                    AppImages.eyeSvg,
                    width: 20.w,
                    height: 20.h,
                    fit: BoxFit.scaleDown,
                  ),
                ),

                errorText: _passwordError,
                textStyle: const TextStyle(
                  color: AppColors.iconColor,
                ),
              ),
              customTextField(
                controller: passwordController,
               // obscureText: _obscurePassword,
                isPasswordField: true,
                hintText: "Confirm password..",
                hintStyle:  TextStyle(
                  color: AppColors.grey,
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                  height: 2.2,
                ),
                contentPadding:const EdgeInsets.only(left: -1.0) ,
                prefixIcon: SvgPicture.asset(
                  AppImages.lockSvg,
                  width: 16.w,
                  height: 19.h,
                  fit: BoxFit.scaleDown,
                ),

                padding: EdgeInsets.symmetric(vertical: 0.h),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                  child: SvgPicture.asset(
                    AppImages.eyeSvg,
                    width: 20.w,
                    height: 20.h,
                    fit: BoxFit.scaleDown,
                  ),
                ),

                errorText: _passwordError,
                textStyle: const TextStyle(
                  color: AppColors.iconColor,
                ),
              ),


              verticalSpacer(60),
              customButton(
                label: 'SIGN UP',
                onPressed: _isLoading ? () {} : (){},
                buttonColor: AppColors.blue,
                textColor: AppColors.white,
                width: 300.w,
                height: 48.h,
                showProgress: _isLoading,
              ),
              verticalSpacer(50),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: AppColors.lightGrey,
                      thickness: 1.h,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: customText(
                      text: "Or sign in with",
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: AppColors.iconColor,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: AppColors.lightGrey,
                      thickness: 1.h,
                    ),
                  ),
                ],
              ),
              verticalSpacer(50),
              Container(
                width:300.w ,
                height: 57.h,
                padding: EdgeInsets.symmetric(vertical: 10.h,),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.blue, width: 1.w),
                  borderRadius: BorderRadius.circular(35.r),
                  color: Colors.transparent,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppImages.google,
                      fit: BoxFit.scaleDown,
                      width: 24.w,
                      height: 24.h,
                    ),
                    horizontalSpacer(8),
                    customText(
                      text:'Login with Google',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: AppColors.blue,
                    ),
                  ],
                ),
              ),
              verticalSpacer(40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customText(
                    text: "Already Have An Account?",
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: AppColors.black,
                    lineHeight: 1.5,
                  ),
                  TextButton(
                      onPressed: () {
                        Get.to(() => const UserDataScreen());
                      },
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all(Colors.transparent),
                        padding:
                      MaterialStateProperty.all(EdgeInsets.zero),),
                      child: customText(
                        text:'User Profile',
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        lineHeight: 1.5,
                        color: AppColors.blue,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.blue,
                      )
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
