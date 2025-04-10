import 'package:lingoia/data/models/register_model.dart';
import 'package:lingoia/data/repositories/auth_repository.dart';

import '../../data/models/user_model.dart';

class RegisterUseCase {
  final AuthRepository authRepository;

  RegisterUseCase(this.authRepository);

  Future<UserModel> execute(RegisterModel registerModel) async {
    return await authRepository.signup(registerModel);
  }
}
