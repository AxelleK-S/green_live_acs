part of 'routing_bloc.dart';

abstract class RoutingState extends Equatable {
  late Widget page;

}

class RoutingInitial extends RoutingState {

  static const String _accessTokenKey = 'email';


 late Widget addFarmPage;

  RoutingInitial(FirebaseFirestore db , UserRepository userRepository) {
      super.page = LoadPage();
      SharedPreferences.getInstance().then((value) {
        bool isAuthenticated  = value.containsKey(_accessTokenKey);
        print("home aweet homwe");
        if (isAuthenticated) {
          print("nice to meet you");
          super.page = Accueil(db);
        } else {
          print("bad news");
          super.page = LoginPage();
        }

      });

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
    super.page = LoginPage();
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
class RoutingAddFarm extends RoutingState {
  var index;

  RoutingAddFarm(index) {
    super.page = AddFormPage();
    this.index = index ;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [index , super.page];

}
class RoutingHome extends RoutingState {

  RoutingHome(Widget page){
    super.page = page;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
