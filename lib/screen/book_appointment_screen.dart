import 'package:appointment_app/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../utils/app_colors.dart';
import '../utils/app_constants.dart';
import '../widgets/custome_text.dart';
import '../widgets/spacer.dart';

class BookAppointmentScreen extends StatefulWidget {
  const BookAppointmentScreen({super.key});

  @override
  State<BookAppointmentScreen> createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
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
            padding:  EdgeInsets.all(32),
            child: Column(
              children: [
                Image.asset(AppImages.image,fit: BoxFit.cover,),
                DoctorOverviewCard(
                    doctorName: 'Dr. Ryan Joe',
                    specialization: 'Neurologist',
                   ),
          verticalSpacer(30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DoctorProfileCard(
                  avatarRadius: 20.r,
                  imagePath: AppImages.patientsIcon,
                  title: 'Patients',
                  record:'120+',
                  bg: AppColors.lightGrey.withOpacity(0.2),),
              DoctorProfileCard(
                  avatarRadius: 20.r,
                  imagePath: AppImages.yearsExpIcon,
                  title: 'Years Exp',
                  record: '7+',
                bg: AppColors.lightGrey.withOpacity(0.2),),
              DoctorProfileCard(
                  avatarRadius: 20.r,
                  imagePath: AppImages.ratingIcon,
                  title: 'Rating',
                  record: '4.9',
                bg: AppColors.lightGrey.withOpacity(0.2),),
              DoctorProfileCard(
                  avatarRadius: 20.r,
                  imagePath: AppImages.reviewsIcon,
                  title: 'Reviews',
                  record: '100+',
                bg: AppColors.lightGrey.withOpacity(0.2),),
            ],
          ),
                verticalSpacer(10),
                customText(
                    text: 'About Me',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: AppColors.black),

              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget DoctorProfileCard(
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

  Widget DoctorOverviewCard({
    required String doctorName,
    required String specialization,

  }) {
    return Container(
      width: 318.w,
      height: 82.h,
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

            customText(
                text: doctorName,
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: AppColors.black),
            customText(
                text: specialization,
                fontWeight: FontWeight.w300,
                fontSize: 12,
                color: AppColors.grey),
          ],
        ),
      ),
    );
  }
}
