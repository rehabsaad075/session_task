import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:eraasoft_first_project/ToDoApp/view/screens/login_screen.dart';
import 'package:eraasoft_first_project/ToDoApp/view/screens/tasks_screen.dart';
import 'package:eraasoft_first_project/ToDoApp/view_model/data/loacl/shared_keys.dart';
import 'package:eraasoft_first_project/ToDoApp/view_model/data/loacl/shared_preferences.dart';
import 'package:flutter/material.dart';

import 'register_screen.dart';
import 'show_statistics_screen.dart';


class ToDoSplashScreen extends StatelessWidget {
  const ToDoSplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        duration: 2000,
        splash: ('assets/images/todo.jpg'),
        nextScreen: LocalData.get(key:SharedKeys.token)!=null?const ShowStatisticsScreen():const LoginScreen(),
        splashIconSize: 200,
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Colors.black,
    );
  }
}
