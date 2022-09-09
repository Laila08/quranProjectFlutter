class AzkarCatModel {
  String? catId;
  String? name;
  String? number;
  AzkarCatModel({required this.name,});
  AzkarCatModel.fromMap(Map<String,dynamic> map){
  catId=map['catId'];
  name=map['name'];
  number=map['number'];
  }
  toMap(){
  return{
  'name':name,
  'number':number
  };
  }
}