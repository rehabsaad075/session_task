import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:eraasoft_first_project/ToDoApp/view_model/data/firebase/firebaseKeys.dart';
import 'package:eraasoft_first_project/ToDoApp/view_model/data/loacl/shared_keys.dart';
import 'package:eraasoft_first_project/ToDoApp/view_model/data/loacl/shared_preferences.dart';
import 'package:eraasoft_first_project/ToDoApp/view_model/data/network/diohelper.dart';
import 'package:eraasoft_first_project/ToDoApp/view_model/data/network/endPoints.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../utils/functions.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());

 static AuthCubit get(context)=>BlocProvider.of<AuthCubit>(context);

  var formKey=GlobalKey<FormState>();

  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController passwordConfirmationController=TextEditingController();

 Future<void>register()async {
   emit(RegisterLoadingState());
   await DioHelper.post(
       endPoint: EndPoints.register,
     body:{
         'name':nameController.text,
         'email':emailController.text,
         'password':passwordController.text,
         'password_confirmation':passwordConfirmationController.text
     }
   ).then((value) {
     print(value.data);
     emit(RegisterSuccessState());
     showToast(msg: 'register successfully');
   }).catchError((error){
     showToast(msg: error.toString(),color: Colors.red);
     if(error is DioException){
       print(error.response?.data);
     }
     emit(RegisterErrorState());
     throw error;
   });
 }

  Future<void>login()async {
    emit(LoginLoadingState());
    await DioHelper.post(
        endPoint: EndPoints.login,
        body:{
          'email':emailController.text,
          'password':passwordController.text,
        }
    ).then((value) {
      print(value.data);
      LocalData.set(key:SharedKeys.token,value:value.data['data']['token']);
      emit(LoginSuccessState());
      showToast(msg: 'Login successfully');
    }).catchError((error){
      showToast(msg: error.toString(),color: Colors.red);
      if(error is DioException){
        print(error.response?.data);
      }
      emit(LoginErrorState());
      throw error;
    });
  }

  Future<void>registerWithFirebase()async {
    emit(RegisterWithFirebaseLoadingState());
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text
    ).then((value) async {
      print(value.user?.email);
      showToast(msg: 'register successfully');
      value.user?.updateDisplayName(nameController.text);
      await addUserToFireStore(value);
      emit(RegisterWithFirebaseSuccessState());
    }).catchError((error){
      showToast(msg: error.toString(),color: Colors.red);
      emit(RegisterWithFirebaseErrorState());
      throw error;
    });
  }

  Future<void>loginWithFirebase()async {
    emit(LoginWithFirebaseLoadingState());
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text
    ).then((value){
      print(value.user?.email);
      showToast(msg: 'login successfully');
      LocalData.set(key:SharedKeys.uid,value:value.user?.uid);
      emit(LoginWithFirebaseSuccessState());
    }).catchError((error){
      showToast(msg: error.toString(),color: Colors.red);
      emit(LoginWithFirebaseErrorState());
      throw error;
    });
  }

  Future<void>addUserToFireStore(UserCredential value)async{
  await FirebaseFirestore.instance.collection(FirebaseKeys.users).doc(value.user?.uid).set({
     'name':nameController.text,
     'email':emailController.text,
     'password':passwordController.text,
     'password_confirmation':passwordConfirmationController.text,
     'uid':value.user?.uid
   });
  }
}
