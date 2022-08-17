import 'package:ejemplo/app/data/data_source/remote/getmenu_api.dart';
import 'package:ejemplo/app/domain/models/menu.dart';
import 'package:ejemplo/app/domain/repositories/account_repository.dart';

import '../../domain/models/menu.dart';

class MenuRepositoryImpl implements MenuRepository {
  final MenuApi _api;
  List<Menu> menus = [];

  MenuRepositoryImpl(this._api);

  @override
  Future<Menu?> get menu async {
    //final result = await _api.getMenu(menus);
  }
}
