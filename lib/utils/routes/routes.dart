


import 'package:flutter/cupertino.dart';
import 'package:task_seawind/screens/auth_screen/login_screen.dart';
import 'package:task_seawind/screens/auth_screen/otp_screen.dart';
import 'package:task_seawind/screens/city_screen/city_screen.dart';
import 'package:task_seawind/screens/country_screen/country_screen.dart';
import 'package:task_seawind/screens/home_screen/home_screen.dart';

import '../../screens/splesh_screen/splesh_screen.dart';

class AppRoutes {
  static const String spleshScreen = "splesh_screen";
  static const String loginScreen = "login_screen";
  static const String otpScreen = "otp_screen";
  static const String countryScreen = "country_screen";
  static const String cityScreen = "city_screen";
  static const String homeScreen = "home_screen";



  // navigate routes first method
  static Map<String, WidgetBuilder> get routes =>
      {
        spleshScreen: (context) => const SpleshScreen(),
        loginScreen: (context) => const LoginScreen(),
        otpScreen: (context) => const OtpScreen(),
        countryScreen: (context) => const CountryScreen(),
        cityScreen: (context) => const CityScreen(),
        homeScreen: (context) => const HomeScreen(),


      };
}