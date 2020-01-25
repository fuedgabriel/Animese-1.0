class ListCategory {
  String sId;
  String name;
  int iV;

  ListCategory({this.sId, this.name, this.iV});

  ListCategory.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['Name'] = this.name;
    return data;
  }
}