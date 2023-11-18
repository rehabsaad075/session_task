import 'package:flutter/material.dart';

import '../screens/addNewTask_screen.dart';

class ElevatedButtonCustom extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  final double ?width;
  const ElevatedButtonCustom({
    Key? key,required this.onPressed,
    required this.text,
    this.width=250
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: SizedBox(
        height: 50,
        width: width,
        child: ElevatedButton(
            onPressed:onPressed,
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)
                )
            ),
            child:  Text(
              text,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20
              ),
            )
        ),
      ),
    );
  }
}
