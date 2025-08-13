import 'package:flutter/material.dart';

void main(){
runApp(count());
}
class count extends StatelessWidget {
  const count({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: count1(),
    );
  }
}
class count1 extends StatefulWidget {
  const count1({super.key});

  @override
  State<count1> createState() => _count1State();
}

class _count1State extends State<count1> {

  int count=0;



  add(){
    setState(() {
      count++;
    });

  }
  minus(){
    setState(() {
      count--;
    });
  }

  TextEditingController name=TextEditingController();

  final _code=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:
      Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(name.text),
            Text(count.toString()),
            IconButton(onPressed: (){
              add();
            }, icon: Icon(Icons.add)),
            IconButton(onPressed: (){
              minus();
            }, icon: Icon(Icons.minimize_sharp)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onChanged: (value){
                  setState(() {
                    name.text=value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'enter name'
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
