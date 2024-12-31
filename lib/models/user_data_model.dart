import 'package:appointment_app/export.dart';

class UserDataProvider extends ChangeNotifier{
  String ? usernameError;
   String ?contactError;
   String ?locationError;
   String? birthDateError;
  bool
  validateForm({
  required String username,
  required String contact,
  required String location,
  required String birthDate,
}){
    usernameError=username.isEmpty?"Username is required": null;
locationError=location.isEmpty? "Location is required": null;
    contactError = contact.isEmpty ? "Contact is required" : null;
    birthDateError=birthDate.isEmpty? "Select Birth date ": null;
    notifyListeners();
    return usernameError==null && contactError==null && locationError==null && birthDateError==null;
  }

}