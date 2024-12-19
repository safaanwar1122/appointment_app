import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:rich_readmore/rich_readmore.dart';

import '../utils/app_colors.dart';
import '../utils/app_constants.dart';
import '../utils/app_images.dart';
import '../widgets/custom_button.dart';
import '../widgets/custome_text.dart';
import '../widgets/spacer.dart';
class AppointmentDetailsScreen extends StatefulWidget {
  const AppointmentDetailsScreen({super.key});

  @override
  State<AppointmentDetailsScreen> createState() => _AppointmentDetailsScreenState();
}

class _AppointmentDetailsScreenState extends State<AppointmentDetailsScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.white,
        title: Padding(
          padding: EdgeInsets.only(
              left: 15.w, right: 125.w, top: 23.h, bottom: 10.h),
          child: Column(
            children: [
              verticalSpacer(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: AppColors.blue.withOpacity(.1),
                      child: Container(
                        width: 40.w,
                        height: 40.h,
                        child:
                        const Icon(Icons.arrow_back, color: AppColors.blue),
                      ),
                    ),
                  ),
                  Center(
                    child: customText(
                      text: AppConstants.bookAppointments,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: AppColors.black,
                      lineHeight: null,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Padding(
            padding:   EdgeInsets.symmetric(horizontal: 18.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image.asset(AppImages.image,fit: BoxFit.cover,),
                    Positioned(
                      top: 10.h,
                      right: 10,
                      child: Center(
                        child: Container(
                          width: 70.w,
                          height: 30.h,
                          decoration: BoxDecoration(
                            color: AppColors.ashBlue,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(AppImages.starIcon),
                              horizontalSpacer(4),
                              customText(
                                  text: '4.9',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: AppColors.black)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                doctorOverviewCard(
                  doctorName: 'Dr. John Doe',
                  specialization: 'Cardiologist', location:'London, United Kingdom',
                ),

                verticalSpacer(30),
                customText(
                    text: 'Schedule Appointment',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: AppColors.black),
                verticalSpacer(10),

                bookingTiming(title: 'Date', subTitle: 'August 15,2024'),
                verticalSpacer(10),
                bookingTiming(title: 'Time', subTitle: '03:00 PM'),
                verticalSpacer(10),
                bookingTiming(title: 'Booking for', subTitle: 'Self'),
                verticalSpacer(10),
                Container(
                  width: double.infinity,
                  height: 2.h,
                  color: AppColors.lightGrey,
                ),
                verticalSpacer(10),
                customText(
                    text: 'About Doctor',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: AppColors.black),
                RichReadMoreText.fromString(
                    text:"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum." ,
                    textStyle: TextStyle(color: AppColors.black),
                    settings: LengthModeSettings(trimLength: 90,
                        trimCollapsedText: 'Read More',
                        trimExpandedText: 'Read Less',
                        onPressReadMore: (){

                        },
                        onPressReadLess: (){},
                        lessStyle: TextStyle(color:Colors.red, ),
                        moreStyle: TextStyle(color:  AppColors.darkPurple)
                    )),
                verticalSpacer(10),
               Padding(
                 padding: const EdgeInsets.all(20.0),
                 child: Container(
                   width: 327.w,
                   height: 48.h,
                   decoration:  BoxDecoration(
                     color: AppColors.blue,
                     borderRadius:BorderRadius.circular(30),
                   ),

                   child: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         SvgPicture.asset(
                           AppImages.videoCall,
                           fit: BoxFit.scaleDown,),
                         horizontalSpacer(10),
                         customText(
                             text: 'Call (03:00 PM)',
                             fontWeight: FontWeight.w600,
                             fontSize: 16,
                             color: AppColors.white),
                       ],
                     ),
                   ),
                 ),
               ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget doctorProfileCard(
      {required double avatarRadius,
        required String imagePath,
        required String title,
        required String record,
        required Color bg}) {
    return Column(
      children: [
        CircleAvatar(
          radius: avatarRadius,
          backgroundColor: bg,
          child: SvgPicture.asset(
            imagePath,
            fit: BoxFit.scaleDown,
            height: avatarRadius,
            width: avatarRadius,
          ),
        ),
        customText(
            text: record,
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: AppColors.black),
        customText(
            text: title,
            fontWeight: FontWeight.w300,
            fontSize: 12,
            color: AppColors.grey)
      ],
    );
  }

  Widget doctorOverviewCard({
    required String doctorName,
    required String specialization,
required String location,
  }) {
    return Container(
      width: 318.w,
      height: 113.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.grey.withOpacity(0.1),
              //spreadRadius: 1.r,
              blurRadius: 1,
              offset: const Offset(0, 1),
            ),
          ]
      ),

      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               customText(
                   text: doctorName,
                   fontWeight: FontWeight.w600,
                   fontSize: 16,
                   color: AppColors.black),
               Row(
                 children: [
                   customText(
                       text: "15\$/",
                       fontWeight: FontWeight.w600,
                       fontSize: 16,
                       color: AppColors.black),
                   customText(
                       text: "Paid",
                       fontWeight: FontWeight.w600,
                       fontSize: 16,
                       color: AppColors.green),
                 ],
               ),
             ],
           ),
            customText(
                text: specialization,
                fontWeight: FontWeight.w300,
                fontSize: 12,
                color: AppColors.grey),
            Row(
              children: [
                SvgPicture.asset(AppImages.location,
                fit: BoxFit.scaleDown,
                color: AppColors.blue,),
                customText(
                    text: location,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: AppColors.grey),
              ],
            ),
          ],
        ),
      ),
    );
  }
  Widget bookingTiming({
    required String title,
    required String subTitle,

}){
    return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          customText(
              text: title,
              fontWeight: FontWeight.w300,
              fontSize: 12,
              color: AppColors.black),
          customText(
              text: subTitle,
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: AppColors.black),

        ],
      ),
    ],
    );
}
}
