class TvShowEntity {
  final bool adult;
  final String backdropPath;
  final List<int> genreIds;
  final int id;
  final List<String> originCountry;
  final String originalLanguage;
  final String originalName;
  final String overview;
  final double popularity;
  final String posterPath;
  final String firstAirDate;
  final String name;
  final double voteAverage;
  final int voteCount;

  TvShowEntity({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.firstAirDate,
    required this.name,
    required this.voteAverage,
    required this.voteCount,
  });

  factory TvShowEntity.fromMap(Map<String, dynamic> map) {
    return TvShowEntity(
      adult: map['adult'] ?? false,
      backdropPath: map['backdrop_path'] ?? '',
      genreIds: List<int>.from(map['genre_ids'] ?? []),
      id: map['id'] ?? 0,
      originCountry: List<String>.from(map['origin_country'] ?? []),
      originalLanguage: map['original_language'] ?? '',
      originalName: map['original_name'] ?? '',
      overview: map['overview'] ?? '',
      popularity: (map['popularity'] ?? 0).toDouble(),
      posterPath: map['poster_path'] ?? '',
      firstAirDate: map['first_air_date'] ?? '',
      name: map['name'] ?? '',
      voteAverage: (map['vote_average'] ?? 0).toDouble(),
      voteCount: map['vote_count'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'adult': adult,
      'backdrop_path': backdropPath,
      'genre_ids': genreIds,
      'id': id,
      'origin_country': originCountry,
      'original_language': originalLanguage,
      'original_name': originalName,
      'overview': overview,
      'popularity': popularity,
      'poster_path': posterPath,
      'first_air_date': firstAirDate,
      'name': name,
      'vote_average': voteAverage,
      'vote_count': voteCount,
    };
  }
}
