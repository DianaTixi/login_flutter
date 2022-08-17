import 'dart:async';
import 'dart:io';

import 'package:ejemplo/app/data/helpers/http_method.dart';
import 'package:ejemplo/app/domain/response/login_response.dart';
import 'package:tuple/tuple.dart';

import '../../helpers/http.dart';

class AuthenticationApi {
  final Http _http;
  AuthenticationApi(this._http);

  Future<Tuple2<LoginResponse, String?>> login(
      String alias, String contrasena) async {
    final result =
        await _http.request<String>('api/auth', method: HttpMethod.post, body: {
      "alias": alias.trim(),
      "contrasena": contrasena.trim(),
    }, parser: (data) {
      return data['token'];
    });
    print("Result data ${result.data}");
    print("Result data runtimeType ${result.data.runtimeType}");
    print("Result error ${result.error?.data}");
    print("Result statusCode ${result.statusCode}");

    if (result.error == null) {
      return Tuple2(
        LoginResponse.ok,
        result.data,
      );
    }

    if (result.statusCode == 400) {
      return const Tuple2(LoginResponse.accessDenied, null);
    }

    final error = result.error!.exception;

    if (error is SocketException || error is TimeoutException) {
      return const Tuple2(LoginResponse.networkError, null);
    }

    return const Tuple2(LoginResponse.unknowError, null);
  }
}
