import 'package:dartz/dartz.dart';
import 'package:movie_app/src/domain/entities/movie_entity.dart';
import 'package:movie_app/src/domain/repositories/movies/movies_now_playing_repository.dart';
import 'package:movie_app/src/domain/usecases/movies/movies_now_playing/movies_now_playing_usecase.dart';

class MoviesNowPlayingUseCaseImp implements MoviesNowPlayingUseCase {
  final MoviesNowPlayingRepository _moviesNowPlayingRepository;

  MoviesNowPlayingUseCaseImp(
      {required MoviesNowPlayingRepository moviesNowPlayingRepository})
      : _moviesNowPlayingRepository = moviesNowPlayingRepository;

  @override
  Future<Either<Exception, List<MovieEntity>>> call() async {
    return await _moviesNowPlayingRepository();
  }
}
