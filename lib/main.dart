import 'package:flutter/material.dart';
import 'package:komalstore/pages/AddMenu.dart';
import 'package:komalstore/pages/AddRestaurant.dart';
import 'package:komalstore/pages/AdminDashboard.dart';
import 'package:komalstore/pages/AllRestaurants.dart';
import 'package:komalstore/pages/HomePage.dart';
import 'package:komalstore/pages/LoginCustomer.dart';
import 'package:komalstore/pages/MyListView.dart';
import 'package:komalstore/pages/RegisterPage.dart';
import 'package:komalstore/pages/SplashScreen.dart';

void main(){
  runApp(AppSetting());

}

class AppSetting extends StatelessWidget {
  const AppSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.pink),
      title: 'MyApp',
      initialRoute: '/splashscreen',
      routes: {
        '/':(context)=>HomePage(),
        '/admindashboard':(context)=>AdminDashboard(),
        '/splashscreen':(context)=>SplashScreen(),
        '/logincustomer':(context)=>LoginCustomer(),
        '/registercustomer':(context)=>RegisterPage(),
        '/allrestaurants':(context)=>AllRestaurants(),
        '/addrestaurant':(context)=>AddRestaurant()
      },
    );
  }
}
