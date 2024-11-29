import 'package:dartz/dartz.dart';
import 'package:movie_app/src/domain/entities/movie_entity.dart';
import 'package:movie_app/src/domain/repositories/movies/movies_popular_repository.dart';
import 'package:movie_app/src/domain/usecases/movies/movies_popular_usecase/movies_popular_usecase.dart';

class MoviesPopularUseCaseImp implements MoviesPopularUseCase {
  final MoviesPopularRepository _moviesPopularRepository;

  MoviesPopularUseCaseImp({
    required MoviesPopularRepository moviesPopularRepository,
  }) : _moviesPopularRepository = moviesPopularRepository;

  @override
  Future<Either<Exception, List<MovieEntity>>> call() async {
    return await _moviesPopularRepository();
  }
}
