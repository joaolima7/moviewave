import 'package:get/get.dart';
import 'package:movie_app/src/domain/usecases/movies/movies_now_playing/movies_now_playing_usecase.dart';

import '../../../domain/entities/movie_entity.dart';

class NowPlayingController extends GetxController {
  final MoviesNowPlayingUseCase _moviesNowPlayingUseCase;
  final RxBool isLoading = false.obs;
  RxList<MovieEntity> moviesNowPlaying = <MovieEntity>[].obs;

  NowPlayingController(
    this._moviesNowPlayingUseCase,
  );

  Future<void> load() async {
    isLoading.value = true;
    final result = await _moviesNowPlayingUseCase();
    result.fold(
      (err) => print(err.toString()),
      (sucess) => moviesNowPlaying.value = sucess,
    );
    isLoading.value = false;
  }
}
