import 'package:flutter/cupertino.dart';

class counter12 with ChangeNotifier{
  int _coutner=0;
  String _label='';
  int get finalCounter=>_coutner;
  String get finallabel=>_label;


  add(){
    _coutner++;
    notifyListeners();
  }
  minus(){
    _coutner--;
    notifyListeners();
  }

  updateinput(input){
    _label=input;
    notifyListeners();
  }





}