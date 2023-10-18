import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../persistence/ai_api.dart';

part 'chat_bot_event.dart';
part 'chat_bot_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  bool clicked = false;
  final Conversation chat;
  MessageBloc({required this.chat}) : super(const MessageInitial("Hello and welcome, i'm Gerome and i will answer your questions")) {
    on<MessageSend>((event, emit) async {
      // TODO: implement event handler
      emit(MessageLoading(event.message));
      String response = await chat.answer(event.message);
      print(response);
      print('message');
      if (response != null){ ///TODO : put the great condition
        emit(MessageLoaded(response));
      } else {
        emit(const MessageFailed('error while sending the message please retry'));
      }
    });
  }
}


