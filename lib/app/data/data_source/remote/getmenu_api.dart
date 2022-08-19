import 'dart:convert';

import 'package:ejemplo/app/data/data_source/remote/local/authentication_client.dart';
import 'package:ejemplo/app/domain/models/submenu.dart';
import 'package:tuple/tuple.dart';

import '../../../domain/models/menu.dart';
import '../../helpers/http.dart';

class MenuApi {
  final Http _http;
  final AuthenticationClient _authClient;

  MenuApi(this._http, this._authClient);

  Future<List<Menu>> getMenu() async {
    List<Menu> menus = [];
    final accessToken = await _authClient.accessToken;
    final result = await _http.request<List<Menu>>(
      'api/auth/menu/1',
      headers: {
        'x-token': accessToken ?? "",
      },
      parser: (data) {
        //print("RESPONSE ${data['menu']}");
        for (var i = 0; i < data.length; i++) {
          //print(" Data MENU ${i} ,  ${data['menu'][i]}");
          menus.add(Menu.fromJson(data['menu'][i]));
        }
        menus.forEach((element) {
          //print('elementos');
          print(element.toJson());
        });
        return menus;
      },
    );
    return menus;
  }
}
