import 'package:appointment_app/export.dart';
Widget customRowText({
  required String initialText,
  required TextStyle initialTextStyle,
  required String actionText,
  required TextStyle actionTextStyle,
  required VoidCallback onActionTap,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        initialText,
        style: initialTextStyle,
      ),
      const SizedBox(width: 4),
      GestureDetector(
        onTap: onActionTap,
        child: Text(
          actionText,
          style: actionTextStyle,
        ),
      ),
    ],
  );
}
