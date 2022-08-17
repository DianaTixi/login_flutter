import 'package:ejemplo/app/domain/models/menu.dart';
import 'package:flutter_meedu/meedu.dart';

import '../../../../domain/repositories/account_repository.dart';

class HomeController extends SimpleNotifier {
  final MenuRepository _menuRepository = Get.find();
  int _counter = 0;
  int get counter => _counter;

  void increment() {
    _counter++;
    notify();
  }

  HomeController() {
    init();
  }

  init(){
  }

  getMenus() async {
    final res = await _menuRepository.getMenus();
    res.forEach((element) {
      print("Menujjjjjjjj");
      print(element.toJson());
    });
  }
}
  