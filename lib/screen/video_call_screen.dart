import 'package:appointment_app/export.dart';
class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({super.key});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: null,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image:
          AssetImage(AppImages.doctor),
          fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
          child: Column(
            children: [
              verticalSpacer(30),
              customAppbar(
                  text: ''),
              verticalSpacer(10),
              customText(
                  text: 'Dr. Simon',
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                  color: AppColors.white),

              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding:  EdgeInsets.only(right: 20.w, bottom: 20.h, top: 400.h),
                  child: Image.asset(AppImages.patient,fit: BoxFit.cover,),
                ),
              ),
              SafeArea(
                child: Padding(
                  padding:   EdgeInsets.symmetric(horizontal: 20.w ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //  crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      customCircleAvatar(
                          iconImage: AppImages.videoCall,
                          iconColor: AppColors.blue.withOpacity(0.9),
                          circleAvatarColor: AppColors.blue.withOpacity(0.3),
                          avatarRadius: 20),
                      //horizontalSpacer(10),
                      customCircleAvatar(
                          iconImage: AppImages.backwardForwardArrow,
                          iconColor: AppColors.white,
                          circleAvatarColor: AppColors.blue.withOpacity(0.3),
                          avatarRadius: 20),
                      customCircleAvatar(
                          iconImage: AppImages.callDrop,
                          iconColor: AppColors.white,
                          circleAvatarColor: AppColors.red,
                          avatarRadius: 28),
                      customCircleAvatar(
                          iconImage: AppImages.speaker,
                          iconColor: AppColors.blue.withOpacity(0.9),
                          circleAvatarColor: AppColors.blue.withOpacity(0.3),
                          avatarRadius: 20),
                      customCircleAvatar(
                          iconImage: AppImages.mike,
                          iconColor: AppColors.blue.withOpacity(0.9),
                          circleAvatarColor: AppColors.blue.withOpacity(0.3),
                          avatarRadius: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget customCircleAvatar({
    required String iconImage,
    required Color iconColor,
    required Color circleAvatarColor,
    required double avatarRadius,


}){
    return  CircleAvatar(
      radius: avatarRadius,
      backgroundColor: circleAvatarColor,
      child: SvgPicture.asset(
        iconImage,
        fit: BoxFit.scaleDown,
        color: iconColor,
      ),
    );
}

  Widget customAppbar({
    //required Color bg,
     required String text,
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
                backgroundColor: AppColors.white.withOpacity(.1),
                child: SizedBox(
                  width: 40.w,
                  height: 40.h,
                  child: const Icon(Icons.arrow_back, color: AppColors.white),
                ),
              ),
            ),
            horizontalSpacer(110),
            Container(
              width: 81.w,
              height: 26.h,
              decoration:  BoxDecoration(
                color: AppColors.white.withOpacity(0.3),
                borderRadius:BorderRadius.circular(20),
              ),

              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment:  MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppImages.dot,fit: BoxFit.scaleDown,),
                    horizontalSpacer(2),
                    customText(
                        text: '20:00',
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: AppColors.white),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
