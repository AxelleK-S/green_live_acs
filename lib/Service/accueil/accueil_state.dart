part of 'accueil_bloc.dart';

abstract class AccueilState extends Equatable {
  final Widget page;

  const AccueilState({required this.page});
}

class AccueilInitial extends AccueilState {
  AccueilInitial({required super.page});

  @override
  List<Object> get props => [];
}

class AccueilCulture extends AccueilState{
  AccueilCulture({required super.page});

  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class AccueilProfile extends AccueilState{
  AccueilProfile({required super.page});

  @override
  // TODO: implement props
  List<Object?> get props =>[];

}





