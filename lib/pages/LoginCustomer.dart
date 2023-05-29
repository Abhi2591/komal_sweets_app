import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flushbar/flutter_flushbar.dart';
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
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    const SizedBox(height: 80,),
                    const Text('Log In',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                    const SizedBox(height: 20,),
                    const Text('Pass Your credentials to safe log in',style: TextStyle(fontSize: 20),),
                    const SizedBox(height: 30,),
                    /// Mobile Number :
                    TextField(
                      autofocus: true,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Mobile Number',
                        labelText: 'Phone Number',
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 2,color: Colors.black)
                        ),
                      ),
                      controller: mobileController,
                    ),
                    const SizedBox(height: 30,),
                    /// Password :
                    TextField(
                      obscureText: true,
                      decoration: const InputDecoration(
                          hintText: 'Password',
                          labelText: 'Password',
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 2,color: Colors.black)
                          ),
                      ),
                      controller: passwordController,
                    ),
                    const SizedBox(height: 40,),
                    /// Log In Button :
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(onPressed: () async {
                          try{
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
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage(),));
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
                              message: 'Failed to Login',
                              flushbarPosition: FlushbarPosition.TOP,
                              animationDuration: const Duration(seconds: 1),
                              dismissDirection: FlushbarDismissDirection.HORIZONTAL,
                              forwardAnimationCurve: Curves.bounceInOut,
                              title: 'Inavlid Credentials : \n Mobile : ${mobileController.text} OR Password : ${passwordController.text}',
                            ).show(context);
                          }

                        }, child: const Text('Log In',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                    ),
                    /// Sign Up Text :
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Dont have an account?',style: TextStyle(fontSize: 20),),
                        InkWell(
                          onTap: () => Navigator.pushNamed(context, '/registercustomer'),
                            child: const Text('Register',style: TextStyle(color: Colors.blue,fontSize: 20),)
                        )
                      ],
                    )

                  ],
                ),
              ),
            )
        ),
      )
    );
  }
}
