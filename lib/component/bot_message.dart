import 'package:flutter/material.dart';
import 'package:jumping_dot/jumping_dot.dart';

class BotMessage extends StatelessWidget {
  final String text;
  final String date;
  final bool loading;

  const BotMessage({super.key, required this.text, required this.date, required this.loading});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: width/1.1,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20), bottomRight: Radius.circular(20))
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("GreenBot", style: TextStyle(color: Colors.green, fontSize: 16, fontWeight: FontWeight.bold),),
                loading== true ? JumpingDots(
                  color: Colors.grey,
                  radius: 5,
                  numberOfDots: 3,
                )
                : Text(text, style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w300),),
              ],
            ),
          ),
        ),
        const SizedBox(height: 5,),
        Text(loading == true ? '' : date, style: const TextStyle(color: Colors.grey),)
      ],
    );
  }

}