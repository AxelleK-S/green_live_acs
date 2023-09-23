part of 'sign_up_bloc.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();
}

class SignUpInitial extends SignUpState {
  @override
  List<Object> get props => [];
}

class SignUpSuccefuly extends SignUpState {
  @override
  List<Object> get props => [];
}

class SignUpFailed extends SignUpState {
  @override
  List<Object> get props => [];
}

class SignUpStart extends SignUpState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

