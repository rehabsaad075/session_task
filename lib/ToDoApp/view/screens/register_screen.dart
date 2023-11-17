import 'package:eraasoft_first_project/ToDoApp/view_model/cubits/Auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../componets/elevated_button_custom.dart';
import '../componets/textFormField_custom.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(
          color: Colors.yellow
        ),
      ),
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
                      'Register',
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
                     TextFormFieldCustom(
                      labelText: 'Name',
                      icon: Icons.person,
                      controller: authCubit.nameController,
                       validator: (value){
                        if(value!.isEmpty){
                          return'name must not be empty';
                        }
                        return null;
                       },
                    ),
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
                       controller: authCubit.passwordController,
                       validator: (value){
                         if(value!.isEmpty){
                           return'password must not be  empty';
                         }
                         return null;
                       },
                    ),
                    const SizedBox(height: 15,),
                     TextFormFieldCustom(
                      labelText: 'Password confirmation',
                      icon: Icons.visibility,
                       controller: authCubit.passwordConfirmationController,
                       autovalidateMode: AutovalidateMode.onUserInteraction,
                       validator: (value){
                         if(value!.isEmpty){
                           return'password_confirmation must not be empty';
                         }else if(value !=authCubit.passwordController.text){
                           return 'password not match';
                         }
                         return null;
                       },
                    ),
                    const SizedBox(height: 15,),
                    ElevatedButtonCustom(
                      onPressed: () {
                        if(authCubit.formKey.currentState!.validate()){
                          authCubit.register().then((value) => Navigator.pop(context));
                        }
                      },
                      text: 'Register',
                    )
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
