import 'package:flutter/material.dart';
import 'package:task_seawind/utils/const/asset_image_path.dart';
import 'package:task_seawind/utils/routes/routes.dart';

import '../../main.dart';
import '../../services/auth_services.dart';


class SpleshScreen extends StatefulWidget {
  const SpleshScreen({super.key});

  @override
  State<SpleshScreen> createState() => _SpleshScreenState();
}

class _SpleshScreenState extends State<SpleshScreen> {

  SharedPreferencesServices sharedPreferencesServices = SharedPreferencesServices();
  moveToNextScreen() async {
    bool isLogin = await sharedPreferencesServices.getAuthData();
    await Future.delayed(const Duration(seconds: 3)).then((value) {
      if(isLogin){
        Navigator.pushReplacementNamed(context, AppRoutes.countryScreen);
      }else{
        Navigator.pushReplacementNamed(context, AppRoutes.loginScreen);

      }
    });
   }

   @override
  void initState() {
    moveToNextScreen();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
     body: SizedBox(
       height: mq.height*1,
       width: mq.width*1,
       child: Image(
           image: AssetImage(ImagePath.SpleshScreenPic),
           fit: BoxFit.cover,
       ),
     ),
    );
  }
}
