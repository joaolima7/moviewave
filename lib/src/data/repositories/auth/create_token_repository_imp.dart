import 'package:movie_app/src/data/datasources/datasources/create_token_datasource.dart';
import 'package:movie_app/src/domain/repositories/auth/create_token_repository.dart';

class CreateTokenRepositoryImp implements CreateTokenRepository {
  CreateTokenDataSource _createTokenDataSource;

  CreateTokenRepositoryImp(
    this._createTokenDataSource,
  );

  @override
  Future<String> call() async {
    return await _createTokenDataSource();
  }
}
