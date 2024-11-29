import 'package:dartz/dartz.dart';
import 'package:movie_app/src/domain/entities/movie_entity.dart';

abstract class MoviesPopularUseCase {
  Future<Either<Exception, List<MovieEntity>>> call();
}
