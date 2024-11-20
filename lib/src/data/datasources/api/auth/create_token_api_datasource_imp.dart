import 'package:dio/dio.dart';
import 'package:movie_app/core/consts/api_consts.dart';
import 'package:movie_app/src/data/datasources/datasources/create_token_datasource.dart';

class CreateTokenApiDataSourceImp implements CreateTokenDataSource {
  @override
  Future<String> call() async {
    try {
      final response = await Dio().post(
          '${APICONSTS.urlAuthentication}/token/new?api_key=${APICONSTS.key}');
      if (response.statusCode == 200) {
        final data = response.data;
        return data['request_token'];
      } else {
        throw Exception('Failed to create request token: ${response.data}');
      }
    } on DioException catch (e) {
      throw Exception('Request failed: ${e.response?.data ?? e.message}');
    }
  }
}
