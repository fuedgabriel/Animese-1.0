class ListAnime {
  String sId;
  String title;
  String english;
  int seasons;
  int episodes;
  String url;

  ListAnime(
      {this.sId,
        this.title,
        this.english,
        this.seasons,
        this.episodes,
        this.url});

  ListAnime.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['Title'];
    english = json['English'];
    seasons = json['Seasons'];
    episodes = json['Episodes'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['Title'] = this.title;
    data['English'] = this.english;
    data['Seasons'] = this.seasons;
    data['Episodes'] = this.episodes;
    data['url'] = this.url;
    return data;
  }
}