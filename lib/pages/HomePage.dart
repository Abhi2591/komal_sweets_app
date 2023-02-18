import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}




class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Komal Sweets'),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.pinkAccent.shade100,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    color: Colors.yellow,
                    child: Center(child: Text('Image will be here')),
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.lightBlueAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('A D Brothers',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                              Text('Veg',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                            ],
                          ),
                          SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                            children: [
                              Text('Ratings',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                              Text('In Stock',style: TextStyle(fontSize: 15,),)
                            ],
                          ),
                          SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('20 % off Today',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 15,),
              Column(
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    color: Colors.yellow,
                    child: Center(child: Text('Image will be here')),
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.lightBlueAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('A D Brothers',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                              Text('Veg',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                            ],
                          ),
                          SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                            children: [
                              Text('Ratings',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                              Text('In Stock',style: TextStyle(fontSize: 15,),)
                            ],
                          ),
                          SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('20 % off Today',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 15,),
              Column(
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    color: Colors.yellow,
                    child: Center(child: Text('Image will be here')),
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.lightBlueAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('A D Brothers',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                              Text('Veg',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                            ],
                          ),
                          SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                            children: [
                              Text('Ratings',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                              Text('In Stock',style: TextStyle(fontSize: 15,),)
                            ],
                          ),
                          SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('20 % off Today',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 15,),
              Column(
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    color: Colors.yellow,
                    child: Center(child: Text('Image will be here')),
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.lightBlueAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('A D Brothers',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                              Text('Veg',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                            ],
                          ),
                          SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                            children: [
                              Text('Ratings',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                              Text('In Stock',style: TextStyle(fontSize: 15,),)
                            ],
                          ),
                          SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('20 % off Today',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 15,),
            ],
          ),
        ),
      )
    );
  }
}
