import 'package:appointment_app/export.dart';
Widget customRowContainer({
  required String assetImagePath,
  required String text,
IconData? icon,
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
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [

        CircleAvatar(
          radius: avatarRadius,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage(assetImagePath),
        ),
      CircleAvatar(
        backgroundColor: AppColors.white,
        // radius: containerHeight/2,
        child: SvgPicture.asset(
          assetImagePath,
          fit: BoxFit.scaleDown,
          width: avatarRadius,
          height: avatarRadius,
        ),
      ),
      Expanded(
        child: Padding(
          padding: EdgeInsets.only(left: spacing.w),
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
                      size: 18.sp,
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    ],
  );
}
