part of 'sign_up_bloc.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();
  @override
  List<Object> get props => [];
}

class SignUpInitial extends SignUpState {}

class SignUpSuccefuly extends SignUpState {}

class SignUpFailed extends SignUpState {
  final String message;
  const SignUpFailed({required this.message});

  @override
  List<Object> get props => [message];
}

class SignUpStart extends SignUpState {}

