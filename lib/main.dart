import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopper_project2/auth/exploreus_screen.dart';
import 'package:shopper_project2/auth/on_boarding.dart';
import 'package:shopper_project2/auth/signin_screen.dart';
import 'package:shopper_project2/auth/verify_code.dart';
import 'package:shopper_project2/prefs/shared_pref_controller.dart';
import 'package:shopper_project2/screens/bn_screens/home_screen.dart';
import 'package:shopper_project2/screens/main_screen.dart';
import 'package:shopper_project2/screens/product_details_screen.dart';
import 'package:shopper_project2/screens/profile/faq.dart';
import 'package:shopper_project2/screens/profile/contact_request.dart';
import 'package:shopper_project2/screens/profile/personal_info.dart';
import 'package:shopper_project2/screens/profile/settings.dart';

import 'auth/create_account_screen.dart';
import 'auth/forget_password_screen.dart';
import 'auth/launch.dart';

import 'auth/welcome.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initPref();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: () => GetMaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [Locale('en', ''), Locale('ar', '')],
        locale: const Locale('en'),
        debugShowCheckedModeBanner: false,
        initialRoute: '/launch_screen',
        //initialRoute: '/verify_code',
        routes: {
          /*    AUTH SCREENS     */
          '/launch_screen': (context) => LaunchScreen(),
          '/welcome_screen': (context) => Welcome(),
          '/OnBoarding': (context) => OnBoarding(),
          '/Explore_screen': (context) => Explore(),
          '/Sign_in': (context) => SignIn(),
          '/create_account': (context) => CreateAccount(),
          '/forget_password': (context) => ForgetPassword(),
          //'/verify_code'  :(context)=> VerifyCode(),

          '/home_screen': (context) => Home(),
          '/main_screen': (context) => MainScreen(),

          /*  Profile screens*/

          '/personal_info': (context) => PersonalInfo(),
          '/settings': (context) => Settings(),
          '/faq': (context) => FAQ(),
          '/contact_request': (context) => ContactRequest(),

          /* Products*/
          // '/product_details': (context) => ProductDetailsScreen(),
        },
      ),
    );
  }
}
