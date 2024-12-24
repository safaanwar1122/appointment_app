import 'dart:ui';
import 'package:appointment_app/export.dart';
import '../controllers/export_controller.dart';
import '../screen/favorite_doctor_screen.dart';

Widget doctorCard({
  required String imagePath,
  required String doctorId,
  required String doctorName,
  required String specialization,
  required VoidCallback onBookTap,
  required VoidCallback onFavoriteTap,
  bool isFavorite = false,
  required String favouriteIconPath,
  required String startIcon,
}) {
  return Consumer<FavoriteProvider>(
      builder: (context, favoriteProvider, child){
        bool isFavorite=favoriteProvider.isFavorite(doctorId);
        return GestureDetector(
          onTap: (){
            favoriteProvider.toggleFavorite(doctorId);
            if(isFavorite){
              Get.to(()=>const FavoriteDoctorScreen());
            }
          },
          child: Container(
            width: 169.w,
            height: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 10.w, ),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: AppColors.grey.withOpacity(0.2),
                  spreadRadius: 1.r,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                )
              ],
            ),
            child: Stack(
              children: [
                Positioned(
                    top: 8.h,
                    right: 2.w,
                    child: GestureDetector(
                        onTap: (){
                          favoriteProvider.toggleFavorite(doctorId);
                        },
                        child: Icon(isFavorite?Icons.favorite:Icons.favorite_border,
                          color: isFavorite?AppColors.red:AppColors.grey,
                          size: 24.w,)
                    )
                ),

                Positioned.fill(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 100.h,
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            CircleAvatar(
                              radius: 40.r,
                              backgroundImage: AssetImage(imagePath),
                            ),
                            Positioned(
                              top: 66.h,
                              child: Center(
                                child: Container(
                                  width: 70.w,
                                  height: 30.h,
                                  decoration: BoxDecoration(
                                    color: AppColors.ashBlue,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(AppImages.starIcon),
                                      horizontalSpacer(4),
                                      customText(
                                          text: '4.9',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                          color: AppColors.black)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      verticalSpacer(8),
                      customText(
                        text: doctorName,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: AppColors.black,

                      ),
                      verticalSpacer(4),
                      customText(
                          text: specialization,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: AppColors.black),

                      // verticalSpacer(2),
                      SizedBox(
                        width: 82.w,
                        height: 36.h,
                        child: ElevatedButton(
                            onPressed: onBookTap,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                            ),
                            child: customText(
                                text: "Book",
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: AppColors.white)),
                      ),
                    ],
                  ),
                ),


              ],
            ),
          ),
        );
      });
}