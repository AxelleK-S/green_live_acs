part of 'chat_bot_bloc.dart';


abstract class MessageState extends Equatable {
  const MessageState();
}

class MessageInitial extends MessageState {
  //final List<String> messages;
  final String message;
  const MessageInitial(this.message);
  //this.messages);
  @override
  List<Object> get props => [message];
//messages];
}

class MessageLoaded extends MessageState {
  final String message;
  const MessageLoaded(this.message);
  @override
  List<Object> get props => [message];
}

class MessageLoading extends MessageState {
  final String message;
  const MessageLoading(this.message);
  @override
  List<Object> get props => [message];
}

class MessageFailed extends MessageState {
  final String message;
  const MessageFailed(this.message);
  @override
  List<Object> get props => [message];
}