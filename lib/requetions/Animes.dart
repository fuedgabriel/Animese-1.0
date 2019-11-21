class animes {
  String sId;
  String title;
  String english;
  String japanese;
  String synopse;
  int seasons;
  String status;
  String genres;
  String studio;
  int episodes;
  double score;
  String air;
  String url;
  int iV;

  animes(
      {this.sId,
        this.title,
        this.english,
        this.japanese,
        this.synopse,
        this.seasons,
        this.status,
        this.genres,
        this.studio,
        this.episodes,
        this.score,
        this.air,
        this.url,
        this.iV});

  animes.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['Title'];
    english = json['English'];
    japanese = json['Japanese'];
    synopse = json['Synopse'];
    seasons = json['Seasons'];
    status = json['Status'];
    genres = json['Genres'];
    studio = json['Studio'];
    episodes = json['Episodes'];
    score = json['Score'];
    air = json['air'];
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
    data['Genres'] = this.genres;
    data['Studio'] = this.studio;
    data['Episodes'] = this.episodes;
    data['Score'] = this.score;
    data['air'] = this.air;
    data['url'] = this.url;
    data['__v'] = this.iV;
    return data;
  }
}