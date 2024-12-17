import 'package:appointment_app/utils/app_colors.dart';
import 'package:appointment_app/utils/app_constants.dart';
import 'package:appointment_app/utils/app_images.dart';
import 'package:appointment_app/widgets/custome_text.dart';
import 'package:appointment_app/widgets/spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'login_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit( //
      designSize: const Size(393, 852),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.white,
            elevation: 0,
          ),
          body: Container(
            color: AppColors.blue,
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.h),
                        child: SvgPicture.asset(
                          AppImages.careCore,
                          width: 0.5.sw,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      Image.asset(
                        AppImages.bodyImage,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    color: AppColors.blue,
                    padding: EdgeInsets.all(20.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        customText(
                     text: 'Care that\'s Always There',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,
                        ),
                        verticalSpacer(10),
                        customText(
                            text: 'Book appointment and\n consult with ease',
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                            color: AppColors.white),
                        verticalSpacer(10),
                        ElevatedButton(
                          onPressed: () {
                            Get.to(() => const LoginScreen());
                              },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: AppColors.blue,
                            backgroundColor: AppColors.white,
                            padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 50.w),
                          ),
                          child: Text(AppConstants.getStarted),
                        ),




                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
