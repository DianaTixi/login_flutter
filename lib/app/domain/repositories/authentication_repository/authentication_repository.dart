import 'package:ejemplo/app/domain/response/login_response.dart';

abstract class AutheticationRepository {
  Future<String?> get accessToken;
  Future<LoginResponse> login(String alias, String contrasena);
}
