part of 'routing_bloc.dart';

abstract class RoutingEvent extends Equatable {
  const RoutingEvent();
}
class RoutingMainEvent extends RoutingEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
 class ViewDashboard extends RoutingEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];

 }

 class AddForm extends RoutingEvent {
  var index;

  AddForm({required this.index});

   @override
   // TODO: implement props
   List<Object?> get props => [];
 }


 class Login extends RoutingEvent {
   @override
   // TODO: implement props
   List<Object?> get props => [];
 }

 class GoHome extends RoutingEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];


 }