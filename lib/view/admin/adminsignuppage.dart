import 'package:firebase_application/view/admin/adminloginpage.dart';

import 'package:firebase_application/view/util/utils.dart';
import 'package:firebase_application/view/user/validatenumberpage.dart';
import 'package:firebase_application/view/widgets/roundbutton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class AdminSignUPPage extends StatefulWidget {
  const AdminSignUPPage({super.key});

  @override
  State<AdminSignUPPage> createState() => _AdminSignUPPageState();
}

class _AdminSignUPPageState extends State<AdminSignUPPage> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();

  final databaseref = FirebaseDatabase.instance.ref('adminDetails');
  // TextEditingController nameController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin signup Page"),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 30,
          ),
          Form(
            key: formkey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                        hintText: " company Name",
                        prefixIcon: const Icon(Icons.person),
                        contentPadding: const EdgeInsets.all(15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        const SnackBar(
                          content: Text("enter company name"),
                        );
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: numberController,
                    decoration: InputDecoration(
                        hintText: "Number",
                        prefixIcon: const Icon(Icons.dialpad),
                        contentPadding: const EdgeInsets.all(15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        const SnackBar(
                          content: Text("enter number"),
                        );
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                        hintText: "Email",
                        prefixIcon: const Icon(Icons.email_outlined),
                        contentPadding: const EdgeInsets.all(15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        const SnackBar(
                          content: Text("enter email"),
                        );
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: addressController,
                    decoration: InputDecoration(
                        hintText: "address",
                        prefixIcon: const Icon(Icons.home),
                        contentPadding: const EdgeInsets.all(15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        const SnackBar(
                          content: Text("enter address"),
                        );
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: cityController,
                    decoration: InputDecoration(
                        hintText: "city",
                        prefixIcon: const Icon(Icons.location_city),
                        contentPadding: const EdgeInsets.all(15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        const SnackBar(
                          content: Text("enter city"),
                        );
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: pincodeController,
                    decoration: InputDecoration(
                        hintText: "pincode",
                        prefixIcon: const Icon(Icons.location_pin),
                        contentPadding: const EdgeInsets.all(15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        const SnackBar(
                          content: Text("enter pincode"),
                        );
                      }
                      return null;
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
                        return "enter password";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  RoundedButtton(
                      title: "Sign up",
                      onTap: () {
                        if (formkey.currentState!.validate()) {
                          _auth
                              .createUserWithEmailAndPassword(
                                  email: emailController.text.toString(),
                                  password: passwordController.text.toString())
                              .then((value) {
                            // Utils().toastmessage("varify your mobile number");
                          }).onError((error, stackTrace) {
                            Utils().toastmessage(error.toString());
                          });
                          
                        }
                        databaseref.child(index.toString()).set({
                          'name': nameController.text.toString(),
                          'email': emailController.text.toString(),
                          'number': numberController.text.toString(),
                          'address': addressController.text.toString(),
                          'city': cityController.text.toString(),
                          'pincode': pincodeController.text.toString(),
                          'password':passwordController.text.toString()
                        }).then((value) {
                          Utils().toastmessage("sucussesful entry");
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const AdminLoginPage();
                          }));
                        }).onError((error, stackTrace) {
                          Utils().toastmessage(error.toString());
                        });
                        index++;
                      
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  RoundedButtton(
                      title: "varify number",
                      onTap: () {
                       
                        _auth.verifyPhoneNumber(
                            phoneNumber: numberController.text.toString(),
                            verificationCompleted: (_) {},
                            verificationFailed: (e) {
                              Utils().toastmessage(e.toString());
                            },
                            codeSent: (String varification, int? token) {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return ValidateNumber(
                                  varificationId: varification,
                                );
                              }));
                            },
                            codeAutoRetrievalTimeout: (e) {
                              Utils().toastmessage(e.toString());
                            });
                      })
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
