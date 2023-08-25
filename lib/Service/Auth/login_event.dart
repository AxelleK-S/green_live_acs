part of 'login_bloc.dart';


abstract class LoginEvent extends Equatable {}


class LoginEmit extends LoginEvent{
  String email;

  String password;


  LoginEmit({required this.email,required this.password});
  @override
  // TODO: implement props
  List<Object?> get props =>[];





}


