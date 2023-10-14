import 'package:flutter/material.dart';

class BackArrow extends StatelessWidget {
  final GestureTapCallback? onTap;
  const BackArrow({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(30)
        ),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.arrow_back, size: 30,),
        ),
      ),
    );
  }

}