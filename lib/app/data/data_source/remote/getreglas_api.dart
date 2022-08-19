import 'package:ejemplo/app/data/data_source/remote/local/authentication_client.dart';
import 'package:ejemplo/app/data/helpers/http.dart';
import 'package:ejemplo/app/data/helpers/http_method.dart';
import 'package:ejemplo/app/domain/models/regla.dart';

class ReglaApi {
  final Http _http;

  final AuthenticationClient _authClient;

  ReglaApi(this._http, this._authClient);

  Future<List<Regla>> getRegla() async {
    List<Regla> reglas = [];

    final accessToken = await _authClient.accessToken;
    final result = await _http.request<List<Regla>>(
      'api/regla/',
      headers: {
        'x-token': accessToken ?? "",
      },
      parser: (data) {
        print("RESPONSE ${data['reglas']}");

        for (var i = 0; i < data.length; i++) {
          //print(data['menu'][i]);
          reglas.add(Regla.fromJson(data['reglas'][i]));
        }
        reglas.forEach((element) {
          print("Elementos de la regla");
          print(element.regId);
          print(element.regNombre);
          print(element.regActivo);
          print(element.toJson());
        });
        return reglas;
      },
    );
    return reglas;
  }
/*
  Future<Regla> postRegla(String nombre, bool estado) async {
    final accessToken = await _authClient.accessToken;
    final result = await _http.request<String>(
      'api/regla/',
      method: HttpMethod.post,
      body: {'nombre': nombre, 'activo': estado},
      parser: (data) {
        print("Resultado ${data}");
      },
    );
  }
  */
}
