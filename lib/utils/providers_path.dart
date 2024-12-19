import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/auth_provider.dart';
import '../controllers/chat_provider.dart';
import '../controllers/container_state_provider.dart';
import '../controllers/notification_card_provider.dart';
import '../controllers/text_field_provider.dart';

class RegisterAllProviders {
  static get allProvidersList => [
    ChangeNotifierProvider(create: (_) => AuthProvider()),
    ChangeNotifierProvider(create: (_) => ChatProvider()),
    ChangeNotifierProvider(create: (_)=>NotificationCardProviderColor()),
    ChangeNotifierProvider(create: (_)=>ContainerStateProvider(),),
    ChangeNotifierProvider(create: (_)=>TextFieldProvider()),
  ];
}