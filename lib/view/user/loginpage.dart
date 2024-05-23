import 'package:firebase_application/view/admin/adminloginpage.dart';
import 'package:firebase_application/view/user/homepage.dart';
import 'package:firebase_application/view/user/siguppage.dart';
import 'package:firebase_application/view/util/utils.dart';
import 'package:firebase_application/view/widgets/roundbutton.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void logIn() {
    _auth
        .signInWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text.toString())
        .then((value) {
      Utils().toastmessage("login sucussesful");
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const HomePage();
      }));
    }).onError((error, stackTrace) {
      Utils().toastmessage(error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("LoginPage"),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(children: [
            const SizedBox(
              height: 100,
            ),
         
            const SizedBox(
              height: 10,
            ),
            Form(
              key: formkey,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                        hintText: "Gmail",
                        prefixIcon: const Icon(Icons.email_outlined),
                        contentPadding: const EdgeInsets.all(15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "enter valid Gmail";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                        hintText: "Password",
                        prefixIcon: const Icon(Icons.password),
                        contentPadding: const EdgeInsets.all(15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "enter valid password";
                      } else {
                        return null;
                      }
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            RoundedButtton(
                title: "submit",
                onTap: () {
                  if (formkey.currentState!.validate()) {
                    logIn();
                    
                  }
                }),
            const SizedBox(
              height: 20,
            ),
              RoundedButtton(title: "Go to Admin Login", onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){ 
              return const AdminLoginPage();
            }));
           }),
           const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account"),
                const SizedBox(
                  width: 5,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const SignUPPage();
                      }));
                    },
                    child: const Text(
                      "sign up",
                      style: TextStyle(color: Colors.deepPurple),
                    ))
              ],
            )
          ])),
    );
  }
}
