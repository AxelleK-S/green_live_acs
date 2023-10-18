import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:green_live_acs/Service/chat_bot/chat_bot_bloc.dart';
import 'package:green_live_acs/persistence/ai_api.dart';
import 'package:intl/intl.dart';


import '../component/back_arrow.dart';
import '../component/bot_message.dart';
import '../component/user_message.dart';
import '../model/chat_message.dart';


class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => MessageBloc(chat: Conversation('6262')),
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
              return Scaffold(
                backgroundColor: Colors.white.withOpacity(0.95),
                body: SingleChildScrollView(
                  child: SafeArea(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BackArrow(onTap: () {
                                Navigator.pop(context);
                              },),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text("Gerome", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: width/1.1,
                          height: height/1.4,
                          child: SingleChildScrollView(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: messages.map((message) {
                                  if(message.isUser) {
                                    return UserMessage(text: message.text, date: message.date);
                                  }
                                  return BotMessage(text: message.text, date: message.date, loading: false,);
                                }).toList()
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30)
                            ),
                            child: TextFormField(
                              controller: controller,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                focusColor: Colors.white,
                                hintText: "Ask anything...",
                                hintStyle: TextStyle(color: Colors.grey.shade500, fontWeight: FontWeight.w400),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
                                prefixIcon: IconButton(
                                  onPressed: (){},
                                  icon: const Icon(Icons.attach_file),
                                ),
                                suffixIcon: IconButton(
                                  onPressed: (){
                                    context.read<MessageBloc>().add(MessageSend(message: controller.text));
                                    //messages.add(ChatMessage(text: controller.text, date: getCurrentTime(), isUser: true))  ;
                                  },
                                  icon: const Icon(Icons.send_sharp, size: 30,),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }
            if (state is MessageLoading){
              messages.add(ChatMessage(text: state.message, date: getCurrentTime(), isUser: true, loading: false));
              messages.add(ChatMessage(text: state.message, date: getCurrentTime(), isUser: false, loading: true));
              return Scaffold(
                backgroundColor: Colors.white.withOpacity(0.95),
                body: SingleChildScrollView(
                  child: SafeArea(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BackArrow(onTap: () {
                                Navigator.pop(context);
                              },),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text("Gerome", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: width/1.1,
                          height: height/1.4,
                          child: SingleChildScrollView(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: messages.map((message) {
                                  if(message.isUser) {
                                    return UserMessage(text: message.text, date: message.date);
                                  }
                                  return BotMessage(text: message.text, date: message.date, loading: message.loading,);
                                }).toList()
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30)
                            ),
                            child: TextFormField(
                              controller: controller,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                focusColor: Colors.white,
                                hintText: "Ask anything...",
                                hintStyle: TextStyle(color: Colors.grey.shade500, fontWeight: FontWeight.w400),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
                                prefixIcon: IconButton(
                                  onPressed: (){},
                                  icon: const Icon(Icons.attach_file),
                                ),
                                suffixIcon: IconButton(
                                  onPressed: (){
                                    //null no action because it is loading
                                  },
                                  icon: const Icon(Icons.send_sharp, size: 30,),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }
            if (state is MessageLoaded){
              messages.removeLast();
              messages.add(ChatMessage(text: state.message, date: getCurrentTime(), isUser: false, loading: false));
              return Scaffold(
                backgroundColor: Colors.white.withOpacity(0.95),
                body: SingleChildScrollView(
                  child: SafeArea(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BackArrow(onTap: () {
                                Navigator.pop(context);
                              },),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text("Gerome", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: width/1.1,
                          height: height/1.4,
                          child: SingleChildScrollView(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: messages.map((message) {
                                  if(message.isUser) {
                                    return UserMessage(text: message.text, date: message.date);
                                  }
                                  return BotMessage(text: message.text, date: message.date, loading: false,);
                                }).toList()
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30)
                            ),
                            child: TextFormField(
                              controller: controller,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                focusColor: Colors.white,
                                hintText: "Ask anything...",
                                hintStyle: TextStyle(color: Colors.grey.shade500, fontWeight: FontWeight.w400),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
                                prefixIcon: IconButton(
                                  onPressed: (){},
                                  icon: const Icon(Icons.attach_file),
                                ),
                                suffixIcon: IconButton(
                                  onPressed: (){
                                    context.read<MessageBloc>().add(MessageSend(message: controller.text));
                                    //messages.add(ChatMessage(text: controller.text, date: getCurrentTime(), isUser: true))  ;
                                  },
                                  icon: const Icon(Icons.send_sharp, size: 30,),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
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
