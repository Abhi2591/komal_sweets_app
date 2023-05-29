import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flushbar/flutter_flushbar.dart';

class AddMenu extends StatefulWidget {
  var passData;
  AddMenu(this.passData);

  @override
  State<AddMenu> createState() => _AddMenuState();
}




class _AddMenuState extends State<AddMenu> {

  var itemNameController = TextEditingController();
  var itemSrpController = TextEditingController();
  var itemMrpController = TextEditingController();
  var itemDescriptionController = TextEditingController();
  var foodTypeController = TextEditingController();
  var offerTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print('this is passed data ${this.widget.passData}');
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            child: Center(
              child: Text('ADMIN',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ),
          ),
          SizedBox(width: 20,),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.grey.shade200,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(height: 10,),
                Text('Add ${this.widget.passData['name']} Menu',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
                TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: 'Item Name',
                    labelText: 'Item Name',
                    hintStyle: TextStyle(
                        color: Colors.black
                    ),
                    border: OutlineInputBorder(borderSide: BorderSide(width: 2,color: Colors.black)),
                  ),
                  controller: itemNameController,
                ),
                SizedBox(height: 10,),
                TextField(
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Item SRP',
                    labelText: 'Item SRP',
                    hintStyle: TextStyle(
                        color: Colors.black
                    ),
                    border: OutlineInputBorder(borderSide: BorderSide(width: 2,color: Colors.black)),
                  ),
                  controller: itemSrpController,
                ),
                SizedBox(height: 10,),
                TextField(
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Item MRP',
                    labelText: 'Item MRP',
                    hintStyle: TextStyle(
                        color: Colors.black
                    ),
                    border: OutlineInputBorder(borderSide: BorderSide(width: 2,color: Colors.black)),
                  ),
                  controller: itemMrpController,
                ),
                SizedBox(height: 10,),
                TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: 'Item Description',
                    labelText: 'Item Description',
                    hintStyle: TextStyle(
                        color: Colors.black
                    ),
                    border: OutlineInputBorder(borderSide: BorderSide(width: 2,color: Colors.black)),
                  ),
                  controller: itemDescriptionController,
                ),
                SizedBox(height: 10,),
                TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: 'Food Type',
                    labelText: 'Food Type',
                    hintStyle: TextStyle(
                        color: Colors.black
                    ),
                    border: OutlineInputBorder(borderSide: BorderSide(width: 2,color: Colors.black)),
                  ),
                  controller: foodTypeController,
                ),
                SizedBox(height: 10,),
                TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: 'Offer Text',
                    labelText: 'Offer Text',
                    hintStyle: TextStyle(
                        color: Colors.black
                    ),
                    border: OutlineInputBorder(borderSide: BorderSide(width: 2,color: Colors.black)),
                  ),controller: offerTextController,
                ),
                SizedBox(height: 10,),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: () async {
                    try{
                      var data = {
                        "name":itemNameController.text,
                        "srp":itemSrpController.text,
                        "mrp":itemMrpController.text,
                        "description":itemDescriptionController.text,
                        "offerText":offerTextController.text,
                        "foodType":foodTypeController.text,
                        "restaurant":this.widget.passData['_id']
                      };
                      // print(data);

                      var resData = await Dio().post('https://fair-jade-tick-tux.cyclic.app/api/menu',options: Options(
                        headers: {
                          HttpHeaders.contentTypeHeader:'application/json'
                        }
                      ),data: data);
                      print(resData.data);
                      print(resData.statusCode);

                      if(resData.statusCode==201){
                        Navigator.pushNamed(context, '/allrestaurants');
                      }
                      else{
                        return;
                      }

                    }catch(error){
                      print('this is error, ${error}');
                      Flushbar(
                        backgroundColor: Colors.black,
                        isDismissible: true,
                        duration: Duration(seconds: 4),
                        messageColor: Colors.yellow,
                        message: 'Failed to Add Menu',
                        flushbarPosition: FlushbarPosition.TOP,
                        animationDuration: Duration(seconds: 1),
                        dismissDirection: FlushbarDismissDirection.HORIZONTAL,
                        forwardAnimationCurve: Curves.bounceInOut,
                        title: 'Failed to Add Menu : ${itemNameController.text}',
                      )..show(context);
                    }
                  }, child: Text('ADD',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
