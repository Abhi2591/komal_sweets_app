import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:komalstore/pages/AdminUserDetail.dart';

class AdminAllUsers extends StatefulWidget {
  const AdminAllUsers({Key? key}) : super(key: key);

  @override
  State<AdminAllUsers> createState() => _AdminAllUsersState();
}

class _AdminAllUsersState extends State<AdminAllUsers> {
  
  var userData;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchAllUser();
  }
  
  
  Future<void> fetchAllUser() async {
     var res = await Dio().get('https://fair-jade-tick-tux.cyclic.app/api/allusers');
    setState(() {
      userData = res.data;
    });
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ALL USERS DATA'),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text('ALL USERS DATA',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.blue.shade900),),
                SizedBox(height: 20,),
                ListView.builder(itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10.0,bottom: 10.0,left: 5.0,right: 5.0),
                    child: Container(
                        width: double.infinity,
                        color: Colors.lightBlueAccent.shade100,
                        child: ListTile(
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AdminUserDetail(),)),
                          leading: CircleAvatar(child: CircleAvatar(child: Text('${userData[index]['firstName'][0]}'),)),
                          title: Text('${userData?[index]['firstName']}',),
                          subtitle: Text('${userData?[index]['mobile']}'),
                          trailing: Checkbox(value: userData[index]['isAccountActive']==true ? true : false, onChanged: (value) {

                          },),
                        )
                    ),
                  );
                },itemCount: userData==null ? 0 : userData.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),)
              ],
            ),
          ),
      ),
    );
  }
}
