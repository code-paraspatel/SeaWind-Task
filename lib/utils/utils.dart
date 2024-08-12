

import 'package:flutter/material.dart';

class Utils{

  showCircularProgressbar(BuildContext context){
    return showDialog(context: context, builder: (_) =>  Center(child: CircularProgressIndicator(color: Colors.pink.withOpacity(0.7),),),);
  }

  showShankBar(BuildContext context,{required String msg}){
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content:
            Text(msg,style: const TextStyle(color: Colors.white),),
            backgroundColor: Colors.pink.withOpacity(0.8),
            ));
  }

}