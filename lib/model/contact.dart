import 'package:flutter/cupertino.dart';
// import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'contact.g.dart';

@HiveType(typeId:0)
class contact{
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String lastname;

  @HiveField(2)
  final int phonenumber;

  contact({required this.name,required this.lastname,required this.phonenumber});
}