import 'package:dartz/dartz.dart';

import '../../entities/movie_entity.dart';

abstract class MoviesPopularRepository {
  Future<Either<Exception, List<MovieEntity>>> call();
}
