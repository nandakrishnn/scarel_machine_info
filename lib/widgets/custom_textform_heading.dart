import 'package:flutter/material.dart';

class TextFormHeadingWidget extends StatelessWidget {
  String heading;
   TextFormHeadingWidget({
    required this.heading,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Text(heading,style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold),);
  }
}
