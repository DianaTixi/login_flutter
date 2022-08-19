import 'package:ejemplo/app/domain/models/regla.dart';
import 'package:flutter_meedu/meedu.dart';

import '../../domain/models/menu.dart';

class SessionController extends SimpleNotifier {
  Menu? _menu;
  Menu? get menu => menu;

  Regla? _regla;
  Regla? get regla => regla;

  void setMenu(Menu Menu) {
    _menu = menu;
    notify();
  }

  void setRegla(Regla regla) {
    _regla = regla;
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
