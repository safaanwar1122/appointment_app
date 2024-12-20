import 'package:appointment_app/export.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 5), () {
        Get.offAll(() => const OnBoardingScreen());
      });
    });

    return ScreenUtilInit(
      designSize: const Size(393, 852),
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.blue,
          body: Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                child: SvgPicture.asset(
                  AppImages.shade2,
                  width: 0.3.sw,
                  fit: BoxFit.scaleDown,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: SvgPicture.asset(
                  AppImages.shade1,
                  width: 0.3.sw,
                  fit: BoxFit.scaleDown,
                ),
              ),
              Center(
                child: SvgPicture.asset(
                  AppImages.splashScreen,
                  height: 0.4.sh,
                  width: 0.8.sw,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
