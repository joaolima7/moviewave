import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/src/data/datasources/datasources/movies/movies_now_playing_datasource.dart';
import 'package:movie_app/src/domain/entities/movie_entity.dart';
import '../../../../../core/consts/api_consts.dart';

class MoviesNowPlayingApiDataSourceImp implements MoviesNowPlayingDataSource {
  final _dio = Dio();
  @override
  Future<Either<Exception, List<MovieEntity>>> call() async {
    try {
      final response = await _dio.get(
        '${APICONSTS.urlBase}movie/now_playing',
        queryParameters: {
          'api_key': APICONSTS.key,
          'language': APICONSTS.language,
        },
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );
      if (response.statusCode == 200) {
        final data = response.data;

        final results = data['results'] as List<dynamic>;

        final movies =
            results.map((json) => MovieEntity.fromJson(json)).toList();

        return Right(movies);
      } else {
        return Left(Exception('Erro! ${response.statusCode}.'));
      }
    } catch (e) {
      return Left(Exception('Falha na busca.'));
    }
  }
}
