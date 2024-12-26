import 'package:appointment_app/export.dart';

class UserDataScreen extends StatefulWidget {
  const UserDataScreen({super.key});

  @override
  State<UserDataScreen> createState() => _UserDataScreenState();
}

class _UserDataScreenState extends State<UserDataScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();

  final bool _isLoading = false;
  String? _emailError;
  String? selectedGender;
  final List<String> genders = ['Male', 'Female', 'Other'];

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
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Padding(
          padding:
              EdgeInsets.only(left: 15.w, right: 65.w, top: 23.h, bottom: 10.h),
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
                      backgroundColor: AppColors.blue.withOpacity(0.2),
                      child:
                          const Icon(Icons.arrow_back, color: AppColors.white),
                    ),
                  ),
                  //const Spacer(),
                  horizontalSpacer(1),
                  Center(
                    child: customText(
                      text: AppConstants.completeYourProfile,
                      fontWeight: FontWeight.w500,
                      fontSize: 24.sp,
                      color: Colors.black,
                      lineHeight: null,
                    ),
                  ),
                  // horizontalSpacer(160)
                ],
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 40.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      radius: 62.r,
                      backgroundColor: AppColors.lightGrey,
                      child: SvgPicture.asset(
                        AppImages.userIcon,
                        fit: BoxFit.scaleDown,
                        width: 76.w,
                        height: 76.h,
                      ),
                    ),
                    Positioned(
                      bottom: 5.h,
                      right: 5.w,
                      child: SizedBox(
                        width: 37.w,
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
              verticalSpacer(15),
              customTextField(
                controller: usernameController,
                //obscureText: false,
                hintText: "Enter full name..",
                hintStyle: TextStyle(
                  color: AppColors.grey,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w300,
                  height: 2.2.h,
                ),
                contentPadding: EdgeInsets.only(left: 5.w),
                prefixIcon: SvgPicture.asset(
                  AppImages.user,
                  width: 18.w,
                  height: 14.h,
                  fit: BoxFit.scaleDown,
                ),
                padding: EdgeInsets.symmetric(horizontal: 0.5.w, vertical: 7.h),
                errorText: _emailError,
                textStyle: const TextStyle(
                  color: AppColors.iconColor,
                ),
              ),
              TextField(
                controller: contactController,
                keyboardType: TextInputType.numberWithOptions(decimal: false),
                style: const TextStyle(
                  color: AppColors.iconColor,
                ),
                decoration: InputDecoration(
                  hintText: 'Enter contact no..',
                  hintStyle: TextStyle(
                    color: AppColors.grey,
                    fontWeight: FontWeight.w300,
                    fontSize: 16.sp,
                    height: 2.h,
                  ),
                  contentPadding: const EdgeInsets.only(left: -1),
                  prefix: Padding(padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 13.w),
                  child: SvgPicture.asset(
                    AppImages.call,
                    width: 16.w,
                    height: 19.h,
                    fit: BoxFit.scaleDown,
                  ),),

                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.lightGrey,
                    ),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.lightGrey,
                    ),
                  ),
                  border:  const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.lightGrey,
                    ),
                  ),

                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 160.w,
                    child: customTextField(
                      controller: birthDateController,
                      //obscureText: false,
                      hintText: "Date of Birth",
                      hintStyle: TextStyle(
                        color: AppColors.grey,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w300,
                        height: 2.2.h,
                      ),
                      contentPadding: EdgeInsets.only(left: 5.w),
                      prefixIcon: SvgPicture.asset(
                        AppImages.calender,
                        width: 18.w,
                        height: 14.h,
                        fit: BoxFit.scaleDown,
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 0.5.w, vertical: 7.h),
                      errorText: _emailError,
                      textStyle: const TextStyle(
                        color: AppColors.iconColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 160.w,
                    child: Padding(
                      padding: EdgeInsets.zero,
                      child: Column(
                        children: [
                          InputDecorator(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 5.w),
                              isDense: true,
                              // hintText: selectedGender ?? 'Gender',
                              hintStyle: TextStyle(
                                color: AppColors.grey,
                                fontWeight: FontWeight.w300,
                                fontSize: 16.sp,
                                height: 2.h,
                              ),
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(left: 15.w),
                                child: SvgPicture.asset(
                                  AppImages.user,
                                  width: 24.w,
                                  height: 24.h,
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.lightGrey),
                              ),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: selectedGender,
                                isExpanded: true,
                                hint: customText(
                                    text: 'Gender',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: AppColors.grey),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedGender = newValue;
                                  });
                                },
                                items: genders.map((String gender) {
                                  return DropdownMenuItem<String>(
                                    value: gender,
                                    child: Text(
                                      gender,
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                  );
                                }).toList(),
                                icon: Padding(
                                  padding: EdgeInsets.only(right: 10.w),
                                  child: const Icon(Icons.keyboard_arrow_down),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              customTextField(
                controller: locationController,
                //  obscureText: false,
                hintText: "Add Location",
                hintStyle: TextStyle(
                  color: AppColors.grey,
                  fontWeight: FontWeight.w300,
                  fontSize: 16.sp,
                  height: 2.h,
                ),
                contentPadding: const EdgeInsets.only(left: -1.0),
                prefixIcon: SvgPicture.asset(
                  AppImages.location,
                  width: 16.w,
                  height: 19.h,
                  fit: BoxFit.scaleDown,
                ),
                suffixIcon: Padding(
                  padding: EdgeInsets.only(right: 10.w),
                  child: SizedBox(
                      width: 24.w,
                      height: 24.h,
                      child: const Icon(Icons.keyboard_arrow_down)),
                ),
                padding: EdgeInsets.symmetric(vertical: 5.h),
                textStyle: const TextStyle(
                  color: AppColors.iconColor,
                ),
              ),
              verticalSpacer(60),
              customButton(
                label: 'COMPLETE PROFILE',
                onPressed: _isLoading
                    ? () {}
                    : () {
                        Get.to(() => const HostScreen());
                      },
                buttonColor: AppColors.blue,
                textColor: AppColors.white,
                width: 300.w,
                height: 48.h,
                showProgress: _isLoading,
              ),
              verticalSpacer(50),
            ],
          ),
        ),
      ),
    );
  }
}
