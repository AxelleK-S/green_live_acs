part of 'login_bloc.dart';


abstract class LoginState {
  late Widget page;
  RoutingState() {}
}

class LoginInitial extends LoginState {
  UserRepository userRepository;

  LoginInitial({required this.userRepository}){
    super.page = LoginPage();
  }
}
class LoginPressed extends LoginState{
  LoginPressed(){
    super.page = LoadPage();
  }
}
class LoginSucefull extends LoginState{
  LoginSucefull({required FirebaseFirestore db}){
    super.page =Accueil(db,);
  }
  // LoginInitial(){
  //   super.page = LoadPage();
  // }

}

class LoginFailed extends LoginState{



}