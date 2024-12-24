
import 'package:appointment_app/export.dart';

import '../widgets/doctor_card.dart';

class FavoriteDoctorScreen extends StatefulWidget {
  const FavoriteDoctorScreen({super.key});

  @override
  State<FavoriteDoctorScreen> createState() => _FavoriteDoctorScreenState();
}

class _FavoriteDoctorScreenState extends State<FavoriteDoctorScreen> {
  @override
  Widget build(BuildContext context) {
    final favoriteDoctors=Provider.of<FavoriteProvider>(context).getFavoriteDoctors();
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
                      text: AppConstants.favoriteDoctor,
                      fontWeight: FontWeight.w500,
                      fontSize: 24.sp,
                      color: Colors.blue,
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
      body: GridView.builder(
        padding: EdgeInsets.all(16),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          ),
          itemCount: favoriteDoctors.length,
          itemBuilder: (context, index){
          final doctorId=favoriteDoctors[index];
          return doctorCard(doctorId: doctorId,
            imagePath:AppImages.doctorRyan,
            doctorName: '',
            specialization: '',
            onBookTap: () {  },
            onFavoriteTap: () {  },
            favouriteIconPath: '', startIcon: '',);
          }),
    );
  }
}
