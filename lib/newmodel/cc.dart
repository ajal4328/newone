import 'package:flutter/cupertino.dart';
// import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'cc.g.dart';

@HiveType(typeId:0)
class cc{
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String lastname;

  @HiveField(2)
  final int phonenumber;

  cc({required this.name,required this.lastname,required this.phonenumber});
}