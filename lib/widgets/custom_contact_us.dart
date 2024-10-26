import 'dart:ui';

import 'package:flutter/material.dart';


// ignore: must_be_immutable
class CustomElevatedButton extends StatelessWidget {
  double horizontal;
  double vertical;
  Color backgroundColor;
  Color borderColor;
  String textInside;
  Color textColor;
   CustomElevatedButton({
    required this.backgroundColor,
    required this.textColor,
    required this.textInside,
    required this.borderColor,
    required this.horizontal,
    required this.vertical,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(6.0), 
    ),
    backgroundColor: backgroundColor,
    minimumSize: const Size(100, 40), 
    padding:  EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical), 
    side:  BorderSide(color: borderColor),
      ),
      child:  Text(textInside,style:  TextStyle(fontWeight: FontWeight.bold,color: textColor,fontSize: 13),),
    );
  }
}