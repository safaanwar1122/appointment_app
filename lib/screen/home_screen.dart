import 'package:appointment_app/utils/app_images.dart';
import 'package:appointment_app/widgets/spacer.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../utils/app_colors.dart';
import '../widgets/custome_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: null,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 16.h),
            child: Column(
              children: [
                verticalSpacer(8),
                customAppbar(
                  bg: AppColors.lightGrey,
                  title: '',
                  subTitle: '',
                  iconImage: AppImages.searchIcon,
                  iconImage1: AppImages.notificationIcon,
                ),
                verticalSpacer(20),
                heading(title: 'Upcoming appointment'),
                verticalSpacer(20),
                doctorDetailsCard(
                    bg: AppColors.ashBlue,
                    title: 'Dr. John Doe',
                    subTitle: 'Cardiologist',
                    iconImage: AppImages.doctorJohn),
                verticalSpacer(20),
                heading(title: 'Categories'),
                verticalSpacer(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    categoryCard(
                      iconImage: AppImages.heartIcon,
                      bg: AppColors.peach,
                      categoryName: 'Cardiologist',
                      // avatarRadius: 30.r,// can customize it
                    ),
                    categoryCard(
                        iconImage: AppImages.brainIcon,
                        bg: AppColors.purple,
                        categoryName: 'Neurologist'),
                    categoryCard(
                        iconImage: AppImages.teethIcon,
                        bg: AppColors.orange,
                        categoryName: 'Dentist'),
                    categoryCard(
                        iconImage: AppImages.eyeIcon,
                        bg: AppColors.green,
                        categoryName: 'Ophthalogist'),
                  ],
                ),
                verticalSpacer(16),
                heading(title: 'Top Doctors'),
                verticalSpacer(12),
                SizedBox(
                  height: 222.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                    return    doctorCard(
                      imagePath: AppImages.doctorRyan,
                      doctorName: 'Dr. Ryan Joe',
                      specialization: 'Neurologist',
                      favouriteIconPath: AppImages.redHeartIcon,
                      startIcon: AppImages.starIcon,
                      isFavorite: true,
                      onBookTap: () {},
                      onFavoriteTap: () {},
                    );
                  },),
                ),

               /* Row(
                  children: [

                    doctorCard(
                      imagePath: AppImages.doctorEmily,
                      doctorName: 'Dr. Emily',
                      specialization: 'Cardiologist',
                      favouriteIconPath: AppImages.redHeartIcon,
                      startIcon: AppImages.starIcon,
                      isFavorite: true,
                      //   rating: 4.9,
                      onBookTap: () {},
                      onFavoriteTap: () {},
                    ),
                  ],
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget customAppbar({
    required Color bg,
    required String title,
    required String subTitle,
    required String iconImage,
    required String iconImage1,
  }) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
                backgroundColor: AppColors.lightGrey,
                child: Image.asset(
                  AppImages.male,
                  fit: BoxFit.cover,
                )),
            Padding(
              padding: EdgeInsets.only(left: 1.w, right: 40.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customText(
                    text: "Hi, Mike!",
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: AppColors.black,
                  ),
                  customText(
                    text: "Let's take care of you today",
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: AppColors.black,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 5.w),
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      iconImage,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                //const SizedBox(width: 2),
                //horizontalSpacer(-1),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    iconImage1,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget doctorDetailsCard(
      {required Color bg,
      required String title,
      required String subTitle,
      required String iconImage}) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.blue, borderRadius: BorderRadius.circular(14.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                 Image.asset(
                    iconImage,
                    fit: BoxFit.fill,


                ),
                horizontalSpacer(12),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customText(
                      text: title,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: AppColors.white,
                    ),
                    customText(
                      text: subTitle,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: AppColors.white,
                    ),
                  ],
                ),
                const Spacer(),
                CircleAvatar(
                  radius: 15.r,
                  backgroundColor: bg,
                  child: SvgPicture.asset(
                    AppImages.forwardIcon,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ],
            ),
          verticalSpacer(10),
            const SizedBox(
              child:DottedLine(
                dashColor: AppColors.white,
                lineThickness: 2,
                dashLength: 4,
              ) ,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(AppImages.whiteCalenderIcon),
                    ),
                    customText(
                        text: 'Wednesday, 14 August',
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: AppColors.white),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(AppImages.clockIcon),
                      //color: AppColors.white,
                    ),
                    customText(
                        text: '3:00 PM - 4:00 PM',
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
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
  Widget heading({required String title}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        customText(
            text: title,
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: AppColors.black),
        customText(
            text: "See All",
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: AppColors.blue)
      ],
    );
  }

  Widget categoryCard({
    required String iconImage,
    required Color bg,
    required String categoryName,
    double avatarRadius = 35,
  }) {
    return Column(
      children: [
        CircleAvatar(
          radius: avatarRadius,
          backgroundColor: bg,
          child: SvgPicture.asset(
            iconImage,
            fit: BoxFit.scaleDown,
            width: avatarRadius,
            height: avatarRadius,
          ),
        ),
        verticalSpacer(5),
        customText(
            text: categoryName,
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: AppColors.black)
      ],
    );
  }

  Widget doctorCard({
    required String imagePath,
    required String doctorName,
    required String specialization,
    required VoidCallback onBookTap,
    required VoidCallback onFavoriteTap,
    bool isFavorite = false,
    required String favouriteIconPath,
    required String startIcon,
  }) {
    return Container(
    width: 169.w,
      height: 222.h,
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey.withOpacity(0.2),
            spreadRadius: 1.r,
            blurRadius: 5,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            top: 8.h,
            right: 2.w,
            child: SvgPicture.asset(
              favouriteIconPath,
              color: isFavorite ? Colors.red : AppColors.grey,
              width: 24.w,
              height: 24.h,
            ),
          ),

          Positioned.fill(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100.h,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      CircleAvatar(
                        radius: 40.r,
                        backgroundImage: AssetImage(imagePath),
                      ),
                      Positioned(
                        top: 66.h,
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
                ),
                verticalSpacer(8),
                customText(
                  text: doctorName,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: AppColors.black,
                ),
                verticalSpacer(4),
                customText(
                    text: specialization,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: AppColors.black),
                // verticalSpacer(2),
                SizedBox(
                  width: 82.w,
                  height: 36.h,
                  child: ElevatedButton(
                      onPressed: onBookTap,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                      ),
                      child: customText(
                          text: "Book",
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: AppColors.white)),
                ),
              ],
            ),
          ),


        ],
      ),
    );
  }

  }


