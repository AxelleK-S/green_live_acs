import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


import '../component/back_arrow.dart';
import '../component/bot_message.dart';
import '../component/user_message.dart';
import '../model/chat_message.dart';


class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

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

    List<ChatMessage> messages = [
      //const ChatMessage(text: "Hello dear, i love you so much", date: "14:21 PM", isUser: true),
      const ChatMessage(text: "Hello and welcome, i'm Gerome and i will answer your questions", date: "14:54 PM", isUser: false)
    ];

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
                        return BotMessage(text: message.text, date: message.date);
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
                          messages.add(ChatMessage(text: controller.text, date: getCurrentTime(), isUser: true))  ;
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
}