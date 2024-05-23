import 'package:firebase_application/view/admin/adminhomepage.dart';

import 'package:firebase_application/view/util/utils.dart';
import 'package:firebase_application/view/widgets/roundbutton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class AdminValidateNumber extends StatefulWidget {
  final String varificationId;
  const AdminValidateNumber({super.key, required this.varificationId});

  @override
  State<AdminValidateNumber> createState() => _AdminValidateNumberState();
}

class _AdminValidateNumberState extends State<AdminValidateNumber> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController otpCodeControlle = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 150,
            ),
            TextFormField(
              controller: otpCodeControlle,
              decoration: InputDecoration(
                  hintText: "OTP",
                 
                  contentPadding: const EdgeInsets.all(15),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
              validator: (value) {
                if (value!.isEmpty) {
                  return "enter OTP";
                }
                return null;
              },
            ),
            const SizedBox(
              height: 40,
            ),
            RoundedButtton(
                title: "varify",
                onTap: () {
                  final credential = PhoneAuthProvider.credential(
                      verificationId: widget.varificationId,
                      smsCode: otpCodeControlle.text.toString());
                  try {
                    _auth.signInWithCredential(credential);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (contex) {
                      return const AdminHomePage();
                    }));
                  } catch (e) {
                    Utils().toastmessage(e.toString());
                  }
                  Navigator.of(context).pop();
                })
          ],
        ),
      ),
    );
  }
}
