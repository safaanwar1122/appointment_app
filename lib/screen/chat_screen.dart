import 'package:appointment_app/utils/app_colors.dart';
import 'package:appointment_app/utils/app_images.dart';
import 'package:appointment_app/widgets/custome_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../utils/app_constants.dart';
import '../widgets/spacer.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  String selectedScreen = 'Messages';
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
                         horizontalSpacer(16),
                          Center(
                            child: customText(
                              text: AppConstants.chat,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
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
                      padding: EdgeInsets.only(
                          left: 40.w, right: 40.w, bottom: 0.h, top: 5.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedScreen = 'Messages';
                              });
                            },
                            child: Column(
                              children: [
                                customText(
                                  text: 'Messages',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: selectedScreen == 'Messages'
                                      ? AppColors.white
                                      : AppColors.white.withOpacity(0.5),
                                ),
                                verticalSpacer(6),
                                Container(
                                  margin: EdgeInsets.only(top: 2.h),
                                  height: 4.h,
                                  width: 70.w,
                                  decoration: BoxDecoration(
                                      color: selectedScreen == 'Messages'
                                          ? AppColors.white
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(2.r),
                                        topLeft: Radius.circular(2.r),
                                        bottomRight: Radius.circular(2.r),
                                        bottomLeft: Radius.circular(2.r),
                                      )),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedScreen = 'Calls';
                              });
                            },
                            child: Column(
                              children: [
                                customText(
                                  text: 'Calls',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: selectedScreen == 'Calls'
                                      ? AppColors.white
                                      : AppColors.white.withOpacity(0.5),
                                ),
                                verticalSpacer(6),
                                Container(
                                  margin: EdgeInsets.only(top: 2.h),
                                  height: 4.h,
                                  width: 70.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(2.r),
                                      topLeft: Radius.circular(2.r),
                                      bottomRight: Radius.circular(2.r),
                                      bottomLeft: Radius.circular(2.r),
                                    ),
                                    color: selectedScreen == 'Calls'
                                        ? AppColors.white
                                        : Colors.transparent,
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
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 4.h,
              ),
              child: chatCard(
                  title: 'Dr. John Doe',
                  chat: 'Lorem ipsum dolor sit amet',
                  date: '03:00 PM',
                  imagePath: AppImages.doctorJohn),
            );
          }),
    );
  }
  Widget chatCard({
    required String title,
    required String chat,
    required String date,
    required String imagePath,
  }) {
    return Container(
      width: 344.w,
      height: 80.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(6.r),
        boxShadow: [
          BoxShadow(
            spreadRadius: 1.r,
            blurRadius: 5,
            color: AppColors.grey.withOpacity(0.2),
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        child: Row(
          children: [
            Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 10.w), // Spacing between the image and text
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customText(
                        text: title,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: AppColors.black,
                      ),
                      customText(
                        text: date,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: AppColors.grey,
                      ),
                    ],
                  ),

                  customText(
                    text: chat,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: AppColors.grey,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
