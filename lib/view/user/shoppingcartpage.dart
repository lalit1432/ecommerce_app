import 'package:firebase_application/view/util/utils.dart';
import 'package:firebase_application/view/widgets/roundbutton.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({super.key});

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {

  
  final productableRef = FirebaseDatabase.instance.ref("cartList");
    final orderlistref = FirebaseDatabase.instance.ref('orderList');
     final userDetailsref = FirebaseDatabase.instance.ref('userDetails');
  @override
  Widget build(BuildContext context) {
    // count.text = "1";
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
                child: FirebaseAnimatedList(
                    defaultChild: const Text("Loading..."),
                    query: productableRef,
                    itemBuilder: (context, snapshot, animation, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black, width: 2)),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      "name :",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      snapshot.child('Name').value.toString(),
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      "Description :",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      snapshot
                                          .child('Description')
                                          .value
                                          .toString(),
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      "Rate :",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      snapshot.child('Rate').value.toString(),
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      width: 100,
                                    ),
                                  
                                
                                    
                                    
                                  ],
                                ),
                                Image.network(
                                  snapshot.child('Image').value.toString(),
                                  height: 200,
                                  width: 200,
                                ),
                                const SizedBox(
                                  height: 20,

                                ),
                                RoundedButtton(title: "buy now", onTap: (){
                                  orderlistref.child(index.toString()).set({
                              'Name': snapshot.child('Name').value.toString(),
                              'Image': snapshot.child('Image').value.toString(),
                              'Description':
                                  snapshot.child('Description').value.toString(),
                              'Rate': snapshot.child('Rate').value.toString()
                            }).then((value) {
                              index++;
                              Utils().toastmessage("sucussesful entry");
                            }).onError((error, stackTrace) {
                              Utils().toastmessage(error.toString());
                            });
                                } 

                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
