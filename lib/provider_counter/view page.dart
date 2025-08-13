import 'package:contact_book/provider_counter/provider/notify.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:contact_book/provider_counter/counter_view_in_next.dart';


class pageview1 extends StatefulWidget {
  const pageview1({super.key});

  @override
  State<pageview1> createState() => _pageview1State();
}

class _pageview1State extends State<pageview1> {

  TextEditingController type=TextEditingController();
  
  @override
  Widget build(BuildContext context) {

    final changecounter=Provider.of<counter12>(context);

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(type.text),
          Text(changecounter.finalCounter.toString()),
          IconButton(onPressed: (){
            changecounter.add();
          }, icon: Icon(Icons.add)),
          IconButton(onPressed: (){
            changecounter.minus();
          }, icon: Icon(Icons.minimize_sharp)),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextFormField(
              onChanged: (value){
                setState(() {
                  changecounter.updateinput(value);
                });
              },
              decoration: InputDecoration(
                  labelText: 'enter'
              ),
            ),
          ),
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>nextpage()));
          }, child: Text("data")),

        ],
      ),
    );
  }
}
