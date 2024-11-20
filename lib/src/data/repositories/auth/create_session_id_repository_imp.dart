import 'package:movie_app/src/data/datasources/datasources/create_session_id_datasource.dart';

class CreateSessionIdRepositoryImp implements CreateSessionIdDataSource {
  CreateSessionIdDataSource _createSessionIdDataSource;

  CreateSessionIdRepositoryImp(
    this._createSessionIdDataSource,
  );

  @override
  Future<String> call(String resquestToken) async {
    return await _createSessionIdDataSource(resquestToken);
  }
}
