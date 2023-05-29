import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class MyListView extends StatefulWidget {
  var menuData;
  MyListView(this.menuData);
  
  @override
  State<MyListView> createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  var apiData;

  @override
  void initState() {
    super.initState();
    getData();
  }
  Future<void> getData() async {
    var api = await Dio().get('https://fair-jade-tick-tux.cyclic.app/api/menu');
    setState(() {
      apiData = api.data.where((fil)=>fil['restaurant']==this.widget.menuData['_id']).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    print(this.widget.menuData['_id']);
    // print(apiData);
    return Scaffold(
      appBar: AppBar(
        title: Text('MenuPage'),
      ),
      body: Center(

          child: apiData==null ? Center(
            child: CircularProgressIndicator(),
          )
              :
          ListView.builder(itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                // height: 400,
                width: double.infinity,
                color: Colors.pink.shade100,
                child: Row(
                  children: [
                    Container(
                        height: 200,
                      width: 150,
                      color: Colors.green,
                      child: Image.network('https://fair-jade-tick-tux.cyclic.app${apiData[index]['image']}',fit: BoxFit.fill,),
                    ),
                    Expanded(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('${apiData[index]['name']}',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                            Text('${apiData[index]['srp']} Rs',style: TextStyle(fontSize: 20,)),
                            Text('${apiData[index]['foodType']}',style: TextStyle(fontSize: 20,color: Colors.green,fontWeight: FontWeight.bold)),
                            Container(
                              child: ElevatedButton(onPressed: ()=>{}, child: Text('ADD TO CART',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold))),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ),
            );
          },
            itemCount: apiData==null? 0 :apiData.length,
          )
      ),
    );
  }
}



// Column(
//                   children: [
//                     Container(
//                       height: 300,
//                       width: double.infinity,
//                       color: Colors.green,
//                       child: Image.network('https://fair-jade-tick-tux.cyclic.app${apiData[index]['image']}',fit: BoxFit.fill,),
//                     ),
//                     Container(
//                       width: double.infinity,
//                       child: Padding(
//                         padding: const EdgeInsets.all(10.0),
//                         child: Column(
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text('PAN: ${apiData[index]['pan']}',style: TextStyle(fontWeight: FontWeight.w900,fontSize: 20),),
//                                 Text('Veg')
//                               ],
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text('Rating : 3.4'),
//                                 Text('In Stock')
//                               ],
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text('20% Off Today'),
//                               ],
//                             )
//                           ],
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//
// import 'package:flutter/material.dart';
//
// class MyListView extends StatelessWidget {
//   const MyListView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: ListView(
//             scrollDirection: Axis.vertical,
//             children: [
//               ListTile(title: Text('Bunny Chaudhay'),leading: CircleAvatar(),subtitle: Text('8563254155'),trailing: Text('Mobile'),),
//               ListTile(title: Text('Bunny Chaudhay'),leading: CircleAvatar(),subtitle: Text('8563254155'),trailing: Text('Mobile'),),
//               ListTile(title: Text('Bunny Chaudhay'),leading: CircleAvatar(),subtitle: Text('8563254155'),trailing: Text('Mobile'),),
//               ListTile(title: Text('Bunny Chaudhay'),leading: CircleAvatar(),subtitle: Text('8563254155'),trailing: Text('Mobile'),),
//               ListTile(title: Text('Bunny Chaudhay'),leading: CircleAvatar(),subtitle: Text('8563254155'),trailing: Text('Mobile'),),
//               ListTile(title: Text('Bunny Chaudhay'),leading: CircleAvatar(),subtitle: Text('8563254155'),trailing: Text('Mobile'),),
//               ListTile(title: Text('Bunny Chaudhay'),leading: CircleAvatar(),subtitle: Text('8563254155'),trailing: Text('Mobile'),),
//               ListTile(title: Text('Bunny Chaudhay'),leading: CircleAvatar(),subtitle: Text('8563254155'),trailing: Text('Mobile'),),
//
//             ]
//         ),
//       ),
//     );
//   }
// }