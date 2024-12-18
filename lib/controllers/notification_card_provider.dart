import 'package:appointment_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class NotificationCardProviderColor extends ChangeNotifier{
  bool isTapped=false;


  Color get containerColor => isTapped? AppColors.lavender: AppColors.white;
  void toggleTap()
  {
    isTapped=! isTapped;
    notifyListeners();
  }
}