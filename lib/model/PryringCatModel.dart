class PryCatModel {
  String? catId;
  String? text;
  String? number;
  PryCatModel({required this.text, this.number});
  PryCatModel.fromMap(Map<String,dynamic> map){
    catId=map['catId'];
    text=map['text'];
    number=map['number'];
  }
  toMap(){
    return{
      'text':text,
      'number':number
    };
  }
}