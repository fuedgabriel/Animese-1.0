class ListAnime {
  String sId;
  String title;
  String englishTitle;
  String synopse;
  int seasons;
  String status;
  String category;
  int episodes;
  double score;
  String air;
  String url;

  ListAnime(
      {this.sId,
        this.title,
        this.englishTitle,
        this.synopse,
        this.seasons,
        this.status,
        this.category,
        this.episodes,
        this.score,
        this.air,
        this.url});

  ListAnime.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['Title'];
    englishTitle = json['English'];
    synopse = json['Synopse'];
    seasons = json['Seasons'];
    status = json['Status'];
    category = json['Category'];
    episodes = json['Episodes'];
    score = json['Score'];
    air = json['air'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['Title'] = this.title;
    data['English'] = this.englishTitle;
    data['Synopse'] = this.synopse;
    data['Seasons'] = this.seasons;
    data['Status'] = this.status;
    data['Category'] = this.category;
    data['Episodes'] = this.episodes;
    data['Score'] = this.score;
    data['air'] = this.air;
    data['url'] = this.url;
    return data;
  }
}