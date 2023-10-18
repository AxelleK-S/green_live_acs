import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_live_acs/page/chat_schema.dart';
import 'package:provider/provider.dart';
import 'package:green_live_acs/Service/chat_bot/chat_bot_bloc.dart';
import 'package:green_live_acs/persistence/ai_api.dart';
import 'package:intl/intl.dart';
import '../model/chat_message.dart';


class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic routes = ModalRoute.of(context)?.settings.arguments ;

    return Provider(
      create: (context) => MessageBloc(chat: Conversation(routes["id"])),
      child: const ChatScreen(),
    );
  }
}

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    TextEditingController controller = TextEditingController();
    String getCurrentTime() {
      var now = DateTime.now();
      var formatter = DateFormat('h:mm a');
      return formatter.format(now);
    }

    List<ChatMessage> messages = [];

    return BlocListener<MessageBloc,MessageState>(
      listener: (context, state) {
        if (state is MessageFailed){
          final snackBar = SnackBar(
            backgroundColor: Colors.red,
            content: Text(state.message,),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      child: BlocBuilder<MessageBloc,MessageState>(
          builder: (context,state){
            print(state.toString());
            if (state is MessageInitial){
              print (state.message);
              messages.add(ChatMessage(text: state.message, date: getCurrentTime(), isUser: false, loading: false));
              return ChatStructure(

                messages: messages,
                controller: controller,
                onSend: () {
                  context.read<MessageBloc>().add(MessageSend(message: controller.text));
                },

                  messages: messages,
                  controller: controller,
                  onSend: () {
                    context.read<MessageBloc>().add(MessageSend(message: controller.text));
                  },

              );
            }
            if (state is MessageLoading){
              messages.add(ChatMessage(text: state.message, date: getCurrentTime(), isUser: true, loading: false));
              messages.add(ChatMessage(text: state.message, date: getCurrentTime(), isUser: false, loading: true));
              return ChatStructure(
                messages: messages,
                controller: controller,
                onSend: () {

                },
              );
            }
            if (state is MessageLoaded){
              messages.removeAt(messages.length - 1);
              //messages.remove(ChatMessage(text: state.message, date: getCurrentTime(), isUser: false, loading: true));
              messages.add(ChatMessage(text: state.message, date: getCurrentTime(), isUser: false, loading: false));
              return ChatStructure(
                messages: messages,
                controller: controller,
                onSend: () {
                  context.read<MessageBloc>().add(MessageSend(message: controller.text));
                },
              );
            }
            else {
              return Container(
                child: Text('hi'),
              );
            }
          }
      ),
    );
  }
}