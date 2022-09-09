class AllahName {
  String? name;
  String? text;
  String? number;

  AllahName({this.name, this.text,this.number});

  AllahName.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    text = json['text'];
    number = json['number'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['text'] = this.text;
    data['number'] = this.number;

    return data;
  }
}
