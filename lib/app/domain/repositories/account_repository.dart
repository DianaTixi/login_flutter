import '../models/menu.dart';

abstract class MenuRepository {
  Future<Menu?> get menu;
}
