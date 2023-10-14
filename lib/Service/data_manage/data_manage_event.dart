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
  List<Object?> get props => [credentials
  ];

}

class DataManageMonthEvent extends DataManageEvent{
  DataManageMonthEvent({required super.credentials});

  @override
  // TODO: implement props
  List<Object?> get props => [];
  
}

class DataManageYearEvent extends DataManageEvent{
  DataManageYearEvent({required super.credentials});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class DataManageWeekEvent extends DataManageEvent{
  DataManageWeekEvent({required super.credentials});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
  
class DataManageDayEvent extends DataManageEvent {
  DataManageDayEvent({required super.credentials});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
  
