import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:komalstore/pages/AddMenu.dart';

class VendorMenu extends StatefulWidget {
  var menuData;
  VendorMenu(this.menuData, {super.key});

  @override
  State<VendorMenu> createState() => _VendorMenuState();
}

class _VendorMenuState extends State<VendorMenu> {
  var itemData;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    vendorItem();
  }
  
  
  Future<void> vendorItem() async {
     var res = await Dio().get('https://fair-jade-tick-tux.cyclic.app/api/menu');
    setState(() {
      itemData = res.data.where((fil)=>fil['restaurant']==widget.menuData['_id']).toList();
    });
    print(res.data);
    print(res.statusCode);
    print('this is item data of a particular Restaurant $itemData');
  }
  
  @override
  Widget build(BuildContext context) {
    print(widget.menuData['_id']);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Page'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 10,),
              Text('${widget.menuData['name']} Menu',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.red.shade800),),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                    ElevatedButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddMenu(widget.menuData),));
                    }, child: const Text('ADD MENU',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                  const SizedBox(height: 20,),
                ],
              ),
              ListView.builder(itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    color: itemData?[index]['isStock']==true ? Colors.green.shade200 : Colors.red.shade200,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0,bottom: 8.0),
                      child: Column(
                        children: [
                          Text('${itemData?[index]['name']}',style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          const SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${itemData?[index]['foodType']}',style: const TextStyle(fontSize: 20,color: Colors.green,fontWeight: FontWeight.bold),),
                              Text('MRP : ${itemData?[index]['mrp']}/-',style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                              Text('SRP : ${itemData?[index]['srp']}/-',style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)
                            ],
                          ),
                          const SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(itemData?[index]['isStock']==true?'In Stock':'Out of Stock',style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                              Text(itemData?[index]['isPopular']==true?'Popular':'Regular',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.redAccent.shade700),),
                              const Text('-',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)
                            ],
                          ),
                          const SizedBox(height: 10,),
                          Text('${itemData?[index]['offerText']}',style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          const SizedBox(height: 10,),
                          Text('${itemData?[index]['description']}',style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w400,overflow: TextOverflow.ellipsis),)
                        ],
                      ),
                    ),
                  ),
                );
              },
                itemCount: itemData==null?0:itemData.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              )
            ],
          ),
        ),
      )
    );
  }
}
