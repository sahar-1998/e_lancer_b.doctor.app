import 'package:b_doctor_app/database/date_and_time.dart';
import 'package:b_doctor_app/database/db_controller.dart';
import 'package:b_doctor_app/prefs/shared_pref_controller.dart';
import 'package:b_doctor_app/providers/contact_provider.dart';
import 'package:b_doctor_app/providers/language_provider.dart';
import 'package:b_doctor_app/screens/about.dart';
import 'package:b_doctor_app/screens/additional_services_screen.dart';
import 'package:b_doctor_app/screens/contact_screen.dart';
import 'package:b_doctor_app/screens/create_contact_screen.dart';
import 'package:b_doctor_app/screens/home_screen.dart';
import 'package:b_doctor_app/screens/launch_screen.dart';
import 'package:b_doctor_app/screens/login_screen.dart';
import 'package:b_doctor_app/screens/main_screen.dart';
import 'package:b_doctor_app/screens/out_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initPref();
  WidgetsFlutterBinding.ensureInitialized();
  await DbController().initDatabase();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LanguageProvider(),
      child: MyAppMaterial(),
    );
  }
}
class MyAppMaterial extends StatelessWidget {
  const MyAppMaterial({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(390,938),
      builder: () {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider<ContactProvider>(
                create: (_) => ContactProvider()),
            ChangeNotifierProvider<TimeProvider>(create: (_) => TimeProvider()),
          ],
          child: MaterialApp(
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: [Locale('en'), Locale('ar')],
            locale: Locale(Provider.of<LanguageProvider>(context).language),
            debugShowCheckedModeBanner: true,
            initialRoute: '/launch_screen',
            routes: {
              '/launch_screen': (context) => LaunchScreen(),
              '/out_boarding_screen': (context) => OutBoardingScreen(),
              '/login_screen': (context) => LoginScreen(),
              '/home_screen' :(context) =>HomeScreen(),
              '/contact_screen':(context) =>ContactScreen(),
              '/main_screen': (context) => MainScreen(),
              '/create_contact_screen': (context) => CreateContactScreen(),
              '/additional_services_screen' : (context)=>AdditionalServicesScreen(),
              '/about': (context) => About(),


            },
          ),
        );
      },

    );
  }
}
