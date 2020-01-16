class ListVideo {
  String sId;
  String idAnime;
  String title;
  String url;
  String episode;
  String season;

  ListVideo(
      {this.sId,
        this.idAnime,
        this.title,
        this.url,
        this.episode,
        this.season});

  ListVideo.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    idAnime = json['idAnime'];
    title = json['title'];
    url = json['url'];
    episode = json['episode'];
    season = json['season'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['idAnime'] = this.idAnime;
    data['title'] = this.title;
    data['url'] = this.url;
    data['episode'] = this.episode;
    data['season'] = this.season;
    return data;
  }
}