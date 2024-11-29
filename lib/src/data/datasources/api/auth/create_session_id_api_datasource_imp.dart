import 'package:dio/dio.dart';
import 'package:movie_app/core/consts/api_consts.dart';
import 'package:movie_app/src/data/datasources/datasources/auth/create_session_id_datasource.dart';

class CreateSessionIdApiDataSourceImp implements CreateSessionIdDataSource {
  @override
  Future<String> call(String resquestToken) async {
    try {
      final response = await Dio().post(
        '${APICONSTS.urlAuthentication}session/new',
        queryParameters: {'api_key': '${APICONSTS.key}'},
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );
      if (response.statusCode == 200) {
        final data = response.data;
        return data['session_id'];
      } else {
        throw Exception('Failed to create session ID: ${response.data}');
      }
    } on DioException catch (e) {
      throw Exception('Request failed: ${e.response?.data ?? e.message}');
    }
  }
}
