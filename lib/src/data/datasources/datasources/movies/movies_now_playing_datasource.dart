import 'package:dartz/dartz.dart';

import '../../../../domain/entities/movie_entity.dart';

abstract class MoviesNowPlayingDataSource {
  Future<Either<Exception, List<MovieEntity>>> call();
}
