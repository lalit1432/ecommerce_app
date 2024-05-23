
import 'package:firebase_application/view/admin/orderspage.dart';
import 'package:firebase_application/view/util/utils.dart';
import 'package:firebase_application/view/widgets/roundbutton.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  TextEditingController productNameController = TextEditingController();
  TextEditingController productImageController = TextEditingController();
  TextEditingController productDescriprionController = TextEditingController();
  TextEditingController productRateController = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  int count = 0;

  final productableRef = FirebaseDatabase.instance.ref("AdminProductList");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: const Text("Admin Dashboard"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
             const Text("all Products",style:   TextStyle( 
                                          fontSize: 30,
                                          fontWeight: FontWeight.w700
                                        ),),
                                       const  SizedBox(
                                          height: 20,
                                        ),
            Expanded(
                child: FirebaseAnimatedList(
                  defaultChild: const Text("Loading..."),
                    query: productableRef,
                    itemBuilder: (context, snapshot, animation, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Container(
                          decoration: BoxDecoration( 
                            border: Border.all(color: Colors.black,width: 2)
                          ),
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
                            ],
                          ),
                        ),
                      );
        
                    }))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showbottomsheet();
        },
        label: const Text("add new product"),
        icon: const Icon(Icons.add_circle_outline),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      drawer: Drawer( 
        child: Padding(
          padding: const EdgeInsets.only( 
            top: 100
          ),
          child: Column(children: [ 
            GestureDetector(
              onTap: (){
                Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const AdminHomePage();
                        }));
              },
              child: Container( 
                height: 50,
                alignment: Alignment.center,
                width: 200,
                decoration: BoxDecoration( 
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: const Text( 
                  "Home",
                  style: TextStyle( 
                    color: Colors.white
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: (){ 
                Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const OrdersPage();
                        }));
              },
              child: Container( 
                  alignment: Alignment.center,
                height: 50,
                width: 200,
                decoration: BoxDecoration( 
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: const Text( 
                  "Orders",
                  style: TextStyle( 
                    color: Colors.white
                  ),
                ),
              ),
            )
          ],),
        ),
      ),
    );
  }

  void showbottomsheet() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
              top: 30,
              left: 20,
              right: 20,
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: formkey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: productNameController,
                    decoration: InputDecoration(
                        hintText: "Product Name",
                        contentPadding: const EdgeInsets.all(15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "enter Product Name";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: productImageController,
                    decoration: InputDecoration(
                        hintText: "Product Image link",
                        contentPadding: const EdgeInsets.all(15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "enter Product Imege";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: productDescriprionController,
                    decoration: InputDecoration(
                        hintText: "Product Description",
                        contentPadding: const EdgeInsets.all(15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "enter Product Description";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: productRateController,
                    decoration: InputDecoration(
                        hintText: "Product Rate",
                        contentPadding: const EdgeInsets.all(15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "enter Product Rates";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  RoundedButtton(
                      title: "Add Product",
                      onTap: () {
                        productableRef.child(count.toString()).set({
                          'Name': productNameController.text.toString(),
                          'Image': productImageController.text.toString(),
                          'Description':
                              productDescriprionController.text.toString(),
                          'Rate': productRateController.text.toString(),
                        }).then((value) {
                          count++;
                          Utils().toastmessage("sucussesful entry");
                        }).onError((error, stackTrace) {
                          Utils().toastmessage(error.toString());
                        });
                        productDescriprionController.clear();
                        productImageController.clear();
                        productRateController.clear();
                        productNameController.clear();
                      })
                ],
              ),
            ),
          );
        });
  }
}
