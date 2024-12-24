import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier{
  final List<String> favoriteDoctorId=[];
  final List<String> favoriteDoctors=[];
  bool isFavorite(String doctorId)
  {
    return favoriteDoctorId.contains(doctorId);
  }
  void toggleFavorite(String doctorId){
    if(isFavorite(doctorId)){
      favoriteDoctorId.remove(doctorId);
    }
    else {
      favoriteDoctorId.add(doctorId);
    }
    notifyListeners();
  }
  List<String> getFavoriteDoctors(){
    return favoriteDoctors;}
}