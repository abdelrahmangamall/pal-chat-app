part of 'auth_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}
class RegisterLoading extends RegisterState {}
class RegisterSuccess extends RegisterState {

}
class RegisterFailure extends RegisterState {
        String errorMassage;
       RegisterFailure({required this.errorMassage});
}


@immutable
abstract class LoginState{}

class LoginInitial extends LoginState {}
class LoginLoading extends LoginState {}
class LoginSuccess extends LoginState {

}
class LoginFailure extends LoginState {
        String errorMassage;
       LoginFailure({required this.errorMassage});
}
