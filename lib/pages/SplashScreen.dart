import 'dart:async';

import 'package:flutter/material.dart';
import 'package:komalstore/pages/HomePage.dart';
import 'package:komalstore/pages/LoginCustomer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    openNextPage();
  }

  openNextPage() {
    Timer.periodic(Duration(seconds: 3), (timer) async {
      var inst = await SharedPreferences.getInstance();
      var userLogin = await inst.getBool('isLogin');
      if (userLogin == null || userLogin == false || userLogin == 'undefined') {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginCustomer(),));
      }
      else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage(),));
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.black,
          child: Center(
            child: Text('Komal Sweets', style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Colors.yellow),),
          ),
        )
    );
  }
}
