import 'package:appointment_app/export.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';


class MapUserDataScreen extends StatefulWidget {
  const MapUserDataScreen({super.key});

  @override
  State<MapUserDataScreen> createState() => _MapUserDataScreenState();
}

class _MapUserDataScreenState extends State<MapUserDataScreen> {
   TextEditingController birthDateController = TextEditingController();
   final TextEditingController usernameController = TextEditingController();
   final TextEditingController contactController = TextEditingController();
   final TextEditingController locationController = TextEditingController();

late Position currentPosition;
  String? selectedGender;
  bool _isLoading = false;
  String? _emailError;
   String? _latitude;
   String? _longitude;
  final List<String> genders = ['Male', 'Female', 'Other'];
/*void getLocation()async{
  await Geolocator.checkPermission();
  await Geolocator.requestPermission();
  Position position=await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.low,
  );
  print(position);
}*/

  String? _currentAddress;
  Position? _currentPosition;

  Future<bool> _handleLocationPermission() async {
  //  bool serviceEnabled;
    LocationPermission permission;
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled, show a message or prompt to enable
      return false;
    }

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }


  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
      _getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
        _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      String address= _currentAddress =
      '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';

      setState(() {
        _currentAddress= address;
        });
      locationController.text=address;
    }).catchError((e) {
      debugPrint(e);
    });
  }



  Future<void> selectedDate(BuildContext context)async{
  final DateTime? selectedDate=await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now());
  if(selectedDate!=null){
    setState(() {
      //
      birthDateController.text=selectedDate.toString();
    });
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
          padding: EdgeInsets.only(left: 15.w, right: 65.w, top: 23.h, bottom: 10.h),
          child: Column(
            children: [
              verticalSpacer(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: AppColors.blue.withOpacity(0.2),
                      child: const Icon(Icons.arrow_back, color: AppColors.white),
                    ),
                  ),
                  Center(
                    child: customText(
                      text: AppConstants.completeYourProfile,
                      fontWeight: FontWeight.w500,
                      fontSize: 24.sp,
                      color: Colors.black,
                    ),
                  ),
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
              // Avatar Section (Unchanged)
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      radius: 62.r,
                      backgroundColor: AppColors.lightGrey,
                      child: SvgPicture.asset(AppImages.userIcon, fit: BoxFit.scaleDown, width: 76.w, height: 76.h),
                    ),
                    Positioned(
                      bottom: 5.h,
                      right: 5.w,
                      child: SizedBox(
                        width: 37.w,
                        height: 37.h,
                        child: SvgPicture.asset(AppImages.pencil, fit: BoxFit.scaleDown),
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpacer(15),
              customTextField(
                controller:usernameController,
                hintText: "Enter full name..",
                hintStyle: TextStyle(color: AppColors.grey, fontSize: 16.sp, fontWeight: FontWeight.w300),
                contentPadding: EdgeInsets.only(left: 5.w),
                prefixIcon: SvgPicture.asset(AppImages.user, width: 18.w, height: 14.h, fit: BoxFit.scaleDown),
             //   onChanged: (value) => profileData['name'] = value,
              ),
              customTextField(
                controller: contactController,
                hintText: "Enter contact no..",
                hintStyle: TextStyle(color: AppColors.grey, fontWeight: FontWeight.w300, fontSize: 16.sp),
                prefixIcon: SvgPicture.asset(AppImages.call, width: 16.w, height: 19.h, fit: BoxFit.scaleDown),
             //   onChanged: (value) => profileData['contact'] = value, contentPadding: null,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 176.w,
                    child: GestureDetector(
                      onTap: ()=>selectedDate(context),
                      child: AbsorbPointer(
                        child: customTextField(
                          controller: birthDateController,
                          hintText: "Date of Birth",

                          prefixIcon: SvgPicture.asset(AppImages.calender, width: 18.w, height: 14.h, fit: BoxFit.scaleDown),

                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 144.w,
                    child:  DropdownButtonHideUnderline(
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
              Text('LAT: ${_currentPosition?.latitude ?? ""}'),
              Text('LNG: ${_currentPosition?.longitude ?? ""}'),
              Text('ADDRESS: ${_currentAddress ?? ""}'),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _getCurrentPosition,
                child: const Text("Get Current Location"),
              ),

            /* customTextField(
               controller: locationController,
               hintText: "Add Location",
               prefixIcon: SvgPicture.asset(AppImages.location, width: 16.w, height: 19.h, fit: BoxFit.scaleDown),
               suffixIcon: const Icon(Icons.keyboard_arrow_down),

             ),*/
              verticalSpacer(60),
              customButton(
                label: 'COMPLETE PROFILE',
                onPressed: _isLoading ? () {} : () {
                  Map<String, dynamic> profileData = {
                    'name': usernameController.text,
                    'contact': contactController.text,
                    'location': locationController.text,
                    'birthDate': birthDateController.text,
                    'gender': selectedGender,
                  };
                  print(profileData);
                  Get.to(()=>const HostScreen());
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

























