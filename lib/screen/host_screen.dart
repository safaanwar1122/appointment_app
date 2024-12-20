import 'package:appointment_app/export.dart';

class HostScreen extends StatefulWidget {
  const HostScreen({super.key});

  @override
  State<HostScreen> createState() =>
      _HostScreenState();
}

class _HostScreenState extends State<HostScreen> {
  int pageIndex = 0;
  final List<Widget> pages = [
    const HomeScreen(),
    const AppointmentScreen(),
    const ChatScreen(),
    const ProfileScreen(),
  ];
  void onTapHandler(int index) {
    setState(() {
      pageIndex = index;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: pages.elementAt(pageIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: onTapHandler,
        selectedItemColor: AppColors.blue,
        unselectedItemColor: AppColors.black,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.white,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppImages.homeIcon,
                width: 24.w,
                height: 24.h,
                color: pageIndex == 0 ? AppColors.blue : AppColors.black,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppImages.calender,
                width: 24.w,
                height: 24.h,
                color: pageIndex == 1 ? AppColors.blue : AppColors.black,
              ),
              label: 'Appointment'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppImages.chatIcon,
                width: 24.w,
                height: 24.h,
                color: pageIndex == 2 ? AppColors.blue : AppColors.black,
              ),
              label: 'Chat'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppImages.user,
                width: 24.w,
                height: 24.h,
                color: pageIndex == 3 ? AppColors.blue : AppColors.black,
              ),
              label: 'Profile'),
        ],
      ),
    );
  }
}
