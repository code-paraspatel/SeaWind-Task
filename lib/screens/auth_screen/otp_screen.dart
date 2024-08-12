
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_seawind/provider/phone_field_provider.dart';
import 'package:task_seawind/utils/utils.dart';
import 'package:task_seawind/utils/widget/my_button.dart';

import '../../main.dart';
import '../../utils/widget/otp_feild.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController firstC = TextEditingController();
  TextEditingController secC = TextEditingController();
  TextEditingController thirdC = TextEditingController();
  TextEditingController fourC = TextEditingController();
  TextEditingController fiveC = TextEditingController();
  TextEditingController sixC = TextEditingController();


  @override
  void dispose() {
    firstC.dispose();
    secC.dispose();
    thirdC.dispose();
    fourC.dispose();
    fiveC.dispose();
    sixC.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: mq.height * 0.08,
              ),
              Text(
                "Verification",
                style: TextStyle(
                    fontSize: mq.width * 0.08, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: mq.height * 0.03,
              ),
              Consumer<PhoneFieldProvider>(
                builder: (context, phoneFieldProvider, child) {
                return Text(
                  "We've send you the verification \ncode on ${phoneFieldProvider.phoneNumber!.completeNumber}",
                  style: TextStyle(
                      fontSize: 18, color: Colors.black.withOpacity(0.7)),
                );
              },),
              SizedBox(
                height: mq.height * 0.08,
              ),

              // Otp Field
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InputField(
                    controller: firstC,
                    autoFocus: true,
                  ),
                  InputField(
                    controller: secC,
                    autoFocus: false,
                  ),
                  InputField(
                    controller: thirdC,
                    autoFocus: false,
                  ),
                  InputField(
                    controller: fourC,
                    autoFocus: false,
                  ),
                  InputField(
                    controller: fiveC,
                    autoFocus: false,
                  ),
                  InputField(
                    controller: sixC,
                    autoFocus: false,
                  ),
                ],
              ),

              SizedBox(
                height: mq.height * 0.07,
              ),

              // Continue Button
              Align(
                alignment: Alignment.center,
                child: MyButton(
                  btHeight: mq.height * 0.06,
                  btWidth: mq.width * 0.5,
                  btText: "Continue",
                  voidCallback: () {
                    if (firstC.text.isNotEmpty &&
                        secC.text.isNotEmpty &&
                        thirdC.text.isNotEmpty &&
                        fourC.text.isNotEmpty &&
                        fiveC.text.isNotEmpty &&
                        sixC.text.isNotEmpty) {
                      final otp = firstC.text.toString() +
                          secC.text.toString() +
                          thirdC.text.toString() +
                          fourC.text.toString() +
                          fiveC.text.toString() +
                          sixC.text.toString();

                      context
                          .read<PhoneFieldProvider>()
                          .otpVerification(context, otp.toString());
                      Navigator.pop(context);
                    } else {
                      Utils().showShankBar(context, msg: "Enter Valid Otp");
                    }
                  },
                  borderRad: mq.height * 0.01,
                  icon: true,
                ),
              ),
              SizedBox(
                height: mq.height * 0.07,
              ),

              // Resend code Time
              const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Re - send code in 0:20",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

