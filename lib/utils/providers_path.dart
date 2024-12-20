import 'package:appointment_app/export.dart';

class RegisterAllProviders {
  static get allProvidersList => [
    ChangeNotifierProvider(create: (_) => AuthProvider()),
    ChangeNotifierProvider(create: (_) => ChatProvider()),
    ChangeNotifierProvider(create: (_)=>NotificationCardProviderColor()),
    ChangeNotifierProvider(create: (_)=>ContainerStateProvider(),),
    ChangeNotifierProvider(create: (_)=>TextFieldProvider()),
  ];
}