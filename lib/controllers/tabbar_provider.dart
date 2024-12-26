import 'package:appointment_app/export.dart';


class TabProvider with ChangeNotifier {
  String _selectedTab = 'Upcoming'; // Default screen

  String get selectedTab => _selectedTab;

  void setSelectedTab(String tab) {
    _selectedTab = tab;
    notifyListeners();
  }
}