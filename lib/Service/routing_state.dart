part of 'routing_bloc.dart';

abstract class RoutingState extends Equatable {
  late Widget page;
  RoutingState() {}
}

class RoutingInitial extends RoutingState {

  static const String _accessTokenKey = 'email';


 late Widget addFarmPage;

  RoutingInitial() {
    super.page = LoadPage();
  //  checkAuthenticationStatus();
  }



  @override
  List<Object> get props => [];
}
class RoutingLogin extends RoutingState {
  UserRepository userRepository;

  @override
  // TODO: implement props
  List<Object?> get props => [];

  RoutingLogin({required this.userRepository}) {
    super.page = LoginPage(userRepository: userRepository);
  }

}

class RoutingMain extends RoutingState {
  @override
  // TODO: implement props
  List<Object?> get props => [];

  RoutingMain({required FirebaseFirestore db}) {
    //super.page = AddFarmPage(db: db);
    super.page = Accueil(db);
  }
}
class RoutingDashboard extends RoutingState {
  DashboardPage dashboardPage = DashboardPage();
  RoutingDashboard() {
    super.page = dashboardPage;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [];

}
