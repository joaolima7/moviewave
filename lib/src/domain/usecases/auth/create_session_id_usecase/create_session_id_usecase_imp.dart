import 'package:movie_app/src/domain/repositories/auth/create_session_id_repository.dart';
import 'package:movie_app/src/domain/usecases/auth/create_session_id_usecase/create_session_id_usecase.dart';

class CreateSessionIdUseCaseImp implements CreateSessionIdUseCase {
  CreateSessionIdRepository _createSessionIdRepository;

  CreateSessionIdUseCaseImp(
    this._createSessionIdRepository,
  );

  @override
  Future<String> call(String resquestToken) async {
    return await _createSessionIdRepository(resquestToken);
  }
}
