import 'package:ejemplo/app/domain/repositories/authentication_repository/authentication_repository.dart';
import 'package:ejemplo/app/domain/response/login_response.dart';
import 'package:ejemplo/app/ui/global_controllers/session_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_meedu/meedu.dart';

import '../../../../domain/repositories/account_repository.dart';

class LoginController extends SimpleNotifier {
  final SessionController _sessionController;
  final GlobalKey<FormState> formKey = GlobalKey();
  final AutheticationRepository _auth = Get.find();
  final MenuRepository _account = Get.find();

  String _alias = '';
  String _contrasena = '';

  LoginController(this._sessionController);

  void onEmailChange(String text) {
    _alias = text;
  }

  void onPasswordChange(String text) {
    _contrasena = text;
  }

  Future<LoginResponse> submit() async {
    print("PASO 1 - PARAMETROS - ");
    print(_alias);
    print(_contrasena);
    final response = await _auth.login(_alias, _contrasena);
    if (response == LoginResponse.ok) {
      final menu = await _account.menu;
      if (menu != null) {
        _sessionController.setMenu(menu);
      } else {
        return LoginResponse.unknowError;
      }
    }
    return response;
  }
}
