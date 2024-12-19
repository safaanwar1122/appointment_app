import 'package:appointment_app/utils/app_images.dart';
import 'package:appointment_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:rich_readmore/rich_readmore.dart';

import '../controllers/container_state_provider.dart';
import '../utils/app_colors.dart';
import '../utils/app_constants.dart';
import '../widgets/custome_text.dart';
import '../widgets/spacer.dart';
import 'appointment_details_screen.dart';
import 'appointmnet_successful_screen.dart';

class BookAppointmentScreen extends StatefulWidget {
  const BookAppointmentScreen({super.key});
  @override
  State<BookAppointmentScreen> createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  var containerColorProvider;
  @override
  Widget build(BuildContext context) {
    void iniState(){
      containerColorProvider=Provider.of<ContainerStateProvider>(context);
    }
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
                Image.asset(AppImages.image,fit: BoxFit.cover,),
                doctorOverviewCard(
                    doctorName: 'Dr. Ryan Joe',
                    specialization: 'Neurologist',
                   ),
          verticalSpacer(30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              doctorProfileCard(
                  avatarRadius: 20.r,
                  imagePath: AppImages.patientsIcon,
                  title: 'Patients',
                  record:'120+',
                  bg: AppColors.lightGrey.withOpacity(0.2),),
              doctorProfileCard(
                  avatarRadius: 20.r,
                  imagePath: AppImages.yearsExpIcon,
                  title: 'Years Exp',
                  record: '7+',
                bg: AppColors.lightGrey.withOpacity(0.2),),
              doctorProfileCard(
                  avatarRadius: 20.r,
                  imagePath: AppImages.ratingIcon,
                  title: 'Rating',
                  record: '4.9',
                bg: AppColors.lightGrey.withOpacity(0.2),),
              doctorProfileCard(
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
                      moreStyle: TextStyle(color:  AppColors.blue)
                    )),
                customText(
                    text: 'Patient Details',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: AppColors.blue),
                verticalSpacer(10),
                ChangeNotifierProvider(create: (_)=>ContainerStateProvider(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    containerColorState(
                      containerId: "yourself", // Unique identifier
                      text: "Yourself",
                    ),
                    SizedBox(width: 10), // Spacing between containers
                    containerColorState(
                      containerId: "anotherPerson", // Unique identifier
                      text: "Another Person",
                    ),
                  ],
                ),
                ),

                customButton(
                    label: 'Make Appointment',
                    onPressed: (){
                      Get.to(()=>const AppointmentDetailsScreen());
                    },
                    buttonColor: AppColors.blue,
                    textColor: AppColors.white)
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
  Widget containerColorState({
    required String containerId, // Unique identifier for this container
    required String text,
  }) {
    return Consumer<ContainerStateProvider>(
      builder: (context, containerColorProvider, child) {
        bool isSelected = containerColorProvider.selectedContainer == containerId;

        return GestureDetector(
          onTap: () => containerColorProvider.toggleSelection(containerId),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.blue : AppColors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.blue),
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                  color: isSelected ? AppColors.white : AppColors.blue,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
