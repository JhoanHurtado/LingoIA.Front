import 'package:lingoia/data/models/login_model.dart';
import 'package:lingoia/data/repositories/auth_repository.dart';

import '../../data/models/user_model.dart';

class LoginUseCase {
  final AuthRepository authRepository;

  LoginUseCase(this.authRepository);

  Future<UserModel> execute(LoginModel loginModel) async {
    return await authRepository.login(loginModel);
  }
  
}