import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/auth_provider.dart';

class RegisterAllProviders {
  static get allProvidersList => [
    ChangeNotifierProvider(create: (_) => AuthProvider()),
    ChangeNotifierProvider(create: (_) => ChatProvider()),
  ];
}