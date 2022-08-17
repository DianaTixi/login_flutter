import 'package:flutter_meedu/meedu.dart';

import '../../domain/models/menu.dart';

class SessionController extends SimpleNotifier {
  Menu? _menu;
  Menu? get menu => menu;

  void setMenu(Menu Menu) {
    _menu = menu;
    notify();
  }

  void signOut() {
    _menu = null;
    notify();
  }
}

final sessionProvider = SimpleProvider(
  (_) => SessionController(),
);
