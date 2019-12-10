class User {
  String sId;
  String name;
  String nick;
  String password;
  String email;
  String answer;

  User(
      {this.sId, this.name, this.nick, this.password, this.email, this.answer});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['Name'];
    nick = json['Nick'];
    password = json['Password'];
    email = json['Email'];
    answer = json['Answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['Name'] = this.name;
    data['Nick'] = this.nick;
    data['Password'] = this.password;
    data['Email'] = this.email;
    data['Answer'] = this.answer;
    return data;
  }
}