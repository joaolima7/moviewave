import 'package:get/get.dart';
import 'package:movie_app/src/domain/entities/movie_entity.dart';
import 'package:movie_app/src/domain/usecases/movies/movies_popular_usecase/movies_popular_usecase.dart';

class MoviesPopularController extends GetxController {
  final MoviesPopularUseCase _moviesPopularUseCase;
  RxBool isLoading = false.obs;
  RxList<MovieEntity> moviesPopular = <MovieEntity>[].obs;

  MoviesPopularController(
    this._moviesPopularUseCase,
  );

  Future<void> load() async {
    isLoading.value = true;
    final result = await _moviesPopularUseCase();
    result.fold(
      (err) => print(err.toString()),
      (sucess) => moviesPopular.value = sucess,
    );
    isLoading.value = false;
  }
}
