import 'package:dartz/dartz.dart';
import 'package:movie_app/src/data/datasources/datasources/movies/movies_popular_datasource.dart';
import 'package:movie_app/src/domain/entities/movie_entity.dart';
import 'package:movie_app/src/domain/repositories/movies/movies_popular_repository.dart';

class MoviesPopularRepositoryImp implements MoviesPopularRepository {
  MoviesPopularDataSource _moviesPopularDataSource;

  MoviesPopularRepositoryImp(
      {required MoviesPopularDataSource moviesPopularDataSource})
      : _moviesPopularDataSource = moviesPopularDataSource;

  @override
  Future<Either<Exception, List<MovieEntity>>> call() async {
    return await _moviesPopularDataSource();
  }
}
