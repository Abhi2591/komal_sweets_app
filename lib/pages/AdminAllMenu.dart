import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AdminAllMenu extends StatefulWidget {
   const AdminAllMenu({Key? key}) : super(key: key);
  

  
  @override
  State<AdminAllMenu> createState() => _AdminAllMenuState();
}

class _AdminAllMenuState extends State<AdminAllMenu> {
  var itemData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }
  
  
  Future<void> fetchData() async {
    var res = await Dio().get('https://fair-jade-tick-tux.cyclic.app/api/menu');
    setState(() {
      itemData = res.data;
    });

    print(res.data);
    print(res.statusCode);
  }
  
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin All Menus'),
      ),
      body: Container(
        child: Center(
         child: SingleChildScrollView(
           child: Padding(
             padding: const EdgeInsets.all(20.0),
             child: Column(
               children: [
                 Text('Admin All Menus',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.blue.shade900),),
                 const SizedBox(height: 10,),
                 ListView.builder(itemBuilder: (context, index) {
                   return Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Container(
                         color: itemData?[index]['isStock']==true ? Colors.green.shade200 : Colors.red.shade200,
                         width: double.infinity,
                         child: Padding(
                           padding: const EdgeInsets.only(top: 10.0,bottom: 10.0,left: 5.0,right: 5.0),
                           child: Column(
                             children: [
                               Text('${itemData?[index]['name']}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                               SizedBox(height: 10,),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Text('${itemData?[index]['foodType']}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.green.shade900),),
                                   Text('MRP : ${itemData?[index]['mrp']}/-',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,),),
                                   Text('SRP : ${itemData?[index]['srp']}/-',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),)
                                 ],
                               ),
                               SizedBox(height: 10,),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Text(itemData?[index]['isStock']==true ? 'In Stock' : 'Out Of Stock',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:itemData?[index]['isStock']==true ? Colors.green.shade900 : Colors.red.shade900 ),),
                                   Text(itemData?[index]['isPopular']==true?'Popular':'Regular',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.red.shade700),),
                                   Text('-',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),)
                                 ],
                               ),
                               SizedBox(height: 10,),
                               Text('${itemData?[index]['offerText']}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.red.shade900),),
                               SizedBox(height: 10,),
                               Text('${itemData?[index]['description']}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                             ],
                           ),
                         ),
                       ),
                     ),
                   );
                 },itemCount: itemData==null?0:itemData.length,
                 shrinkWrap: true,
                 physics: const NeverScrollableScrollPhysics(),)
               ],
             ),
           ),
         ),
        ),
      ),
    );
  }
}
