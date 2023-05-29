import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var mobileController = TextEditingController();
  var emailIdController = TextEditingController();
  var genderController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.grey.shade200,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 30,),
                const Text('Register',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                const SizedBox(height: 20,),
                const Text('Register yourself to shop with us',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
                const SizedBox(height: 20,),
                /// First Name :
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    autofocus: true,
                    decoration: const InputDecoration(
                        labelText: 'First Name',
                        hintText: 'First Name',
                        hintStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 2),),
                    ),
                    controller: firstNameController,
                  ),
                ),
                /// Last Name :
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    autofocus: true,
                    decoration: const InputDecoration(
                      labelText: 'Last Name',
                      hintText: 'Last Name',
                      hintStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 2),),
                    ),
                    controller: lastNameController,
                  ),
                ),
                /// Mobile Number :
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    autofocus: true,
                    decoration: const InputDecoration(
                      labelText: 'Mobile Number',
                      hintText: 'Mobile Number',
                      hintStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 2),),
                    ),
                    keyboardType: TextInputType.number,
                    controller: mobileController,
                  ),
                ),
                /// Email ID :
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    autofocus: true,
                    decoration: const InputDecoration(
                      labelText: 'Email Id',
                      hintText: 'Email Id',
                      hintStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 2),),
                    ),
                    controller: emailIdController,

                  ),
                ),
                /// Gender :
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    autofocus: true,
                    decoration: const InputDecoration(
                      labelText: 'Gender',
                      hintText: 'Gender',
                      hintStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 2),),
                    ),
                    controller: genderController,
                  ),
                ),
                /// Password :
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    autofocus: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 2),),
                    ),
                    controller: passwordController,
                    obscureText: true,
                  ),
                ),
                const SizedBox(height: 20,),
                /// Register Button :
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: () async {
                        var res = await Dio().post(
                            'https://fair-jade-tick-tux.cyclic.app/api/registeruser',
                            options: Options(
                          headers: {
                            HttpHeaders.contentTypeHeader:'application/json'
                          }
                        ),data: {
                          "firstName":firstNameController.text,
                          "lastName":lastNameController.text,
                          "email":emailIdController.text,
                          "mobile":mobileController.text,
                          "password":passwordController.text,
                          "gender":genderController.text
                        });
                        print(res.statusCode);
                        print(res.data);
                        if(res.statusCode==200){
                          Navigator.pushNamed(context, '/logincustomer');
                        }
                        else{
                          return;
                        }
                        
                    },
                        child: const Text('Register')),
                  ),
                ),

                /// Sign In Text :
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already a customer?',style: TextStyle(fontSize: 20,),),
                    InkWell(
                      onTap: () => Navigator.pushNamed(context, '/logincustomer'),
                        child: const Text('Sign In',style: TextStyle(color: Colors.blue,fontSize: 20),)
                    )
                  ],
                ),



              ],
            ),
          ),
        ),
      ),
    );
  }
}
