

import 'package:flutter/material.dart';


class InputField extends StatelessWidget {
  const InputField(
      {super.key, required this.controller, required this.autoFocus});

  final TextEditingController controller;
  final bool autoFocus;

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: autoFocus,
      controller: controller,
      maxLength: 1,
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 25),
      keyboardType: TextInputType.number,
      cursorColor: Colors.blue.shade400,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(bottom: 10,top: 10,right:12.5,left: 12.5),
        constraints: const BoxConstraints(
            maxHeight: 60,
            maxWidth: 50
        ),
        fillColor: Colors.grey.shade200,
        filled: true,
        counterText: '',
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: Colors.black45)
        ),
      ),
      onChanged: (value) {
        if (value.length == 1) {
          FocusScope.of(context).nextFocus();
        }else if(value.isEmpty){
          FocusScope.of(context).previousFocus();
        }

      },
    );
  }
}
