class Videos {
  String sId;
  String season;
  String title;
  String url;
  String sended;
  int iV;

  Videos({this.sId, this.season, this.title, this.url, this.sended, this.iV});

  Videos.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    season = json['Season'];
    title = json['title'];
    url = json['url'];
    sended = json['sended'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['Season'] = this.season;
    data['title'] = this.title;
    data['url'] = this.url;
    data['sended'] = this.sended;
    data['__v'] = this.iV;
    return data;
  }
}