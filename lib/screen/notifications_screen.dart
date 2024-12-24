import 'package:appointment_app/export.dart';
class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  @override


  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarIconBrightness:
      Theme.of(context).scaffoldBackgroundColor == AppColors.white
          ? Brightness.light
          : Brightness.light,
      statusBarColor: AppColors.white,
      systemNavigationBarColor: AppColors.white,
    ));
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
                  verticalSpacer(6),
                  customAppbar(
                    bg: AppColors.white,
                  ),
                  verticalSpacer(10),
                  heading(title: 'Today'),
                  verticalSpacer(10),
                  chatCard(
                    title: 'Schedule Appointment',
                    chat: '',
                    time: '1h',
                    imagePath: AppImages.scheduleAppointmentIcon,
                    bg: AppColors.green,
                    //containerColor: AppColors.white,
                    iconColor: AppColors.green.withOpacity(0.9),
                  ),
                  chatCard(
                      title: 'Schedule Change',
                      chat: '',
                      time: '3h',
                      imagePath: AppImages.scheduleCancelIcon,
                      bg: AppColors.blue.withOpacity(0.3),
                      //  containerColor: AppColors.white,
                      iconColor: AppColors.blue..withOpacity(0.9)),
                  chatCard(
                      title: 'Medical Notes',
                      chat: '',
                      time: '3h',
                      imagePath: AppImages.medicalNotesIcon,
                      bg: AppColors.blue.withOpacity(0.3),
                      // containerColor: AppColors.lavender,
                      iconColor: AppColors.blue.withOpacity(0.9)),
                  heading(title: 'August 10'),
                  chatCard(
                      title: 'Video Call Appointment',
                      chat: '',
                      time: '5d',
                      imagePath: AppImages.videoCall,
                      bg: AppColors.blue.withOpacity(0.3),
                      // containerColor: AppColors.white,
                      iconColor: AppColors.blue),
                  chatCard(
                      title: 'Medical History Update',
                      chat: '',
                      time: '5d',
                      imagePath: AppImages.medicalHistoryIcon,
                      bg: AppColors.lightOrange.withOpacity(0.2),
                      //  containerColor: AppColors.lavender,
                      iconColor: AppColors.orange.withOpacity(0.9)),
                  chatCard(
                      title: 'Appointment Cancel',
                      chat: '',
                      time: '5d',
                      imagePath: AppImages.appointmentCancelIcon,
                      bg: AppColors.peach.withOpacity(0.3),
                      //  containerColor: AppColors.white,
                      iconColor: AppColors.peach.withOpacity(0.9)),
                  chatCard(
                      title: 'Schedule Appointment',
                      chat: '',
                      time: '1h',
                      imagePath: AppImages.scheduleAppointmentIcon,
                      bg: AppColors.green.withOpacity(0.3),
                      //  containerColor: AppColors.lavender,
                      iconColor: AppColors.green.withOpacity(0.9)),
                ],
              ),
            ),
          )),
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
                text: AppConstants.notifications,
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

  Widget heading({required String title}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        customText(
            text: title,
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: AppColors.black),
        customText(
            text: "Mark All",
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: AppColors.blue)
      ],
    );
  }

  Widget chatCard({
    required String title,
    required String chat,
    required String time,
    required String imagePath,
    required Color bg,
    required Color iconColor,
     Color ? containerColor,
  }) {
    return Container(
      color: containerColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 8.h),
              child: CircleAvatar(
                radius: 28.r,
                backgroundColor: bg,
                child: SvgPicture.asset(
                  imagePath,
                  fit: BoxFit.scaleDown,
                  color: iconColor,
                ),
              ),
            ),
            horizontalSpacer(10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customText(
                        text: title,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: AppColors.black,
                      ),
                      customText(
                        text: time,
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                        color: AppColors.black,
                      ),
                    ],
                  ),
                  customText(
                    text:
                        "Lorem Ipsum dolor sit amet, consecture adipiscing elit, sed, eiusmod tempor incididunt ut labore dolor magna aliqua.",
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: AppColors.grey,
                    textAlign: TextAlign.justify,
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
