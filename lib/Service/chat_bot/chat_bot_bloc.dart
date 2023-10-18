import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../persistence/ai_api.dart';

part 'chat_bot_event.dart';
part 'chat_bot_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  bool clicked = false;
  final Conversation chat;
  MessageBloc({required this.chat}) : super(const MessageInitial()) {
    on<MessageSend>((event, emit) async {
      // TODO: implement event handler
      emit(MessageLoading(event.message));
      String response = await chat.answer(event.message);
      emit(MessageLoaded(response));
    });
  }
}


