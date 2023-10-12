part of 'data_manage_bloc.dart';

abstract class DataManageEvent extends Equatable {
  String? credentials ;

   DataManageEvent({required this.credentials});
}
class DataManageLoadEvent extends DataManageEvent {
  DataManageLoadEvent({required super.credentials});

  @override
  // TODO: implement props
  List<Object?> get props => [credentials];
}

class DataManageRenewCredential extends DataManageEvent{
  DataManageRenewCredential({required super.credentials});



  @override
  // TODO: implement props
  List<Object?> get props => [credentials];

}
