import 'package:appointment_app/utils/app_colors.dart';
import 'package:appointment_app/utils/app_images.dart';
import 'package:appointment_app/widgets/custome_text.dart';
import 'package:appointment_app/widgets/spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../utils/app_constants.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  String selectedScreen = 'Upcoming';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey.withOpacity(0.2),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150.h),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.r),
            bottomRight: Radius.circular(20.r),
          ),
          child: AppBar(
            elevation: 0,
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.blue,
            flexibleSpace: Stack(
              children: [
                Positioned(
                  left: 296.w,
                  top: 0.h,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 50.w, right: 2.w, top: 62.h, bottom: 10.h),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.search, color: AppColors.white),
                    ),
                  ),
                ),
                Column(
                  children: [
                    verticalSpacer(70),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: CircleAvatar(
                              radius: 20.r,
                              backgroundColor: AppColors.white.withOpacity(0.2),
                              child: const Icon(Icons.arrow_back,
                                  color: AppColors.white),
                            ),
                          ),
                          const Spacer(),
                          Center(
                            child: customText(
                              text: AppConstants.myAppointments,
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                              color: Colors.white,
                              lineHeight: null,
                            ),
                          ),
                          horizontalSpacer(130),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: EdgeInsets.only(left: 24.w,right: 24.w, bottom: 0.h, top: 5.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedScreen = 'Upcoming';
                              });
                            },
                            child: Column(
                              children: [
                                customText(
                                  text: 'Upcoming',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: selectedScreen == 'Upcoming'
                                      ? AppColors.white
                                      : AppColors.white.withOpacity(0.5),
                                ),
                                verticalSpacer(6),
                                Container(
                                  margin: EdgeInsets.only(top: 2.h),
                                  height: 4.h,
                                  width: 81.w,
                                  decoration: BoxDecoration(
                                      color: selectedScreen == 'Upcoming'
                                          ? AppColors.white
                                          : Colors.transparent,
                                    borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(2.r),
                                      topLeft: Radius.circular(2.r),
                                      bottomRight: Radius.circular(2.r),
                                      bottomLeft: Radius.circular(2.r),
                                    )
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedScreen = 'Completed';
                              });
                            },
                            child: Column(
                              children: [
                                customText(
                                  text: 'Completed',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: selectedScreen == 'Completed'
                                      ? AppColors.white
                                      : AppColors.white.withOpacity(0.5),
                                ),
                                verticalSpacer(6),
                                Container(
                                  margin: EdgeInsets.only(top: 2.h),
                                  height: 4.h,
                                  width: 81.w,
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.only(
                                     topRight: Radius.circular(2.r),
                                     topLeft: Radius.circular(2.r),
                                     bottomRight: Radius.circular(2.r),
                                     bottomLeft: Radius.circular(2.r),
                                   ),
                                   color: selectedScreen == 'Completed'
                                       ? AppColors.white
                                       : Colors.transparent,
                                 ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedScreen = 'Cancelled';
                              });
                            },
                            child: Column(
                              children: [
                                customText(
                                  text: 'Cancelled',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: selectedScreen == 'Cancelled'
                                      ? AppColors.white
                                      : AppColors.white.withOpacity(0.5),
                                ),
                                verticalSpacer(6),
                                Container(
                                  margin: EdgeInsets.only(top: 2.h),
                                  height: 4.h,
                                  width: 81.w,
                                  decoration: BoxDecoration(
                                    color: selectedScreen == 'Cancelled'
                                        ? AppColors.white
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(2.r),
                                      topRight: Radius.circular(2.4),
                                      bottomLeft: Radius.circular(2.r),
                                      bottomRight: Radius.circular(2.r),
                                    ),
                                  ),

                                ),
                              ],
                            ),
                          ),
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
      body: ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: 20,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return  Padding(padding: EdgeInsets.symmetric(horizontal:16.w ,vertical: 4.h,
              ),
                child: appointmentCard(
                  bg: AppColors.white,
                  title: '',
                  subTitle: '',
                  imagePath: AppImages.doctorJohn,
                  date: 'Today:03:00 PM',
                ),

              );
            }),
    );
  }

  Widget appointmentCard({
    required Color bg,
    required String title,
    required String subTitle,
    required String imagePath,
    required String date,
  }) {
    return Container(
      width: 344.w,
      height: 172.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(6.r),
        boxShadow: [
          BoxShadow(
            spreadRadius: 1.r,
            blurRadius: 5,
            color: AppColors.grey.withOpacity(0.2),
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customText(
                        text: 'Dr. John Doe',
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: AppColors.black,
                      ),
                      customText(
                        text: 'Cardiologist',
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: AppColors.grey,
                      ),
                      customText(
                        text: date,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: AppColors.black,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                CircleAvatar(
                  radius: 20.r,
                  backgroundColor: AppColors.blueLavender.withOpacity(0.3),
                  child: SvgPicture.asset(AppImages.blueForwardArrow),
                ),
              ],
            ),
            verticalSpacer(8),
            Container(
              width: double.infinity,
              height: 2.h,
              color: AppColors.lightGrey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 121.w,
                  height: 36.h,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.ashBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                    child: customText(
                      text: 'Cancel',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: AppColors.white,
                    ),
                  ),
                ),
                Container(
                  width: 2.w,
                  height: 82.h,
                  color: AppColors.lightGrey,
                ),
                SizedBox(
                  width: 121.w,
                  height: 36.h,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                    child: customText(
                      text: 'Reschedule',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}



