import 'package:dartz/dartz.dart';
import 'package:movie_app/src/data/datasources/datasources/movies/movies_now_playing_datasource.dart';
import 'package:movie_app/src/domain/entities/movie_entity.dart';
import 'package:movie_app/src/domain/repositories/movies/movies_now_playing_repository.dart';

class MoviesNowPlayingRepositoryImp implements MoviesNowPlayingRepository {
  final MoviesNowPlayingDataSource _moviesNowPlayingDataSource;

  MoviesNowPlayingRepositoryImp(
      {required MoviesNowPlayingDataSource moviesNowPlayingDataSource})
      : _moviesNowPlayingDataSource = moviesNowPlayingDataSource;

  @override
  Future<Either<Exception, List<MovieEntity>>> call() async {
    return await _moviesNowPlayingDataSource();
  }
}
