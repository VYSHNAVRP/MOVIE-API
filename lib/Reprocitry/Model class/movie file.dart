
class MovieModel {
  List<Movies>? movies;
  int? page;

  MovieModel({this.movies, this.page});

  MovieModel.fromJson(Map<String, dynamic> json) {
    if(json["movies"] is List) {
      movies = json["movies"] == null ? null : (json["movies"] as List).map((e) => Movies.fromJson(e)).toList();
    }
    if(json["page"] is num) {
      page = (json["page"] as num).toInt();
    }
  }

  static List<MovieModel> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => MovieModel.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(movies != null) {
      _data["movies"] = movies?.map((e) => e.toJson()).toList();
    }
    _data["page"] = page;
    return _data;
  }

  MovieModel copyWith({
    List<Movies>? movies,
    int? page,
  }) => MovieModel(
    movies: movies ?? this.movies,
    page: page ?? this.page,
  );
}

class Movies {
  int? id;
  String? backdropPath;
  String? firstAired;
  List<String>? genres;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? title;
  String? contentType;

  Movies({this.id, this.backdropPath, this.firstAired, this.genres, this.originalTitle, this.overview, this.posterPath, this.title, this.contentType});

  Movies.fromJson(Map<String, dynamic> json) {
    if(json["_id"] is num) {
      id = (json["_id"] as num).toInt();
    }
    if(json["backdrop_path"] is String) {
      backdropPath = json["backdrop_path"];
    }
    if(json["first_aired"] is String) {
      firstAired = json["first_aired"];
    }
    if(json["genres"] is List) {
      genres = json["genres"] == null ? null : List<String>.from(json["genres"]);
    }
    if(json["original_title"] is String) {
      originalTitle = json["original_title"];
    }
    if(json["overview"] is String) {
      overview = json["overview"];
    }
    if(json["poster_path"] is String) {
      posterPath = json["poster_path"];
    }
    if(json["title"] is String) {
      title = json["title"];
    }
    if(json["contentType"] is String) {
      contentType = json["contentType"];
    }
  }

  static List<Movies> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Movies.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["backdrop_path"] = backdropPath;
    _data["first_aired"] = firstAired;
    if(genres != null) {
      _data["genres"] = genres;
    }
    _data["original_title"] = originalTitle;
    _data["overview"] = overview;
    _data["poster_path"] = posterPath;
    _data["title"] = title;
    _data["contentType"] = contentType;
    return _data;
  }

  Movies copyWith({
    int? id,
    String? backdropPath,
    String? firstAired,
    List<String>? genres,
    String? originalTitle,
    String? overview,
    String? posterPath,
    String? title,
    String? contentType,
  }) => Movies(
    id: id ?? this.id,
    backdropPath: backdropPath ?? this.backdropPath,
    firstAired: firstAired ?? this.firstAired,
    genres: genres ?? this.genres,
    originalTitle: originalTitle ?? this.originalTitle,
    overview: overview ?? this.overview,
    posterPath: posterPath ?? this.posterPath,
    title: title ?? this.title,
    contentType: contentType ?? this.contentType,
  );
}