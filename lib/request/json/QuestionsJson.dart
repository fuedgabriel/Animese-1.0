class QuestionsJson {
  List<Answers> answers;
  String title;
  int correct;
  int matter;

  QuestionsJson({this.answers, this.title, this.correct, this.matter});

  QuestionsJson.fromJson(Map<String, dynamic> json) {
    if (json['Answers'] != null) {
      answers = new List<Answers>();
      json['Answers'].forEach((v) {
        answers.add(new Answers.fromJson(v));
      });
    }
    title = json['Title'];
    correct = json['Correct'];
    matter = json['Matter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.answers != null) {
      data['Answers'] = this.answers.map((v) => v.toJson()).toList();
    }
    data['Title'] = this.title;
    data['Correct'] = this.correct;
    data['Matter'] = this.matter;
    return data;
  }
}

class Answers {
  String s1;
  String s2;
  String s3;
  String s4;
  String s5;

  Answers({this.s1, this.s2, this.s3, this.s4, this.s5});

  Answers.fromJson(Map<String, dynamic> json) {
    s1 = json['1'];
    s2 = json['2'];
    s3 = json['3'];
    s4 = json['4'];
    s5 = json['5'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['1'] = this.s1;
    data['2'] = this.s2;
    data['3'] = this.s3;
    data['4'] = this.s4;
    data['5'] = this.s5;
    return data;
  }
}