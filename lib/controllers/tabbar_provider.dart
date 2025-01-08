import 'package:appointment_app/export.dart';


class TabProvider with ChangeNotifier {
  String _selectedTab = 'Upcoming';

  String get selectedTab => _selectedTab;

  void setSelectedTab(String tab) {
    _selectedTab = tab;
    notifyListeners();
  }
}