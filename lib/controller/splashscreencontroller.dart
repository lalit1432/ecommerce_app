import 'dart:async';

import 'package:firebase_application/view/user/loginpage.dart';
import 'package:flutter/material.dart';


class Splashcreencontroller {
  void isLogin(BuildContext context) {
     Timer(const Duration(seconds: 3), () {
       Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const LoginPage();
      }));
    });
  }
}
