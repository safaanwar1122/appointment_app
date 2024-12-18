import 'package:flutter/material.dart';

import '../models/chat_message_model.dart';


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