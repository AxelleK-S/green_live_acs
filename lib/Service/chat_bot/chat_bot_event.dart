part of 'chat_bot_bloc.dart';

abstract class MessageEvent extends Equatable {
  const MessageEvent();
}
class MessageSend extends MessageEvent {
  final String message;
  const MessageSend({required this.message});
  @override
  // TODO: implement props
  List<Object?> get props => [message];
}