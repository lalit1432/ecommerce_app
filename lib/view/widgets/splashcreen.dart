import 'package:firebase_application/controller/splashscreencontroller.dart';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Splashcreencontroller splashscreen = Splashcreencontroller();
  @override
  void initState() {
   
    super.initState();
    splashscreen.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("loading...",style: TextStyle( 
          fontSize: 30,
          fontWeight: FontWeight.bold
        ),),
      ),
    );
  }
}
