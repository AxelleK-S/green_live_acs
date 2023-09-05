part of 'navigate_bloc.dart';

@immutable
abstract class NavigateState {
  late Widget page;
  
}

class NavigateInitial extends NavigateState {
  
  NavigateInitial(FirebaseFirestore db){
    super.page = AddFarmPage(db: db);
  }
  
}

class NavigateCulture extends NavigateState{
  NavigateCulture(FirebaseFirestore db){
    super.page = CulturePage();
  }
}

