import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/auth_provider.dart';
import '../controllers/chat_provider.dart';
import '../controllers/notification_card_provider.dart';

class RegisterAllProviders {
  static get allProvidersList => [
    ChangeNotifierProvider(create: (_) => AuthProvider()),
    ChangeNotifierProvider(create: (_) => ChatProvider()),
    ChangeNotifierProvider(create: (_)=>NotificationCardProviderColor()),
  ];
}