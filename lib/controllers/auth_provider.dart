import 'dart:core';
import 'package:flutter/material.dart';

import '../screen/static_chat_inbox_screen.dart';
import '../models/chat_message_model.dart';

class AuthProvider extends ChangeNotifier {
  late bool _isLoading = false;
  String? _emailError;


  bool isPasswordVisible = false;

  bool togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
    return isPasswordVisible;
  }

}

class ChatProvider extends ChangeNotifier {
  List<ChatMessage> messages = [];
  bool isUserTurn = true;

  void addMessage(String message) {
    messages.add(ChatMessage(
      message: message,
      sender: isUserTurn ? 'You' : 'Receiver',
      timestamp: DateTime.now(),
      isSentByUser: isUserTurn,
    ));
    isUserTurn = !isUserTurn;
    notifyListeners();
  }
}




