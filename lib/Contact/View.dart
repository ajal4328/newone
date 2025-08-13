import 'package:contact_book/Contact/co%20view.dart';
import 'package:contact_book/Contact/edi.dart';
import 'package:contact_book/Contact/regis.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../model/contact.dart';
class view extends StatefulWidget {
  const view({super.key});

  @override
  State<view> createState() => _viewState();
}

class _viewState extends State<view> {

  TextEditingController searching=TextEditingController();

  List allContacts = [];
  List filteredContacts = [];
  var contactbox=Hive.box('contactbox');


  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    allContacts = contactbox.values.toList();
    filteredContacts = allContacts;
    searching.addListener(search);


  }



  search(){

final query=searching.text.toLowerCase();



setState(() {
  filteredContacts = allContacts.where((item) {
    final c = item as contact;
    return c.name.toLowerCase().contains(query) ||
        c.lastname.contains(query) ||
        c.phonenumber.toString().contains(query);
  }).toList();
});}




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        centerTitle: true,
        title: Text('Contacts'),
        backgroundColor: Colors.blue.shade700,
      ),
      body: Column(
        children: [

          Padding(
            padding: const EdgeInsets.all(20),
            child: TextFormField(
              controller: searching,




            decoration: InputDecoration(
              suffixIcon: Icon(Icons.search),
              border: OutlineInputBorder()
            ),
            ),
          ),
          Expanded(
              child:
              ListView.builder(
                  itemCount: filteredContacts.length,
                  itemBuilder: (BuildContext contax,int index){
                    // final cc=contactbox.getAt(index) as contact;
                    final cc=filteredContacts[index] as contact;

                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: InkWell(
                        onTap:(){
                          // Navigator.push(context, MaterialPageRoute(builder: (contax)=>covi(name: cc.name,lastname: cc.lastname,phonenumber: cc.phonenumber.toString(),)));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(width: 1)
                          ),
                          child: ListTile(
                            leading: Icon(Icons.person),
                            title: Row(
                              children: [

                                Text(cc.name),
                                SizedBox(width: 2,),
                                Text(cc.lastname)
                              ],
                            ),
                            subtitle: Text(cc.phonenumber.toString()),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(onPressed: (){
                                  setState(() {
                                    contactbox.deleteAt(index);
                                  });
                                },
                                    icon: Icon(Icons.delete,color: Colors.black,)),

                                IconButton(
                                    onPressed: ()async{
                                      // SharedPreferences co=await SharedPreferences.getInstance();
                                      // co.setString('name',cc.name.toString());
                                      // co.setString('lastname', cc.lastname.toString());
                                      // co.setString('phonenumber', cc.phonenumber.toString());
                                      // co.setString('index', index.toString());

                                      // Navigator.push(context, MaterialPageRoute(builder: (contax)=>edit(name: cc.name,lastname: cc.lastname,phonenumber: cc.phonenumber.toString())));
                                    },

                                    icon: Icon(Icons.edit,color: Colors.black,))
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
          )

        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>regis()));
      },
        child: Icon(Icons.add_box_outlined),),
      
    );
  }
}
