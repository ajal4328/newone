import 'package:contact_book/provider_counter/provider/notify.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class nextpage extends StatefulWidget {
  const nextpage({super.key});

  @override
  State<nextpage> createState() => _nextpageState();
}

class _nextpageState extends State<nextpage> {
  @override
  Widget build(BuildContext context) {
    final prov=Provider.of<counter12>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(child: Text(prov.finalCounter.toString())),
          Text(prov.finallabel.toString())
        ],
      ),
      
    );
  }
}
