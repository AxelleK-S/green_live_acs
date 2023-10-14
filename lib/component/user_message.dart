import 'package:flutter/material.dart';

class UserMessage extends StatelessWidget {
  final String text;
  final String date;

  const UserMessage({super.key, required this.text, required this.date});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: width/1.35,
          decoration: const BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20), bottomLeft: Radius.circular(20))
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("You", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),),
                Text(text, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w300),),
              ],
            ),
          ),
        ),
        const SizedBox(height: 5,),
        Text(date, style: const TextStyle(color: Colors.grey),)
      ],
    );
  }

}