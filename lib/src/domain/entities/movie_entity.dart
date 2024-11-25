class MovieEntity {
  final int id;
  final String title;
  final String originalTitle;
  final String overview;
  final String posterPath;
  final String backdropPath;
  final String mediaType;
  final bool adult;
  final String originalLanguage;
  final List<int> genreIds;
  final double popularity;
  final String releaseDate;
  final bool video;
  final double voteAverage;
  final int voteCount;

  MovieEntity({
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.mediaType,
    required this.adult,
    required this.originalLanguage,
    required this.genreIds,
    required this.popularity,
    required this.releaseDate,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory MovieEntity.fromJson(Map<String, dynamic> json) {
    return MovieEntity(
      id: json['id'],
      title: json['title'] ?? 'Unknown Title',
      originalTitle: json['original_title'] ?? 'Unknown Original Title',
      overview: json['overview'] ?? 'No Description',
      posterPath: json['poster_path'] ?? '',
      backdropPath: json['backdrop_path'] ?? '',
      mediaType: json['media_type'] ?? 'unknown',
      adult: json['adult'] ?? false,
      originalLanguage: json['original_language'] ?? 'unknown',
      genreIds: List<int>.from(json['genre_ids'] ?? []),
      popularity: (json['popularity'] as num?)?.toDouble() ?? 0.0,
      releaseDate: json['release_date'] ?? '',
      video: json['video'] ?? false,
      voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
      voteCount: json['vote_count'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'original_title': originalTitle,
      'overview': overview,
      'poster_path': posterPath,
      'backdrop_path': backdropPath,
      'media_type': mediaType,
      'adult': adult,
      'original_language': originalLanguage,
      'genre_ids': genreIds,
      'popularity': popularity,
      'release_date': releaseDate,
      'video': video,
      'vote_average': voteAverage,
      'vote_count': voteCount,
    };
  }
}
