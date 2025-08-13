import 'package:flutter/material.dart';
import 'package:contact_book/provider_counter/view page.dart';
import 'package:provider/provider.dart';
import 'package:contact_book/provider_counter/provider/notify.dart';

void main(){
  runApp(

      ChangeNotifierProvider(
        create: (_) => counter12(),
          child: mainpage(),)

  );
}
class mainpage extends StatelessWidget {
  const mainpage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: pageview1(),
    );
  }
}
// class pagemain extends StatefulWidget {
//   const pagemain({super.key});
//
//   @override
//   State<pagemain> createState() => _pagemainState();
// }
//
// class _pagemainState extends State<pagemain> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//     );
//   }
// }
