import 'package:flutter/material.dart';

class ContainerStateProvider with ChangeNotifier {
  String? _selectedContainer;

  String? get selectedContainer => _selectedContainer;

  void toggleSelection(String containerId) {
    if (_selectedContainer == containerId) {
      _selectedContainer = null;
    } else {
      _selectedContainer = containerId;
    }
    notifyListeners();
  }
}
