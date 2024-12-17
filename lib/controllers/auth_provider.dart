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
  bool isSenderTurn = true;

  void addMessage(String message) {
    messages.add(ChatMessage(
      message: message,
      sender: isSenderTurn ? 'You' : 'Receiver',
      timestamp: DateTime.now(),
      isSentByUser: isSenderTurn,
    ));
    isSenderTurn = !isSenderTurn;
    notifyListeners();
  }
}




