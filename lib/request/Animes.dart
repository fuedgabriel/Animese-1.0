class ListHomePage {
  String sId;
  String title;
  String url;

  ListHomePage({this.sId, this.title, this.url});

  ListHomePage.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['Title'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['Title'] = this.title;
    data['url'] = this.url;
    return data;
  }
}