import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:eraasoft_first_project/ToDoApp/screens/tasks_screen.dart';
import 'package:flutter/material.dart';


class ToDoSplashScreen extends StatelessWidget {
  const ToDoSplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        duration: 2000,
        splash: ('assets/images/todo.jpg'),
        nextScreen: const TasksScreen(),
        splashIconSize: 200,
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Colors.black
    );
  }
}
