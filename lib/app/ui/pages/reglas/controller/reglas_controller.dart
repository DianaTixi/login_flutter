import 'package:ejemplo/app/domain/models/regla.dart';
import 'package:ejemplo/app/domain/repositories/regla_repository.dart';
import 'package:flutter_meedu/meedu.dart';

class ReglasController extends SimpleNotifier {
  final ReglaRepository _reglaRepository = Get.find();

  List<Regla> _reglas = [];
  List<Regla> get regla => _reglas;

  ReglasController() {
    init();
  }

  void init() async {
    await getReglas();
  }

  getReglas() async {
    print("GET REGLAS");
    final result = await _reglaRepository.getReglas();
    if (_reglas.length > 0) {
      result.forEach((element) {
        _reglas.add(element);
      });
    }
  }
}
