class ContentAzkarModel {
  late String id;
  late String text;
  late num count;
  ContentAzkarModel({
    required this.text,
    required this.count,

  });
  ContentAzkarModel.fromMap(Map<String,dynamic> map){
    id=map['id'];
    text=map['text'];
    count=map['count'];
  }
  toMap(){
    return{
      'count':count,
      'text':text,
    };
  }
}