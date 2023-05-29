import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flushbar/flutter_flushbar.dart';

class AddRestaurant extends StatefulWidget {
  const AddRestaurant({Key? key}) : super(key: key);

  @override
  State<AddRestaurant> createState() => _AddRestaurantState();
}

class _AddRestaurantState extends State<AddRestaurant> {

  var restaurantNameController = TextEditingController();
  var restaurantMobileController = TextEditingController();
  var restaurantEmailController = TextEditingController();
  var restaurantPanController = TextEditingController();
  var restaurantAddressController = TextEditingController();
  var restaurantTypeController = TextEditingController();
  var restaurantOfferTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () => Navigator.pushNamed(context, '/admindashboard'),
            child: const Center(
              child: Text('ADMIN',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ),
          ),
          const SizedBox(width: 20,),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.grey.shade200,
        child: SafeArea(
            child:SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    const SizedBox(height: 10,),
                    const Text('Vendor Registration',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    const SizedBox(height: 10,),
                    const Text('Register yourself to sell your items with us',style: TextStyle(fontSize: 15,color: Colors.pink,fontWeight: FontWeight.bold),),
                    const SizedBox(height: 20,),
                    TextField(
                      autofocus: true,
                      decoration: const InputDecoration(
                        hintText: 'Restaurant Name',
                        labelText: 'Restauarant Name',
                        hintStyle: TextStyle(
                          color: Colors.black
                        ),
                        border: OutlineInputBorder(borderSide: BorderSide(width: 2,color: Colors.black)),
                      ),
                      controller: restaurantNameController,
                    ),
                    const SizedBox(height: 10,),
                    TextField(
                      autofocus: true,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Restaurant Mobile',
                        labelText: 'Restauarant Mobile',
                        hintStyle: TextStyle(
                            color: Colors.black
                        ),
                        border: OutlineInputBorder(borderSide: BorderSide(width: 2,color: Colors.black)),
                      ),
                      controller: restaurantMobileController,
                    ),
                    const SizedBox(height: 10,),
                    TextField(
                      autofocus: true,
                      decoration: const InputDecoration(
                        hintText: 'Restaurant Email',
                        labelText: 'Restauarant Email',
                        hintStyle: TextStyle(
                            color: Colors.black
                        ),
                        border: OutlineInputBorder(borderSide: BorderSide(width: 2,color: Colors.black)),
                      ),
                      controller: restaurantEmailController,
                    ),
                    const SizedBox(height: 10,),
                    TextField(
                      autofocus: true,
                      decoration: const InputDecoration(
                        hintText: 'Restaurant Address',
                        labelText: 'Restauarant Address',
                        hintStyle: TextStyle(
                            color: Colors.black
                        ),
                        border: OutlineInputBorder(borderSide: BorderSide(width: 2,color: Colors.black)),
                      ),
                      controller: restaurantAddressController,
                    ),
                    const SizedBox(height: 10,),
                    TextField(
                      autofocus: true,
                      decoration: const InputDecoration(
                        hintText: 'Restaurant PAN',
                        labelText: 'Restauarant PAN',
                        hintStyle: TextStyle(
                            color: Colors.black
                        ),
                        border: OutlineInputBorder(borderSide: BorderSide(width: 2,color: Colors.black)),
                      ),
                      controller: restaurantPanController,
                    ),
                    const SizedBox(height: 10,),
                    TextField(
                      autofocus: true,
                      decoration: const InputDecoration(
                        hintText: 'Restaurant Type',
                        labelText: 'Restauarant Type',
                        hintStyle: TextStyle(
                            color: Colors.black
                        ),
                        border: OutlineInputBorder(borderSide: BorderSide(width: 2,color: Colors.black)),
                      ),
                      controller: restaurantTypeController,
                    ),
                    const SizedBox(height: 10,),
                    TextField(
                      autofocus: true,
                      decoration: const InputDecoration(
                        hintText: 'Offer Text',
                        labelText: 'Offer Text',
                        hintStyle: TextStyle(
                            color: Colors.black
                        ),
                        border: OutlineInputBorder(borderSide: BorderSide(width: 2,color: Colors.black)),
                      ),
                      controller: restaurantOfferTextController,
                    ),
                    const SizedBox(height: 5,),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(onPressed: () async {
                          try{
                            var restaurantData = await Dio().post('https://fair-jade-tick-tux.cyclic.app/api/restaurant',options: Options(
                                headers: {
                                  HttpHeaders.contentTypeHeader:'application/json'
                                }
                            ),data: {
                              "name" : restaurantNameController.text,
                              "mobile" : restaurantMobileController.text,
                              "email" : restaurantEmailController.text,
                              "pan" : restaurantPanController.text,
                              "address" : restaurantAddressController.text,
                              "restaurantType" : restaurantTypeController.text,
                              "offerText" : restaurantOfferTextController.text
                            });
                            print(restaurantData.statusCode);
                            print(restaurantData.data);
                            if(restaurantData.statusCode==201){
                              Navigator.pushNamed(context, '/admindashboard');
                            }
                            else{
                              return;
                            }
                          }catch(err){
                            print('this is error');
                            Flushbar(
                              backgroundColor: Colors.black,
                              isDismissible: true,
                              duration: const Duration(seconds: 4),
                              messageColor: Colors.yellow,
                              message: 'Failed to Register',
                              flushbarPosition: FlushbarPosition.TOP,
                              animationDuration: const Duration(seconds: 1),
                              dismissDirection: FlushbarDismissDirection.HORIZONTAL,
                              forwardAnimationCurve: Curves.bounceInOut,
                              title: 'Failed to Register : ${restaurantNameController.text}',
                            ).show(context);
                          }
                        }, child: const Text('Register')),
                      ),
                    )
                  ],
                ),
              ),
            )
        ),
      ),
    );
  }
}
