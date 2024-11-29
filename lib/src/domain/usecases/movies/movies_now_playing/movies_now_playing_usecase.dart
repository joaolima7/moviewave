import 'package:dartz/dartz.dart';
import 'package:movie_app/src/domain/entities/movie_entity.dart';

abstract class MoviesNowPlayingUseCase {
  Future<Either<Exception, List<MovieEntity>>> call();
}
