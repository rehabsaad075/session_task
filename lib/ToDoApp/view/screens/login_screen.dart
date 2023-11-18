import 'package:eraasoft_first_project/ToDoApp/view/componets/elevated_button_custom.dart';
import 'package:eraasoft_first_project/ToDoApp/view/componets/textFormField_custom.dart';
import 'package:eraasoft_first_project/ToDoApp/view/screens/register_screen.dart';
import 'package:eraasoft_first_project/ToDoApp/view/screens/tasks_screen.dart';
import 'package:eraasoft_first_project/ToDoApp/view_model/cubits/Auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'show_statistics_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocProvider(
        create: (context) => AuthCubit(),
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            AuthCubit authCubit=AuthCubit.get(context);
            return SafeArea(
              child: Form(
                key: authCubit.formKey,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(15),
                  children: [
                    const Text(
                      'Login',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.yellow,
                          fontWeight: FontWeight.bold,
                          fontSize: 24
                      ),
                    ),
                    const SizedBox(height: 15,),
                    CircleAvatar(
                      radius: 70,
                      backgroundColor: Colors.grey[800],
                      child: const Icon(
                        Icons.person,
                        color: Colors.yellow,
                        size: 100,
                      ),
                    ),
                    const SizedBox(height: 15,),
                    const SizedBox(height: 15,),
                    TextFormFieldCustom(
                      labelText: 'Email',
                      icon: Icons.email,
                      controller: authCubit.emailController,
                      validator: (value){
                        if(value!.isEmpty){
                          return'email must not be  empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15,),
                    TextFormFieldCustom(
                      labelText: 'Password',
                      icon: Icons.visibility,
                      keyboardType: TextInputType.phone,
                      obscureText: true,
                      controller: authCubit.passwordController,
                      validator: (value){
                        if(value!.isEmpty){
                          return'password must not be  empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15,),
                    const SizedBox(height: 15,),
                    ElevatedButtonCustom(
                      onPressed: () {
                        if(authCubit.formKey.currentState!.validate()){
                          authCubit.login().then((value) =>
                              Navigator.push(context,
                                  MaterialPageRoute(
                                      builder: (context)=>const ShowStatisticsScreen())
                              )
                          );
                        }
                      },
                      text: 'login',
                    ),
                    const SizedBox(height: 15,),
                    ElevatedButtonCustom(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(
                                builder: (context)=>const RegisterScreen())
                        );
                      },
                      text: 'Register',
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
