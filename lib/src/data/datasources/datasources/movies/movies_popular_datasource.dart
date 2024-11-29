import 'package:dartz/dartz.dart';

import '../../../../domain/entities/movie_entity.dart';

abstract class MoviesPopularDataSource {
  Future<Either<Exception, List<MovieEntity>>> call();
}
