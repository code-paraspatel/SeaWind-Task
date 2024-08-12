import 'package:flutter/material.dart';
import 'package:task_seawind/provider/category_list_provider.dart';
import 'package:task_seawind/provider/city_list_provider.dart';
import 'package:task_seawind/provider/country_list_provider.dart';
import 'package:task_seawind/provider/phone_field_provider.dart';
import 'package:task_seawind/provider/slider_list_provider.dart';
import 'package:task_seawind/services/auth_services.dart';
import 'package:task_seawind/utils/const/app_theme.dart';
import 'package:task_seawind/utils/routes/routes.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


late Size mq;
void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>PhoneFieldProvider()),
        ChangeNotifierProvider(create: (_)=>CountryListProvider()),
        ChangeNotifierProvider(create: (_)=>CityListProvider()),
        ChangeNotifierProvider(create: (_)=>CategoryListProvider()),
        ChangeNotifierProvider(create: (_)=>SliderListProvider()),
        ChangeNotifierProvider(create: (_)=>SharedPreferencesServices()),
      ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppThemeClass.appTheme,
      initialRoute: AppRoutes.spleshScreen,
      routes: AppRoutes.routes,
    );
  }
}

