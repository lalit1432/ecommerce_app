import 'package:firebase_application/view/user/shoppingcartpage.dart';
import 'package:firebase_application/view/util/utils.dart';
import 'package:firebase_application/view/widgets/roundbutton.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController productNameController = TextEditingController();
  TextEditingController productImageController = TextEditingController();
  TextEditingController productDescriprionController = TextEditingController();
  TextEditingController productRateController = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  int index = 0;

  final productableRef = FirebaseDatabase.instance.ref("AdminProductList");
  final cartlistref = FirebaseDatabase.instance.ref('cartList');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Homepage"),
        actions: [ 
          GestureDetector( 
            onTap: () {
              Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const ShoppingCart();
                          }));
            },
            child: const Icon(Icons.shopping_cart_checkout_outlined,
            size: 30,),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
                child: FirebaseAnimatedList(
                    defaultChild: const Center(child:  Text("Loading...",style: TextStyle( 
          fontSize: 30,
          fontWeight: FontWeight.bold
        ),)),
                    query: productableRef,
                    itemBuilder: (context, snapshot, animation, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 2)),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Row(
                                      children: [
                                        const Text("name :", style: TextStyle( 
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500
                                        ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(snapshot.child('Name').value.toString(),style: const TextStyle( 
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500
                                        ),),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Text("Description :", style: TextStyle( 
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500
                                        ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(snapshot.child('Description').value.toString(),
                                        style: const TextStyle( 
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500
                                        ),),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Text("Rate :", style: TextStyle( 
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500
                                        ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(snapshot.child('Rate').value.toString(),
                                        style: const TextStyle( 
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500
                                        ),),
                                      ],
                                    ),
                                    Image.network(snapshot.child('Image').value.toString(),
                                    height: 200,
                                    width: 200,
                                    ),
                            
                                
                                RoundedButtton(title: "Add To Cart", onTap: (){
                                  cartlistref.child(index.toString()).set({
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
                                })
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
