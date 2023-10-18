part of 'chat_bot_bloc.dart';


abstract class MessageState extends Equatable {
  const MessageState();
}

class MessageInitial extends MessageState {
  //final List<String> messages;
  const MessageInitial();
      //this.messages);
  @override
  List<Object> get props => [];
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
