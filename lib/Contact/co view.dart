import 'package:contact_book/Contact/View.dart';
import 'package:flutter/material.dart';

class covi extends StatefulWidget {

  final String name;
  final String lastname;
  final String phonenumber;

  const covi({super.key,required this.name,required this.lastname,required this.phonenumber});

  @override
  State<covi> createState() => _coviState();
}

class _coviState extends State<covi> {

  @override


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Center(child: Text('Contact Details'),),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue,Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )
          ),
        ),
      ),
      body:
         Column(
          children: [

            TextFormField(

            ),

            SizedBox(height: 20,),
            Icon(Icons.account_box,size:50,),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 60,
                    width: 360,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all()
                    ),
                    child: Center(child: Text(widget.name,style: TextStyle(fontSize: 30),))
                  ),
                ],
              ),

            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(10),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: 60,
                      width: 360,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all()
                      ),
                      child: Center(child: Text(widget.lastname,style: TextStyle(fontSize: 30),))
                  ),
                ],
              ),

            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(10),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: 60,
                      width: 360,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all()
                      ),
                      child: Center(child: Text(widget.phonenumber,style: TextStyle(fontSize: 30),))
                  ),
                ],
              ),

            )
          ],

      ),

    );
  }
}
