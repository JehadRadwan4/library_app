
import 'package:final_project/constant.dart';
import 'package:flutter/material.dart';

class TwoSideRoundedButton extends StatelessWidget {
  final String ?text;
  final double? radious;
  final Function ?press;
  TwoSideRoundedButton({
 
   this.text,
   this.radious = 29,
  this.press,
  }) ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        press!();
      },
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: kBlackColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(radious!),
            bottomRight: Radius.circular(radious!),
          ),
        ),
        child: Text(
          text!,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}