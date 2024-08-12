import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:provider/provider.dart';
import 'package:task_seawind/provider/phone_field_provider.dart';
import 'package:task_seawind/utils/utils.dart';
import 'package:task_seawind/utils/widget/my_button.dart';

import '../../main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  PhoneNumber? phoneNumber;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: mq.height * 0.1,
                ),
                Text.rich(TextSpan(
                    text: "Login",
                    style: TextStyle(
                      fontSize: mq.width * 0.08,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                          text: "  with\n",
                          style: TextStyle(
                              fontSize: mq.width * 0.05,
                              fontWeight: FontWeight.w100,
                              fontStyle: FontStyle.italic)),
                      TextSpan(
                          text: "Phone Number",
                          style: TextStyle(
                            fontSize: mq.width * 0.08,
                            fontWeight: FontWeight.bold,
                          )),
                    ])),
                SizedBox(
                  height: mq.height * 0.1,
                ),
                Text(
                  "Enter Your Phone Number",
                  style: TextStyle(color: Colors.black.withOpacity(0.5)),
                ),
                SizedBox(
                  height: mq.height * 0.01,
                ),
                IntlPhoneField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(20),
                      fillColor: Colors.grey.shade200,
                     hintText: "EX - 7359826382",
                      filled: true,
                      counterText: '',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      )),
                  initialCountryCode: 'IN',
                  onChanged: (phone) {
                    context.read<PhoneFieldProvider>().setPhoneNumber(phone);
                  },
                ),
                SizedBox(
                  height: mq.height * 0.07,
                ),
                Consumer<PhoneFieldProvider>(
                  builder: (context, value, child) {
                    return Align(
                      alignment: Alignment.center,
                      child: MyButton(
                        btHeight: mq.height * 0.06,
                        btWidth: mq.width * 0.5,
                        btText: "Login",
                        borderRad: mq.height * 0.01,
                        voidCallback: () {
                          if (value.phoneNumber!.number.length == 10) {
                            value.phoneAuth(context,
                                value.phoneNumber!.completeNumber.toString());
                          } else {
                            Utils().showShankBar(context, msg: "Enter a Valid Phone Number");
                          }
                        },
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
