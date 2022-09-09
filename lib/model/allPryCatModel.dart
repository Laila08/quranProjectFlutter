import 'dart:ffi';

import 'package:flutter/material.dart';

class AllPryCatModel{
  String? catId;
  String? name;
  int count=1;
  AllPryCatModel({required this.name,required this.count});
  AllPryCatModel.fromMap(Map<String,dynamic> map){
    catId=map['catId'];
    name=map['name'];
    count=map['count'];
  }
  toMap(){
    return{
      'name':name,
      'count':count
    };
  }
}