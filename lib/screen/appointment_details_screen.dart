import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../utils/app_colors.dart';
import '../utils/app_constants.dart';
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
      appBar: null,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(child: Padding(padding: EdgeInsets.symmetric(
            horizontal: 19.w, vertical: 16.h),
          child: Column(
            children: [
              verticalSpacer(6),
              customAppbar(
                bg: AppColors.white,
              ),
            ],
          ),
        ),),
      ),
    );
  }

  Widget customAppbar({
    required Color bg,
    // required String title,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  child: const Icon(Icons.arrow_back, color: AppColors.blue),
                ),
              ),
            ),
            horizontalSpacer(110),
            Center(
              child: customText(
                text: AppConstants.appointmentDetails,
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: AppColors.black,
                lineHeight: null,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
