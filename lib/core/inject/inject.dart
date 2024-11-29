import 'package:get_it/get_it.dart';
import 'package:movie_app/src/data/datasources/api/movies/movies_now_playing_api_datasource_imp.dart';
import 'package:movie_app/src/data/datasources/api/movies/movies_popular_api_datasource_imp.dart';
import 'package:movie_app/src/data/datasources/datasources/movies/movies_now_playing_datasource.dart';
import 'package:movie_app/src/data/datasources/datasources/movies/movies_popular_datasource.dart';
import 'package:movie_app/src/data/repositories/movies/movies_now_playing_repository_imp.dart';
import 'package:movie_app/src/data/repositories/movies/movies_popular_repository_imp.dart';
import 'package:movie_app/src/domain/repositories/movies/movies_now_playing_repository.dart';
import 'package:movie_app/src/domain/repositories/movies/movies_popular_repository.dart';
import 'package:movie_app/src/domain/usecases/movies/movies_now_playing/movies_now_playing_usecase.dart';
import 'package:movie_app/src/domain/usecases/movies/movies_now_playing/movies_now_playing_usecase_imp.dart';
import 'package:movie_app/src/domain/usecases/movies/movies_popular_usecase/movies_popular_usecase.dart';
import 'package:movie_app/src/domain/usecases/movies/movies_popular_usecase/movies_popular_usecase_imp.dart';
import 'package:movie_app/src/presentation/controllers/home_controllers/home_controller.dart';
import 'package:movie_app/src/presentation/controllers/home_controllers/movies_popular_controller.dart';
import 'package:movie_app/src/presentation/controllers/home_controllers/now_playing_controller.dart';

class Inject {
  static void init() async {
    final getIt = GetIt.I;

    //DataSources ------------------------------------------------------------------------
    getIt.registerLazySingleton<MoviesPopularDataSource>(
        () => MoviesPopularApiDataSourceImp());

    getIt.registerLazySingleton<MoviesNowPlayingDataSource>(
        () => MoviesNowPlayingApiDataSourceImp());

    //Repositories -----------------------------------------------------------------------
    getIt.registerLazySingleton<MoviesPopularRepository>(
        () => MoviesPopularRepositoryImp(moviesPopularDataSource: getIt()));

    getIt.registerLazySingleton<MoviesNowPlayingRepository>(() =>
        MoviesNowPlayingRepositoryImp(moviesNowPlayingDataSource: getIt()));

    //UseCases ---------------------------------------------------------------------------
    getIt.registerLazySingleton<MoviesPopularUseCase>(
        () => MoviesPopularUseCaseImp(moviesPopularRepository: getIt()));

    getIt.registerLazySingleton<MoviesNowPlayingUseCase>(
        () => MoviesNowPlayingUseCaseImp(moviesNowPlayingRepository: getIt()));

    //Controllers ------------------------------------------------------------------------
    getIt.registerLazySingleton<HomeController>(() => HomeController());

    getIt.registerLazySingleton<MoviesPopularController>(
        () => MoviesPopularController(getIt()));

    getIt.registerLazySingleton<NowPlayingController>(
        () => NowPlayingController(getIt()));
  }
}
