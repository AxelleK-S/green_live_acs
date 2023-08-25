part of 'routing_bloc.dart';

abstract class RoutingEvent extends Equatable {
  const RoutingEvent();
}
class RoutingMainEvent extends RoutingEvent{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
 class ViewDashboard extends RoutingEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];

 }
