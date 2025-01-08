import 'package:appointment_app/export.dart';


class FavoriteDoctorScreen extends StatefulWidget {
  const FavoriteDoctorScreen({super.key});

  @override
  State<FavoriteDoctorScreen> createState() => _FavoriteDoctorScreenState();
}

class _FavoriteDoctorScreenState extends State<FavoriteDoctorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(139),
        child: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            width: double.infinity,
            height: 139.h,
            decoration: BoxDecoration(
              color: AppColors.blue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.r),
                bottomRight: Radius.circular(20.r),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 296,
                  top: 0,
                  child: SvgPicture.asset(
                    AppImages.whiteShade,
                  ),
                ),
                Column(
                  children: [
                    verticalSpacer(80),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: CircleAvatar(
                                radius: 15,
                                backgroundColor:
                                    AppColors.white.withOpacity(0.2),
                                child: const Icon(Icons.arrow_back,
                                    color: AppColors.white)),
                          ),
                          const Spacer(),
                          customText(
                            text: AppConstants.favoriteDoctor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white,
                            lineHeight: null,
                          ),
                          horizontalSpacer(160)
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: Consumer<HomeDoctorsProvider>(
        builder: (context, doctorsProvider, child) {
          final favoriteDoctors = doctorsProvider.favoriteDoctors;

          return favoriteDoctors.isEmpty
              ? Center(
                  child: customText(
                    text: 'Your Favorite folder is empty',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: AppColors.black,
                  ),
                )
              : GridView.builder(
                  padding: const EdgeInsets.all(8.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio:
                        0.8,
                  ),
                  itemCount: favoriteDoctors.length,
                  itemBuilder: (context, index) {
                    final doctor = favoriteDoctors[index];
                    return doctorCard(
                      imagePath: AppImages
                          .doctorRyan,
                      doctorId: doctor.name,
                      doctorName: doctor.name,
                      specialization: doctor.specialization,
                      isFavorite: doctor.isFavorite,
                      onBookTap: () {

                      },
                      onFavoriteTap: () {
                        doctorsProvider.toggleFavorite(doctor.name);
                      },
                    );
                  },
                );
        },
      ),
    );
  }
}
