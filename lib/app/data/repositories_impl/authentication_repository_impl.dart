import 'package:ejemplo/app/data/data_source/remote/authentication_api.dart';
import 'package:ejemplo/app/data/data_source/remote/local/authentication_client.dart';
import 'package:ejemplo/app/domain/repositories/authentication_repository/authentication_repository.dart';
import 'package:ejemplo/app/domain/response/login_response.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// ignore: constant_identifier_names
const TOKEN = 'TOKEN';

class AutheticationRepositoryImpl implements AutheticationRepository {
  final AuthenticationApi _api;

  final AuthenticationClient _authClient;

  //final FlutterSecureStorage _storage;

  AutheticationRepositoryImpl(
    this._api,
    this._authClient,
  );

  @override
  Future<String?> get accessToken async {
    return _authClient.accessToken;
  }

  @override
  Future<LoginResponse> login(String email, String password) async {
    final result = await _api.login(email, password);
    if (result.item1 == LoginResponse.ok) {
      await _authClient.saveToken(result.item2!);
    }
    return result.item1;
  }
}
