import 'package:appointment_app/export.dart';

import 'package:appointment_app/controllers/message_call_provider.dart';


import '../controllers/appointment_doctor_provider.dart';
import '../controllers/available_time_provider.dart';
import '../controllers/tabbar_provider.dart';
import '../models/user_data_model.dart';
class RegisterAllProviders {
  static get allProvidersList => [
    ChangeNotifierProvider(create: (_) => AuthProvider()),
    ChangeNotifierProvider(create: (_) => ChatProvider()),
    ChangeNotifierProvider(create: (_)=>NotificationCardProviderColor()),
    ChangeNotifierProvider(create: (_)=>ContainerStateProvider(),),
    ChangeNotifierProvider(create: (_)=>TextFieldProvider()),
    ChangeNotifierProvider(create: (_)=>FavoriteProvider()),
    ChangeNotifierProvider(create: (_)=>HomeDoctorsProvider()),
    ChangeNotifierProvider(create: (_)=>TabProvider()),
    ChangeNotifierProvider(create: (_)=>AppointmentProvider()),
    ChangeNotifierProvider(create: (_)=>MessageCallProvider()),
    ChangeNotifierProvider(create: (_)=>AvailableTimeProvider()),
    ChangeNotifierProvider(create: (_)=> UserDataProvider()),
    ];
}