import 'package:flutter/material.dart';

class RoundedButtton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const RoundedButtton({super.key, required this.title,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      
      child: Container(
        width: 300,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.deepPurple, borderRadius: BorderRadius.circular(10)),
        child: Text(title,style: const TextStyle(color: Colors.white),),
      ),
    );
  }
}
