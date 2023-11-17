import 'package:eraasoft_first_project/spent_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class TextCustom extends StatelessWidget {
  final String text;
  final double ?fontSize;
  final FontWeight ?fontWeight;
  final Color? color;
  const TextCustom({Key? key, required this.text, this.fontSize, this.fontWeight, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight:fontWeight ,
        color: color,
      ),
    );
  }
}
