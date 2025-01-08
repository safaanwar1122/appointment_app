import 'package:appointment_app/export.dart';

class UserDataProvider extends ChangeNotifier {
  String? usernameError;
  String? contactError;
  String? locationError;
  String? birthDateError;
  String? genderError;
  String? selectedGender;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  bool validateForm({
    required String username,
    required String contact,
    required String location,
    required String birthDate,
    required String? gender,
  }) {

    if (username.isEmpty) {
      usernameError = "Username is required";
    } else if (!_isValidName(username)) {
      usernameError =
          "Invalid name format. No special characters or numbers allowed";
    } else {
      usernameError = null;
    }
    locationError = location.isEmpty ? "Location is required" : null;
    contactError = contact.isEmpty ? "Contact is required" : null;
    birthDateError = birthDate.isEmpty ? "Select Birth date " : null;
    genderError = selectedGender == null || selectedGender!.isEmpty
        ? "Select gender"
        : null;
    notifyListeners();
    return usernameError == null &&
        contactError == null &&
        locationError == null &&
        birthDateError == null &&
        genderError == null;
  }

  void updateGender(String? gender) {
    selectedGender = gender;
    notifyListeners();
  }

  bool _isValidName(String name) {
    RegExp regExp = RegExp(r'^[a-zA-Z\s]+$');
    return regExp.hasMatch(name);
  }
}
