import 'package:appointment_app/export.dart';
import 'package:intl/intl.dart';


class UserDataScreenUsingSnackBarProvider extends StatefulWidget {
  const UserDataScreenUsingSnackBarProvider({super.key});

  @override
  State<UserDataScreenUsingSnackBarProvider> createState() =>
      _UserDataScreenUsingSnackBarProviderState();
}

class _UserDataScreenUsingSnackBarProviderState
    extends State<UserDataScreenUsingSnackBarProvider> {


  final TextEditingController birthDateController = TextEditingController();
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    userDataProvider = Provider.of<UserDataProvider>(context, listen: false);
  }
  final bool _isLoading = false;
  UserDataProvider? userDataProvider;
  final List<String> genders = ['Male', 'Female', 'Other'];

  Future<void> selectedDate(BuildContext context) async {
    final DateTime? selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2025, 12, 31));
        if (selectedDate != null) {
      setState(() {
        //
        birthDateController.text = DateFormat('dd-MM-yyyy').format(selectedDate);
      });
    }
  }



  Future<void> getCurrentLocation(
      TextEditingController locationController) async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      await Geolocator.requestPermission();
      return;
    }

    try {
      Position currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );

      List<Placemark> placemarks = await placemarkFromCoordinates(
        currentPosition.latitude,
        currentPosition.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        String address =
            "${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}";

        locationController.text = address;
      } else {
        locationController.text = "No address found.";
      }
    } catch (e) {
      locationController.text = "Error: $e";
    }
  }



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
          child: Consumer<UserDataProvider>(
            builder: (context, userDataProvider, child ){
              return Column(
                children: [
                  Center(
                    child: Stack(
                      alignment: Alignment.center,
                      //clipBehavior: Clip.none,
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
                  customTextFieldUsingSnackBar(
                    controller: userDataProvider.usernameController,
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
                    padding:
                    EdgeInsets.symmetric(horizontal: 0.5.w, vertical: 7.h),
                    errorText: userDataProvider.usernameError,
                    textStyle: const TextStyle(
                      color: AppColors.iconColor,
                    ),
                  ),
                  TextField(
                    controller: userDataProvider.contactController,
                    keyboardType:
                    const TextInputType.numberWithOptions(decimal: false),
                    style: const TextStyle(
                      color: AppColors.iconColor,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Enter contact no..',
                      errorText: userDataProvider.contactError,
                      hintStyle: TextStyle(
                        color: AppColors.grey,
                        fontWeight: FontWeight.w300,
                        fontSize: 16.sp,
                        height: 2.h,
                      ),
                      contentPadding: EdgeInsets.only(left: -1, top: 8.h),
                      prefixIcon: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 6.h, horizontal: 13.w),
                        child: SvgPicture.asset(
                          AppImages.call,
                          width: 16.w,
                          height: 19.h,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
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
                      border: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.lightGrey,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 0.w, right: 0.w),
                        child: SizedBox(
                          width: 160.w,
                          child: GestureDetector(
                            onTap: () => selectedDate(context),
                            child: AbsorbPointer(
                              child: customTextFieldUsingSnackBar(
                                controller: birthDateController,
                                hintText: "Enter DOB",
                                contentPadding:
                                EdgeInsets.symmetric(horizontal: 1.w),
                                prefixIcon: SvgPicture.asset(AppImages.calender,
                                    width: 18.w,
                                    height: 14.h,
                                    fit: BoxFit.scaleDown),
                                errorText: userDataProvider.birthDateError,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.zero,
                        child: SizedBox(
                          width: 160.w,
                          child: Padding(
                            padding: EdgeInsets.zero,
                            child: Column(
                              children: [
                                InputDecorator(
                                    decoration: InputDecoration(
                                      contentPadding:
                                      EdgeInsets.only(left: 5.w),
                                      isDense: true,
                                      errorText: userDataProvider
                                          .genderError, // Show genderError here

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
                                        borderSide: BorderSide(
                                            color: AppColors.lightGrey),
                                      ),
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        value:
                                        userDataProvider.selectedGender,
                                        isExpanded: true,
                                        hint: customText(
                                            text: 'Gender',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: AppColors.grey),
                                        onChanged: (String? newValue) {
                                          userDataProvider
                                              .updateGender(newValue);
                                          userDataProvider.validateForm(
                                            username: userDataProvider.usernameController.text,
                                            contact: userDataProvider.contactController.text,
                                            location: userDataProvider.locationController.text,
                                            birthDate:
                                            birthDateController.text,
                                            gender: newValue,
                                          );
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
                                          padding:
                                          EdgeInsets.only(right: 4.w),
                                          child: const Icon(
                                              Icons.keyboard_arrow_down),
                                        ),
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  customTextFieldUsingSnackBar(
                    controller: userDataProvider.locationController,
                    hintText: "Add Location",
                    hintStyle: TextStyle(
                      color: AppColors.grey,
                      fontWeight: FontWeight.w300,
                      fontSize: 16.sp,
                      height: 2.h,
                    ),
                    contentPadding: const EdgeInsets.only(left: -1.0),
                    errorText: userDataProvider.locationError,
                    prefixIcon: SvgPicture.asset(
                      AppImages.location,
                      width: 16.w,
                      height: 19.h,
                      fit: BoxFit.scaleDown,
                    ),
                    padding: EdgeInsets.symmetric(vertical: 5.h),
                    textStyle: const TextStyle(
                      color: AppColors.iconColor,
                    ),
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                  ),
                  verticalSpacer(60),
                  customButton(
                    label: 'COMPLETE PROFILE',
                    onPressed: _isLoading
                        ? () {}
                        : () {
                      if (userDataProvider.usernameController.text.isEmpty) {
                        showSnackBar(context, 'Please enter full name');
                        return;
                      }
                      if (!userDataProvider.validateForm(
                        username: userDataProvider.usernameController.text,
                        contact: userDataProvider.contactController.text,
                        location: userDataProvider.locationController.text,
                        birthDate: birthDateController.text,
                        gender: userDataProvider.selectedGender,
                      )) {
                        showSnackBar(
                          context,
                          userDataProvider.usernameError ??
                              userDataProvider.contactError ??
                              userDataProvider.locationError ??
                              userDataProvider.birthDateError ??
                              userDataProvider.genderError ??
                              'Please fill all fields correctly.',
                        );
                        return;
                      }
                      Get.to(() => const HostScreen());
                    },
                    buttonColor: AppColors.blue,
                    textColor: AppColors.white,
                    width: 300.w,
                    height: 48.h,
                    showProgress: _isLoading,
                  ),
                  verticalSpacer(50),
                  ElevatedButton(
                    onPressed: () {
                      getCurrentLocation(userDataProvider.locationController);
                    },
                    child: const Text('Get Location'),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

Widget customTextFieldUsingSnackBar({
  required TextEditingController controller,
  EdgeInsetsGeometry? padding,
  TextStyle? textStyle,
  TextStyle? hintStyle,
  String? hintText,
  Widget? prefixIcon,
  Widget? suffixIcon,
  String? errorText,
  String? label,
  String? labelText,
  TextInputType? keyboardType,
  EdgeInsets? contentPadding,
  bool isPasswordField = false,
  Function(dynamic value)? onChanged,
  Future<Null> Function()? onTap,
  bool? readOnly,
  int? maxLines,
}) {
  return Padding(
    padding:
        padding ?? EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: controller,
          style: textStyle ?? TextStyle(fontSize: 16.sp),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: hintStyle ?? TextStyle(fontSize: 16.sp),
            prefixIcon: prefixIcon,
            labelText: labelText,
            labelStyle: TextStyle(fontSize: 16.sp),
            border: const UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.lightGrey)),
            enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.lightGrey)),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.lightGrey),
            ),
          ),
        ),
      ],
    ),
  );
}
