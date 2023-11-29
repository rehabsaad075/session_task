part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitialState extends AuthState {}

class RegisterLoadingState extends AuthState {}
class RegisterSuccessState extends AuthState {}
class RegisterErrorState extends AuthState {}

class LoginLoadingState extends AuthState {}
class LoginSuccessState extends AuthState {}
class LoginErrorState extends AuthState {}


class RegisterWithFirebaseLoadingState extends AuthState{}
class RegisterWithFirebaseSuccessState extends AuthState{}
class RegisterWithFirebaseErrorState extends AuthState{}

class LoginWithFirebaseLoadingState extends AuthState{}
class LoginWithFirebaseSuccessState extends AuthState{}
class LoginWithFirebaseErrorState extends AuthState{}
