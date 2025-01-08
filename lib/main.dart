import 'package:appointment_app/export.dart';

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
              // home:const UserDataScreen(),
           //   home: const AppointmentSuccessfulScreen(),
         //   home: const  UserDataScreenUsingSnackBarProvider(),
               //home: const BookAppointmentScreen(),
            //  home: ChatScreenUsingProvider(),
             home: const SplashScreen(),
              // home: const  BookAppointmentScreen(),
            //  home: const BookAppointmentScreen(),
             // home:const FavoriteDoctorScreen(),
             // home: const HomeScreen(),
             // home: const MapUserDataScreen(),
             // home:const  UserDataScreen(),
             // home: const MapUserDataScreen(),
            // home: PrivacyPolicyScreen(),
            // home:   TermsAndConditions(),
             //home:AboutAppScreen(),
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




















