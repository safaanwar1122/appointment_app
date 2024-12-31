import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:appointment_app/export.dart';
class TermsAndConditions extends StatefulWidget {
  @override
  _TermsAndConditionsState createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      appBar:  PreferredSize(
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
                        Padding(padding: EdgeInsets.only( left: 20.w,  top: 23.h, bottom: 10.h),
                          child:   customText(
                            text: AppConstants.termsAndConditions,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white,
                            lineHeight: null,
                          ),
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
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(26.r),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: SingleChildScrollView(
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n\n'
                  *5,
              style: TextStyle(
                fontSize: 14.sp,
                height: 1.5,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
