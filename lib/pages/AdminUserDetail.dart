import 'package:flutter/material.dart';

class AdminUserDetail extends StatefulWidget {
  const AdminUserDetail({Key? key}) : super(key: key);

  @override
  State<AdminUserDetail> createState() => _AdminUserDetailState();
}

class _AdminUserDetailState extends State<AdminUserDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text('User Profile Details',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.blue.shade900),),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  width: 200,
                  color: Colors.pink.shade200,
                  child: Image.network('https://media.istockphoto.com/id/959866606/photo/rabbit-4-months-old-sitting-against-white-background.jpg?s=612x612&w=is&k=20&c=FY3K3EtAv7ui7Kdcz1zjy8ZtH8VSUp4CHGDznF_QXTM='),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            Text('BUNNY CHAUDHRY',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.blue.shade900),),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('abhi@gmail.com',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
                Text('9161419412',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),)
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('MALE',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
                Text('-',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),)
              ],
            ),
            ListTile(
              leading: Checkbox(value: true, onChanged: (value) {
                
              },),
              title: Text('Account Active',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.red.shade700),),
            ),
            const SizedBox(height: 20,),
            const Text('Token Genrated : 20',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(onPressed: () {

                }, child: const Text('ADD ADDRESS')),
                ElevatedButton(onPressed: () {

                }, child: const Text('Change Password')),
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () {
                  
                }, child: const Text('Edit / Update Profile')),
              ],
            )
          ],
        ),
      )
    );
  }
}
