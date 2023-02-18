import 'package:flutter/material.dart';
import 'package:komalstore/pages/HomePage.dart';

void main(){
  runApp(AppSetting());

}

class AppSetting extends StatelessWidget {
  const AppSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      title: 'MyApp',
      home: HomePage() ,
    );
  }
}
