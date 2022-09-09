import 'dart:ffi';

import 'package:flutter/material.dart';

class RosaryCatModel{
  String? catId;
  String? name;
  int count=1;
  RosaryCatModel({required this.name,required this.count});
  RosaryCatModel.fromMap(Map<String,dynamic> map){
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