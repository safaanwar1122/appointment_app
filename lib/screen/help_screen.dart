
import 'package:appointment_app/export.dart';
class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});
  @override
  State<HelpScreen> createState() =>
      _HelpScreenState();
}
class _HelpScreenState extends State<HelpScreen> {
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
              left: 15.w, right: 150.w, top: 23.h, bottom: 10.h),
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
                      radius: 15,
                      backgroundColor: Colors.transparent,
                      child: SizedBox(
                        width: 40.w,
                        height: 40.h,
                        child:
                        const Icon(Icons.arrow_back, color: AppColors.blue),
                      ),
                    ),
                  ),
                  Center(
                    child: customText(
                      text: AppConstants.help,
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      color: AppColors.blue,
                      lineHeight: null,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.zero,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Positioned(
                top: 100.h,
                child: Container(
                  width: 393.w,
                  height: 750.h,
                  decoration: BoxDecoration(
                    color: AppColors.blue,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.w),
                      topRight: Radius.circular(20.w),
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  SizedBox(height: 50.h),
                  Center(
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        CircleAvatar(
                          radius: 55.r,
                          backgroundColor: AppColors.lightGrey,
                          child: Image.asset(
                            AppImages.person,
                            fit: BoxFit.cover,
                            width: 80.w,
                            height: 80.h,
                          ),
                        ),
                        Positioned(
                          bottom: 5.h,
                          right: 5.h,
                          child: SizedBox(
                            width: 37.h,
                            height: 37.h,
                            child: SvgPicture.asset(
                              AppImages.pencil,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 25.w,
                      vertical: 20.h,
                    ),
                    child: Column(
                      children: [
                        customText(
                          text: "Safa Anwar",
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                          color: AppColors.white,
                        ),
                        verticalSpacer(30),
                        customRowSettingsContainer(
                          text: "Help Center",
                          textStyle: const TextStyle(
                            fontSize: 16,
                            color: AppColors.white,
                          ),
                          textColor: AppColors.white,
                          iconColor: AppColors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          avatarRadius: 20.r,
                          icon: const Icon(Icons.question_mark_outlined, color: Colors.white, size: 30,

                          )
                         ),

                        verticalSpacer(20),
                        customRowSettingsContainer(
                          icon: const Icon(Icons.feedback, color: Colors.white, size: 24),
                          text: "Feedback and Support",
                          textStyle: const TextStyle(
                            fontSize: 16,
                            color: AppColors.white,
                          ),
                          textColor: AppColors.white,
                          iconColor: AppColors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          avatarRadius: 20.r,
                        ),
                        verticalSpacer(20),
                        GestureDetector(
                          onTap: (){
                            Get.to(()=> TermsAndConditions());
                          },
                          child:  customRowSettingsContainer( icon: const Icon(Icons.description, color: Colors.white, size: 24),
                            text: "Terms & Conditions",
                            textStyle: const TextStyle(
                              fontSize: 16,
                              color: AppColors.white,
                            ),
                            textColor: AppColors.white,
                            iconColor: AppColors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            avatarRadius: 20.r,
                          ),
                        ),
                        verticalSpacer(20),
                        GestureDetector(
                          onTap: (){
                            Get.to(()=> const AboutAppScreen());
                          },
                          child:  customRowSettingsContainer(
                            icon: const Icon(Icons.info_outline, color: Colors.white, size: 24),
                            text: "About App",
                            textStyle: const TextStyle(
                              fontSize: 16,
                              color: AppColors.white,
                            ),
                            textColor: AppColors.white,
                            iconColor: AppColors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            avatarRadius: 20.r,
                          ),
                        ),



                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox.shrink(),
            ],
          ),
        ),
      ),

    );
  }


  Widget customRowSettingsContainer(
     {
    required String text,
     Widget? icon,
    required TextStyle textStyle,
    required Color textColor,
    required FontWeight fontWeight,
    required double fontSize,
    double avatarRadius = 10,
    double containerWidth = double.infinity,
    double containerHeight = 50.0,
    Color containerColor = Colors.white,
    double borderRadius = 10.0,
    EdgeInsetsGeometry padding = const EdgeInsets.all(8.0),
    double spacing = 8.0,
    Color avatarColor = AppColors.blue,
    Color iconColor = AppColors.white,
    bool showIcon = true,
     String ?assetImagePath,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          radius: avatarRadius,
          backgroundColor: avatarColor,
          child: icon,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: spacing),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: textStyle.copyWith(color: textColor),
                ),
                showIcon
                    ? Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: iconColor,
                  size: 18,
                )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ],
    );
  }


}
