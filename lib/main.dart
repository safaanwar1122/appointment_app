import 'package:appointment_app/controllers/auth_provider.dart';
import 'package:appointment_app/export.dart';
import 'package:appointment_app/screen/appointment_screen.dart';
import 'package:appointment_app/screen/appointment_screen_using_provider.dart';
import 'package:appointment_app/screen/chat_screen_using_provider.dart';
import 'package:appointment_app/screen/favorite_doctor_screen.dart';
import 'package:appointment_app/screen/home_screen.dart';
import 'package:appointment_app/screen/login_screen_using_provider.dart';
import 'package:appointment_app/screen/map_user_data_screen.dart';
import 'package:appointment_app/screen/sign_up_screen_using_provider.dart';
import 'package:appointment_app/screen/splash_screen.dart';
import 'package:appointment_app/screen/user_data_screen.dart';
import 'package:appointment_app/utils/providers_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: RegisterAllProviders.allProvidersList,
      child: ScreenUtilInit(
        designSize: const Size(393, 852),
        child: Consumer<AuthProvider>(
          builder: (context, controller, child) {
            return GetMaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
                textTheme: GoogleFonts.interTextTheme(
                  Theme.of(context).textTheme,
                ),
              ),
              debugShowCheckedModeBanner: false,
               //home:const UserDataScreen(),
               //home: const BookAppointmentScreen(),
             // home: ChatScreenUsingProvider(),
             //home: const SplashScreen(),
              home: BookAppointmentScreen(),
             // home:const FavoriteDoctorScreen(),
              //home: const HomeScreen(),
             // home: const MapUserDataScreen(),
             // home:const  UserDataScreen(),
             // home:const AppointmentScreenUsingProvider(),
            //  home: const SignUpScreen(),
             // home:const AppointmentScreen(),
              //home: const LoginScreenUsingProvider(),
             // home:  const SignUpScreenUsingProvider(),
            );
          },
        ),
      ),
    );
  }
}
