import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:komalstore/pages/HomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginCustomer extends StatefulWidget {
   LoginCustomer({Key? key}) : super(key: key);

  @override
  State<LoginCustomer> createState() => _LoginCustomerState();
}

class _LoginCustomerState extends State<LoginCustomer> {
  var mobileController = TextEditingController();

  var passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    var data = await SharedPreferences.getInstance();
    print(data.getBool('isLogin'));
    print(data.getString('userName'));
  }

  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.amberAccent,
        child: SafeArea(
            child: Column(
              children: [
                SizedBox(height: 50,),
                Text('Log In',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
                Text('Pass Your credentials to safe log in',style: TextStyle(fontSize: 20),),
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.only(left: 30,right: 30),
                  child: TextField(
                    autofocus: true,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(hintText: 'Mobile Number',labelText: 'Phone Number',border: OutlineInputBorder(borderSide: BorderSide(width: 2,color: Colors.black)),),
                    controller: mobileController,
                  ),
                ),
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.only(left: 30,right: 30),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(hintText: 'Password',labelText: 'Password',border: OutlineInputBorder(borderSide: BorderSide(width: 2,color: Colors.black))),
                    controller: passwordController,
                  ),
                ),
                SizedBox(height: 50,),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Container(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: () async {

                       var res = await Dio().post('https://fair-jade-tick-tux.cyclic.app/api/verifyuser',options: Options(
                           headers: {
                         HttpHeaders.contentTypeHeader:'application/json'
                       }),data: {
                        "mobile" : mobileController.text,
                        "password" : passwordController.text
                      });
                      print(res.statusCode);
                      print(res.data['response']['firstName']);
                      if(res.statusCode==200){
                         var preInst = await SharedPreferences.getInstance();
                         await preInst.setBool('isLogin', true);
                         preInst.setString('userName',res.data['response']['firstName']);
                         setState(() {

                         });
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
                      }
                      else{
                        return;
                      }
                      }, child: Text('Log In',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Dont have an account?',style: TextStyle(fontSize: 20),),
                    InkWell(
                      onTap: () => Navigator.pushNamed(context, '/registercustomer'),
                        child: Text('Register',style: TextStyle(color: Colors.blue,fontSize: 20),)
                    )
                  ],
                )

              ],
            )
        ),
      )
    );
  }
}
