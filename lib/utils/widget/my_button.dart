
import 'package:flutter/material.dart';


class MyButton extends StatelessWidget {
  const MyButton({super.key,
    this.btColor=Colors.pink,
    required this.btHeight,
    required this.btWidth,
    required this.btText,
      this.borderRad = 10,
    this.icon = false,
    required this.voidCallback,
    this.btTextSize=16});

  final double btTextSize;
  final Color btColor;
  final double  btHeight;
  final double  btWidth;
  final String btText;
  final double borderRad;
  final VoidCallback voidCallback;
  final bool icon;



  @override
  Widget build(BuildContext context) {
    return Container(
      height:btHeight ,
      width: btWidth,
      decoration: BoxDecoration(
        color: btColor,
        borderRadius: BorderRadius.circular(borderRad)
      ),
     
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRad))
          ),
          onPressed: voidCallback,
          child: icon ?
                    Row(
            children: [
              const Spacer(),
              Text(
                btText.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: btTextSize,
                ),
              ),
              const Spacer(),
              const CircleAvatar(
                radius: 13,
                backgroundColor: Colors.pink,
                child: Icon(Icons.arrow_forward_outlined),
              )
            ],
          ) :
              Text(
            btText.toString(),
            style: TextStyle(
              color: Colors.white,
              fontSize: btTextSize,
            ),
          ),),
    );
  }
}
