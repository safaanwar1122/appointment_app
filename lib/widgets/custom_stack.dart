import 'package:appointment_app/export.dart';
Widget customStack({
  required Widget icon,
  required String title,
  required TextStyle titleStyle,
  required Widget image,
}){
  return Stack(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          icon,
          Text(title,
          style: titleStyle,
          ),
          Padding(padding: const EdgeInsets.only(right: 8.0),
          child: image,
          ),
        ],
      )
    ],
  );
}