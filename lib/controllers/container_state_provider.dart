import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class ContainerStateProvider with ChangeNotifier {
  String? _selectedContainer; // Tracks the selected container

  String? get selectedContainer => _selectedContainer;

  void toggleSelection(String containerId) {
    if (_selectedContainer == containerId) {
      _selectedContainer = null; // Deselect if the same container is tapped
    } else {
      _selectedContainer = containerId; // Select the tapped container
    }
    notifyListeners();
  }
}
