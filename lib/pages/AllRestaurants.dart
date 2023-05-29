import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:komalstore/pages/AddMenu.dart';
import 'package:komalstore/pages/VendorMenu.dart';

class AllRestaurants extends StatefulWidget {
  const AllRestaurants({Key? key}) : super(key: key);

  @override
  State<AllRestaurants> createState() => _AllRestaurantsState();
}

class _AllRestaurantsState extends State<AllRestaurants> {
  var restData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    restaurantData();
  }

  Future<void> restaurantData() async {
    try{
      var res = await Dio().get('https://fair-jade-tick-tux.cyclic.app/api/restaurant');
      print(res.data);
      print(res.statusCode);
      if(res.statusCode==200){
        setState(() {
          restData = res.data;
        });
      }
      else{
        return;
      }
    }catch(err){
      print('this is error ${err} ');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurants'),
        actions: [
          InkWell(
            onTap: () => Navigator.pushNamed(context, '/admindashboard'),
            child: const Center(
                child: Text('ADMIN',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
            ),
          ),
          const SizedBox(width: 30,),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text('All Restaurants',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.red.shade700),),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(onPressed: () => Navigator.pushNamed(context, '/addrestaurant'), child: const Text('Add Restaurant',style: TextStyle(fontSize: 20),))
                ],
              ),
              const SizedBox(height: 20,),
              ListView.builder(itemBuilder: (context, index) {
                return Column(
                  children: [
                    InkWell(
                      onTap: (){
                        // print(restData[index]);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => VendorMenu(restData[index]),));
                      },
                      child: Container(
                        width: double.infinity,
                        // height: 100,
                        color: restData[index]['isOnline']==true?Colors.green.shade200:Colors.red.shade200,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10.0,bottom: 10.0,left: 8.0,right: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('${restData[index]['name']}',style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                              const SizedBox(height: 10,),
                              Text(restData[index]['isOnline']==true?'Active':'InActive',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.green.shade900),)
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                  ],
                );
              },
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: restData==null? 0 : restData.length,
              )
            ],
          ),
        ),
      ),
    );
  }
}
