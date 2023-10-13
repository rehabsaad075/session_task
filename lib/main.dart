

import 'package:eraasoft_first_project/ToDoApp/cubits/toDo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ToDoApp/screens/todo_splash_screen.dart';
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
    return  MultiBlocProvider(
      providers: [
        BlocProvider(create:(context)=> TodoCubit())
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home:  ToDoSplashScreen(),
      ),
    );
  }
}
