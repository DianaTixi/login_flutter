import 'dart:async';
import 'dart:convert';
import 'dart:core';

import 'package:ejemplo/app/domain/models/menu.dart';
import 'package:ejemplo/app/domain/models/submenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';

import '../../../../domain/repositories/account_repository.dart';

class HomeController extends SimpleNotifier {
  final MenuRepository _menuRepository = Get.find();
  int _counter = 0;
  int get counter => _counter;

  List<Menu> _menues = [];
  List<Menu> get menues => _menues;

  List<Submenu> _submenu = [];
  List<Submenu> get submenu => _submenu;

  HomeController() {
    init();
  }
  init() async {
    await getMenus();
  }

  getMenus() async {
    print("Llama metodo GET MUS");
    final res = await _menuRepository.getMenus();
    if (_menues.length <= res.length) {
      res.forEach((element) {
        if (element.hijos.length > 0) {
          for (var i = 0; i < element.hijos.length; i++) {
            _submenu.add(element.hijos[i]);
          }
        }
        _menues.add(element);
      });
    }
  }
}
