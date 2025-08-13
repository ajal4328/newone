import 'package:contact_book/model/contact.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'View.dart';
// import 'package:hive/hive.dart';
class regis extends StatefulWidget {
  const regis({super.key});

  @override
  State<regis> createState() => _regisState();
}

class _regisState extends State<regis> {

  var contactbox=Hive.box('contactbox');

  adding(){
    String name_=name.text;
    String lastname_=lastname.text;
    int phonenumber_=int.parse(phonenumber.text);

    var Contact=contact(name: name_, lastname: lastname_, phonenumber: phonenumber_);
    contactbox.add(Contact);

    setState(() {
      name.clear();
      lastname.clear();
      phonenumber.clear();
    });
  }

  TextEditingController name=TextEditingController();
  TextEditingController lastname=TextEditingController();
  TextEditingController phonenumber=TextEditingController();

  final _log=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Center(child: Text('Add Contact'),),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.cyan,Colors.white],
            begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )
          ),
        ),
      ),
      body: Form(
        key:_log,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: name,
                
                decoration: InputDecoration(
                  labelText: 'Enter Name',suffixStyle: TextStyle(color: Colors.black),  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.face,color: Colors.black,),
                ),
                validator: (value){
                  if (value!.isEmpty){
                    return 'enter name';
                  }
                  return null;
                },
              ),
            ),

            SizedBox(height: 15,),

            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: lastname,

                decoration: InputDecoration(
                  labelText: 'Enter Last Name',suffixStyle: TextStyle(color: Colors.black),  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.face,color: Colors.black,),
                ),
                validator: (value){
                  if (value!.isEmpty){
                    return 'enter last name';
                  }
                  return null;
                },
              ),
            ),

            SizedBox(height: 15,),


            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: phonenumber,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter Number',suffixStyle: TextStyle(color: Colors.black),  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.numbers,color: Colors.black,),
                ),
                validator: (value){
                  if (value!.isEmpty){
                    return 'enter number';
                  }
                  return null;
                },
              ),
            ),

            SizedBox(height: 20,),

            Row(
              children: [
                ElevatedButton(onPressed: (){
                  if(_log.currentState!.validate()){
                    adding();
                  }
                },
                    child: Text('Add Contact')),

                SizedBox(width: 20,),

                ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>view()));
                },
                    child: Text('View Contact'))
              ],
            ),



          ],
        ),
      ),

    );
  }
}
