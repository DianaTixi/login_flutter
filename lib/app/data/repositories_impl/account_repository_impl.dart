import 'package:ejemplo/app/data/data_source/remote/getmenu_api.dart';
import 'package:ejemplo/app/domain/models/menu.dart';
import 'package:ejemplo/app/domain/repositories/account_repository.dart';

class MenuRepositoryImpl implements MenuRepository {
  final MenuApi _api;

  MenuRepositoryImpl(this._api);

  @override
  Future<List<Menu>> getMenus() => _api.getMenu();




}
