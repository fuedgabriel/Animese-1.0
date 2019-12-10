class User {
  String sId;
  String name;
  String nick;
  String password;
  String email;

  User({this.sId, this.name, this.nick, this.password, this.email});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['Name'];
    nick = json['Nick'];
    password = json['Password'];
    email = json['Email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['Name'] = this.name;
    data['Nick'] = this.nick;
    data['Password'] = this.password;
    data['Email'] = this.email;
    return data;
  }
}