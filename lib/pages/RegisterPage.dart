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
                SizedBox(height: 30,),
                Text('Register',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
                Text('Register yourself to shop with us',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                        labelText: 'First Name',
                        hintText: 'First Name',
                        hintStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 2),),
                    ),
                    controller: firstNameController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: 'Last Name',
                      hintText: 'Last Name',
                      hintStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 2),),
                    ),
                    controller: lastNameController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: 'Mobile Number',
                      hintText: 'Mobile Number',
                      hintStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 2),),
                    ),
                    keyboardType: TextInputType.number,
                    controller: mobileController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: 'Email Id',
                      hintText: 'Email Id',
                      hintStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 2),),
                    ),
                    controller: emailIdController,

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: 'Gender',
                      hintText: 'Gender',
                      hintStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 2),),
                    ),
                    controller: genderController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 2),),
                    ),
                    controller: passwordController,
                    obscureText: true,
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: () async {
                        var res = await Dio().post('https://fair-jade-tick-tux.cyclic.app/api/registeruser',options: Options(
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
                        
                    }, child: Text('Register')),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already a customer?',style: TextStyle(fontSize: 20,),),
                    InkWell(
                      onTap: () => Navigator.pushNamed(context, '/logincustomer'),
                        child: Text('Sign In',style: TextStyle(color: Colors.blue,fontSize: 20),)
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
