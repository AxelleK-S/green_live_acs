part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();
}

class SignUpPressed extends SignUpEvent {

  final name;
  final email;
  final password;
  final image ;
  const SignUpPressed(this.name, this.email, this.password, this.image);
  @override
  List<Object> get props => [name, email, password];


}

