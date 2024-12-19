import 'package:appointment_app/widgets/custome_text.dart';
import 'package:appointment_app/widgets/spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/app_colors.dart';
import '../utils/app_images.dart';

class AppointmentSuccessfulScreen extends StatefulWidget {
  const AppointmentSuccessfulScreen({super.key});

  @override
  State<AppointmentSuccessfulScreen> createState() =>
      _AppointmentSuccessfulScreenState();
}

class _AppointmentSuccessfulScreenState
    extends State<AppointmentSuccessfulScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: Stack(
        children: [
          // Shade image at top-right corner
          Positioned(
            top: 0.h,
            right: 0,
            child: SvgPicture.asset(
              AppImages.shade2,
              fit: BoxFit.scaleDown,
            ),
          ),
          Positioned(
              top: 0.h,
              left: 2.w,
              child: Icon(
                Icons.arrow_back_ios,
                color: AppColors.white,
              )),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Positioned(
                  top: 10.h,
                  child: SvgPicture.asset(
                    AppImages.confirmation,
                    // height: 0.3.sh,
                    fit: BoxFit.scaleDown,
                  ),
                ),
                verticalSpacer(10),
                customText(
                  text: 'Confirmation',
                  fontWeight: FontWeight.w600,
                  fontSize: 40,
                  color: AppColors.white,
                ),
                verticalSpacer(20),
                appointmentSuccessfulCard(
                  title: '',
                  subTitle: '',
                  iconImage: '',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget appointmentSuccessfulCard({
    required String title,
    required String subTitle,
    required String iconImage,
  }) {
    return Container(
      width: 256.w,
      height: 152.h,
      decoration: BoxDecoration(
        color: AppColors.blue,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(
          color: AppColors.white,
          width: 1.w,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text.rich(
                TextSpan(
                    children: [
                  TextSpan(
                    text: 'You have successfully booked an\n',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 16.sp,
                      color: AppColors.white,
                    ),
                  ),
                  TextSpan(
                    text: 'appointment with',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 16.sp,
                      color: AppColors.white,
                    ),
                  ),
                ]),
                textAlign: TextAlign.center,
              ),
            ),
            verticalSpacer(10),
            Center(
              child: customText(
                text: 'Dr. Ryan Joe',
                fontWeight: FontWeight.w800,
                fontSize: 20,
                color: AppColors.white,
              ),
            ),
            verticalSpacer(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(AppImages.time, fit: BoxFit.scaleDown),
                    SizedBox(width: 2.w),
                    customText(
                      text: 'Month 24, Year',
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: AppColors.white,
                    ),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset(AppImages.clock, fit: BoxFit.scaleDown),
                    SizedBox(width: 2.w),
                    customText(
                      text: '10:00 AM',
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: AppColors.white,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
