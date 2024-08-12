

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesServices extends ChangeNotifier {

  saveAuth() async {
    SharedPreferences sp=await SharedPreferences.getInstance();
     sp.setBool("isLogin" , true);
    notifyListeners();
  }

 Future<bool> getAuthData() async {
    SharedPreferences sp=await SharedPreferences.getInstance();
    bool? isLogin = sp.getBool("isLogin");
    notifyListeners();
    return isLogin ?? false ;
  }

  Future logOutUser ()async{
    SharedPreferences sp=await SharedPreferences.getInstance();
    sp.remove("isLogin");
    notifyListeners();
    return sp.clear();
  }


}