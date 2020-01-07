class ListAnimePage {
  List<Docs> docs;
  int total;
  int limit;
  String page;
  int pages;

  ListAnimePage({this.docs, this.total, this.limit, this.page, this.pages});

  ListAnimePage.fromJson(Map<String, dynamic> json) {
    if (json['docs'] != null) {
      docs = new List<Docs>();
      json['docs'].forEach((v) {
        docs.add(new Docs.fromJson(v));
      });
    }
    total = json['total'];
    limit = json['limit'];
    page = json['page'];
    pages = json['pages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.docs != null) {
      data['docs'] = this.docs.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['limit'] = this.limit;
    data['page'] = this.page;
    data['pages'] = this.pages;
    return data;
  }
}

class Docs {
  String sId;
  String title;
  String english;
  String japanese;
  String synopse;
  int seasons;
  String status;
  String category;
  String studio;
  int episodes;
  double score;
  String air;
  int age;
  String url;
  int iV;

  Docs(
      {this.sId,
        this.title,
        this.english,
        this.japanese,
        this.synopse,
        this.seasons,
        this.status,
        this.category,
        this.studio,
        this.episodes,
        this.score,
        this.air,
        this.age,
        this.url,
        this.iV});

  Docs.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['Title'];
    english = json['English'];
    japanese = json['Japanese'];
    synopse = json['Synopse'];
    seasons = json['Seasons'];
    status = json['Status'];
    category = json['Category'];
    studio = json['Studio'];
    episodes = json['Episodes'];
    score = json['Score'];
    air = json['air'];
    age = json['age'];
    url = json['url'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['Title'] = this.title;
    data['English'] = this.english;
    data['Japanese'] = this.japanese;
    data['Synopse'] = this.synopse;
    data['Seasons'] = this.seasons;
    data['Status'] = this.status;
    data['Category'] = this.category;
    data['Studio'] = this.studio;
    data['Episodes'] = this.episodes;
    data['Score'] = this.score;
    data['air'] = this.air;
    data['age'] = this.age;
    data['url'] = this.url;
    data['__v'] = this.iV;
    return data;
  }
}