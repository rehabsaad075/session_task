

import 'package:eraasoft_first_project/ToDoApp/view_model/cubits/todo_cubit/todo_cubit.dart';
import 'package:eraasoft_first_project/ToDoApp/view_model/data/loacl/shared_preferences.dart';
import 'package:eraasoft_first_project/ToDoApp/view_model/data/network/diohelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ToDoApp/view/screens/show_statistics_screen.dart';
import 'ToDoApp/view/screens/todo_splash_screen.dart';
import 'ToDoApp/view_model/cubits/bloc_observer/bloc_observer.dart';


void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await LocalData.init();
  await DioHelper.init();
  LocalData.clear();
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
        home: ToDoSplashScreen(),
      ),
    );
  }
}
