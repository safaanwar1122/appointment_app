import 'package:appointment_app/export.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/appointment_doctor_provider.dart';
import '../models/appointment_doctor_details_model.dart';

class AppointmentScreenUsingProvider extends StatefulWidget {
  const AppointmentScreenUsingProvider({super.key});

  @override
  State<AppointmentScreenUsingProvider> createState() => _AppointmentScreenUsingProviderState();
}

class _AppointmentScreenUsingProviderState extends State<AppointmentScreenUsingProvider> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<AppointmentProvider>(context,listen: false).filterData("Upcoming");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
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
                Consumer<AppointmentProvider>(

                    builder: (context, appointmentProvider, child){
                    return Column(
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
                                  Provider.of<AppointmentProvider>(context,listen: false).filterData("Upcoming");
                                },
                                child: Column(
                                  children: [
                                    customText(
                                      text: 'Upcoming',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: appointmentProvider.selectedScreen == 'Upcoming'
                                          ? AppColors.white
                                          : AppColors.white.withOpacity(0.5),
                                    ),
                                    verticalSpacer(6),
                                    Container(
                                      margin: EdgeInsets.only(top: 2.h),
                                      height: 4.h,
                                      width: 81.w,
                                      decoration: BoxDecoration(
                                          color: appointmentProvider.selectedScreen == 'Upcoming'
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
                                  Provider.of<AppointmentProvider>(context,listen: false).filterData("Completed");
                                },
                                child: Column(
                                  children: [
                                    customText(
                                      text: 'Completed',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: appointmentProvider.selectedScreen == 'Completed'
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
                                        color: appointmentProvider.selectedScreen == 'Completed'
                                            ? AppColors.white
                                            : Colors.transparent,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Provider.of<AppointmentProvider>(context,listen: false).filterData("Cancelled");
                                },
                                child: Column(
                                  children: [
                                    customText(
                                      text: 'Cancelled',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: appointmentProvider.selectedScreen == 'Cancelled'
                                          ? AppColors.white
                                          : AppColors.white.withOpacity(0.5),
                                    ),
                                    verticalSpacer(6),
                                    Container(
                                      margin: EdgeInsets.only(top: 2.h),
                                      height: 4.h,
                                      width: 81.w,
                                      decoration: BoxDecoration(
                                        color: appointmentProvider.selectedScreen == 'Cancelled'
                                            ? AppColors.white
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(2.r),
                                          topRight: const Radius.circular(2.4),
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
                    );
                  }
                ),
              ],
            ),
          ),
        ),
      ),
      body: Consumer<AppointmentProvider>(

          builder: (context, appointmentProvider, child){
            final appointments=appointmentProvider.filterList;

            return ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: appointments.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {

                  final appointment=appointments[index];
                  return  Padding(padding: EdgeInsets.symmetric(horizontal:16.w ,vertical: 4.h,
                  ),
                    child: appointmentCard(status:appointment.status ,
                      bg: AppColors.white,
                      title: appointment.name,
                      subTitle: appointment.specialization,
                      imagePath: appointment.imagePath,
                      date: appointment.time,
                    ),

                  );
                });
          }),
    );
  }

  Widget appointmentCard({
    required Color bg,
    required String title,
    required String subTitle,
    required String imagePath,
    required String date,
    required String status,
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
                        text: title,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: AppColors.black,
                      ),
                      customText(
                        text: subTitle,
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
                if(status!="Completed")
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
                    onPressed: () {
                        Get.to(() =>const BookAppointmentScreen());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                    child: customText(
                      text: 'Completed',
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

