


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:provider/provider.dart';
import 'package:task_seawind/utils/routes/routes.dart';
import 'package:task_seawind/utils/utils.dart';

import '../services/auth_services.dart';

class PhoneFieldProvider extends ChangeNotifier{

   FirebaseAuth _auth = FirebaseAuth.instance;
  PhoneNumber? _phoneNumber;

  PhoneNumber? get phoneNumber => _phoneNumber;

  setPhoneNumber (PhoneNumber phone){
    _phoneNumber = phone;
    notifyListeners();
  }

  String? _verificationId ;

  phoneAuth(BuildContext context, String phoneNumber)async{
    Utils().showCircularProgressbar(context);
  try{
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (phoneAuthCredential) {

      },
      verificationFailed: (error) {
        Navigator.pop(context);
        Utils().showShankBar(context, msg: error.toString());
      },
      codeSent: (verificationId, forceResendingToken) {
        Navigator.pop(context);
        Navigator.pushNamed(context, AppRoutes.otpScreen);
        _verificationId = verificationId;
        notifyListeners();
      },
      codeAutoRetrievalTimeout: (error) {
        Navigator.pop(context);
        Utils().showShankBar(context, msg: error.toString());
      },);
  }catch(e){
    Navigator.pop(context);
     Utils().showShankBar(context, msg: e.toString());
  }
  }



  otpVerification(BuildContext context , String otp)async{
    Utils().showCircularProgressbar(context);
    final credential=PhoneAuthProvider.credential(
        verificationId: _verificationId.toString(),
        smsCode: otp);
    try{
      await _auth.signInWithCredential(credential).then((value) async {
        Utils().showShankBar(context, msg: "Login Successfully");
        Navigator.pop(context);
        await context.read<SharedPreferencesServices>().saveAuth();
        Navigator.pushNamedAndRemoveUntil(context, AppRoutes.countryScreen,(route) => false,);
      });
    }catch(e){
      Navigator.pop(context);
      Utils().showShankBar(context, msg: e.toString());
    }
  }



}