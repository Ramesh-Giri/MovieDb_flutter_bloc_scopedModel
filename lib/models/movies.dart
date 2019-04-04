class Movies {
  int voteCount;
  int id;
  bool video;
  double voteAverage;
  String title;
  double popularity;
  String posterPath;
  String originalLanguage;
  String backdropPath;
  bool adult;
  String overview;
  String releaseDate;

  Movies({
    this.voteCount,
    this.id,
    this.video,
    this.voteAverage,
    this.title,
    this.popularity,
    this.posterPath,
    this.originalLanguage,
    this.backdropPath,
    this.adult,
    this.overview,
    this.releaseDate,
});

  Movies.fromJson(Map<String, dynamic> json) {
    voteCount = json["vote_count"];
    id = json["id"];
    video = json["video"];
    voteAverage = json["vote_average"].toDouble();
    title = json["title"];
    popularity = json["popularity"].toDouble();
    posterPath = json["poster_path"];
    originalLanguage = json["original_language"];
    backdropPath = json["backdrop_path"];
    adult = json["adult"];
    overview = json["overview"];
    releaseDate = json["release_date"];
  }

  Map<String,dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["vote_count"] = this.voteCount;
    data["id"] = this.id;
    data["video"] = this.video;
    data["vote_average"] = this.voteAverage;
    data["title"] = this.title;
    data["popularity"] = this.popularity;
    data["poster_path"] = this.posterPath;
    data["original_language"] = this.originalLanguage;
    data["backdrop_path"] = this.backdropPath;
    data["overview"] = this.overview;
    data["release_date"] = this.releaseDate;
    data["adult"] = this.adult;

    return data;
  }
}