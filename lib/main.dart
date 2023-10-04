

import 'package:flutter/material.dart';

import 'ToDoApp/screens/toDoHome_screen.dart';
import 'bottom_navigation_bar/bottom_navigation_screen.dart';
import 'first_task/first_screen.dart';
import 'first_task/fourth_screen.dart';
import 'gridView/gridView_screen.dart';
import 'listView/listView_screen.dart';
import 'first_task/second_screen.dart';
import 'tabBar/tabBar_screen.dart';
import 'first_task/third_screen.dart';

void main(){
  runApp(const FirstProject());
}

class FirstProject extends StatelessWidget {
  const FirstProject({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  ToDoHomeScreen(),
    );
  }
}
