import 'package:contact_book/Contact/View.dart';
import 'package:contact_book/model/contact.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

class edit extends StatefulWidget {
  final String name;
  final String lastname;
  final String phonenumber;
const edit({super.key,required this.name,required this.lastname,required this.phonenumber});

  @override
  State<edit> createState() => _editState();
}

class _editState extends State<edit> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewd();
  }

  viewd()async{
    name.text=widget.name;
    lastname.text=widget.lastname;
    phonenumber.text=widget.phonenumber;
    // SharedPreferences co=await SharedPreferences.getInstance();
    // lastname.text=co.getString('lastname').toString();
    // phonenumber.text=co.getString('phonenumber').toString();
  }
  final _edit=GlobalKey<FormState>();

  TextEditingController name=TextEditingController();
  TextEditingController lastname=TextEditingController();
  TextEditingController phonenumber=TextEditingController();

  var contactbox=Hive.box('contactbox');

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
        key:_edit,
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
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: ()async{
                     if(_edit!.currentState!.validate()){
                       SharedPreferences co=await SharedPreferences.getInstance();
                       var index=co.getString('index').toString();
                       String name_=name.text;
                       String lastname_=lastname.text;
                       int phonenumber_=int.parse(phonenumber.text);

                       var Contact=contact(name: name_,lastname: lastname_,phonenumber: phonenumber_);
                       contactbox.putAt(int.parse(index), Contact);
                     }
                    }, 
                    
                    child: Text('Edit')),
                ElevatedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>view()));
                    },
                    child: Text('View'))
              ],
            )



          ],
        ),
      ),

    );
  }
}
