
import 'package:appointment_app/export.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() =>
      _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {



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
                      text: AppConstants.myProfile,
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
                       GestureDetector(
                         onTap: (){
                           Get.to(()=> const UserDataScreen());
                         },
                         child:  customRowContainer(
                           assetImagePath: AppImages.blueUser,
                           text: "Update Profile",
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
                            Get.to(()=>const FavoriteDoctorScreen());
                          },
                          child: customRowContainer(
                            assetImagePath: AppImages.heart,
                            text: "Favourite",
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
                          Get.to(()=>const StripPaymentMethodScreen());
                        },
                        child:  customRowContainer(
                          assetImagePath: AppImages.wallet,
                          text: "Payment Method",
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
                           Get.to(()=> const PrivacyPolicyScreen());
                         },
                         child:  customRowContainer(
                           assetImagePath: AppImages.blueLock,
                           text: "Privacy Policy",
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
                           Get.to(()=> const SettingsScreen());
                         },
                         child:  customRowContainer(
                           assetImagePath: AppImages.settings,
                           text: "Settings",
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
                            Get.to(()=> const HelpScreen());
                          },
                          child: customRowContainer(
                            assetImagePath: AppImages.questionMark,
                            text: "Help",
                            textStyle: const TextStyle(
                              fontSize: 16,
                              color: AppColors.white,
                            ),
                            textColor: AppColors.white,
                            iconColor: AppColors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            avatarRadius: 20.r,
                            showIcon: true,
                          ),
                        ),
                        verticalSpacer(20),
                        customRowContainer(
                          assetImagePath: AppImages.logout,
                          text: "Logout",
                          textStyle: const TextStyle(
                            fontSize: 16,
                            color: AppColors.white,
                          ),
                          textColor: AppColors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          avatarRadius: 20.r,
                          showIcon: false,
                        ),
                        verticalSpacer(20),
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
}
