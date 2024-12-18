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
  State<AppointmentSuccessfulScreen> createState() => _AppointmentSuccessfulScreenState();
}

class _AppointmentSuccessfulScreenState extends State<AppointmentSuccessfulScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: SvgPicture.asset(
              AppImages.shade2,
              // width: 0.3.sw,
              fit: BoxFit.scaleDown,
            ),
          ),

          Center(
            child: SvgPicture.asset(
              AppImages.confirmation,
               height: 0.4.sh,

              fit: BoxFit.scaleDown,
            ),
          ),
          verticalSpacer(70),
          Padding(
            padding:  EdgeInsets.symmetric(vertical: 30.h, horizontal:70.w ),
            child: Stack(
              children:[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    customText(
                        text: 'Confirmation',
                        fontWeight: FontWeight.w600,
                        fontSize: 40,
                        color: AppColors.white),
                    //verticalSpacer(100),
                    appointmentSuccessfulCard(

                        title: '',
                        subTitle: '',
                        iconImage: ''),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget appointmentSuccessfulCard(
      {
        required String title,
        required String subTitle,
        required String iconImage}) {
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
          children: [
            horizontalSpacer(12),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customText(
                  text: 'You have successfully booked an\n appointment with ',
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                  color: AppColors.white,
                ),
                Center(
                  child: customText(
                    text: 'Dr. Ryan Joe',
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
            verticalSpacer(10),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,

                  children: [
                    SvgPicture.asset(AppImages.time, fit: BoxFit.scaleDown,),
                    horizontalSpacer(2),
                    customText(
                        text: 'Month 24, Year',
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: AppColors.white),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(AppImages.clock,fit: BoxFit.scaleDown,),
                    horizontalSpacer(2),
                    customText(
                        text: '10:00 AM',
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: AppColors.white)
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
