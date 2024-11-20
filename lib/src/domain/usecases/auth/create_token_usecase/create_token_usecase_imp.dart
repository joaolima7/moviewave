import 'package:movie_app/src/domain/repositories/auth/create_token_repository.dart';
import 'package:movie_app/src/domain/usecases/auth/create_token_usecase/create_token_usecase.dart';

class CreateTokenUseCaseImp implements CreateTokenUseCase {
  CreateTokenRepository _createTokenRepository;

  CreateTokenUseCaseImp(
    this._createTokenRepository,
  );

  @override
  Future<String> call() async {
    return await _createTokenRepository();
  }
}
