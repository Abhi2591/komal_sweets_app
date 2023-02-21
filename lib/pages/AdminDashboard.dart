import 'package:flutter/material.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ADMIN'),
        actions: [
          Container(
            height: double.infinity,
              margin: EdgeInsets.only(right: 10),
              child: Center(
                  child: InkWell(
                    onTap: () => Navigator.pushNamed(context, '/'),
                      child: Text('Website',style: TextStyle(fontSize: 20),)
                  )
              )
          )
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.yellow.shade200,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.greenAccent,
                  child: Center(
                      child: Text('Active Orders',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.pink.shade200,
                  child: Center(
                      child: Text('All Orders',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.blueAccent.shade100,
                  child: Center(
                      child: Text('Users',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.grey,
                  child: Center(
                      child: Text('Menu ',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.cyanAccent,
                  child: Center(
                      child: Text('Addreses',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.redAccent.shade100,
                  child: Center(
                      child: Text('Restaurant',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
