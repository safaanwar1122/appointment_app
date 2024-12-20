import 'package:appointment_app/controllers/auth_provider.dart';
import 'package:appointment_app/screen/appointment_screen.dart';
import 'package:appointment_app/screen/book_appointment_screen.dart';
import 'package:appointment_app/screen/calender_page.dart';
import 'package:appointment_app/screen/dynamic_chat_screen.dart';
import 'package:appointment_app/screen/static_chat_inbox_screen.dart';
import 'package:appointment_app/screen/splash_screen.dart';
import 'package:appointment_app/utils/providers_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'controllers/chat_provider.dart';

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
               home: BookAppointmentScreen(),
             // home: SplashScreen(),
             // home: CalendarPage(),
            );
          },
        ),
      ),
    );
  }
}
