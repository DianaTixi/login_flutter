import 'package:ejemplo/app/data/repositories_impl/authentication_repository_impl.dart';
import 'package:ejemplo/app/domain/repositories/account_repository.dart';
import 'package:ejemplo/app/domain/repositories/authentication_repository/authentication_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:meedu/src/instance_manager/instance_manager.dart';
import 'package:meedu/src/instance_manager/instance_manager.dart';

import '../../../global_controllers/session_controller.dart';
import '../../../routes/routes.dart';

class SplashController extends SimpleNotifier {
  SplashController(this._sessionController) {
    _init();
  }

  final _auth = Get.find<AutheticationRepository>();
  final MenuRepository _account = Get.find();
  final SessionController _sessionController;

  String? _routeName;

  String? get routeName => _routeName;

  Future<void> _init() async {
    final accessToken = await _auth.accessToken;
    if (accessToken != null) {
      final menu = await _account.getMenus();
      if (menu != null) {
        _routeName = Routes.HOME;
      } else {
        _routeName = Routes.LOGIN;
      }
      _routeName = Routes.LOGIN;
    } else {
      _routeName = Routes.LOGIN;
    }
    notify();
  }
}
