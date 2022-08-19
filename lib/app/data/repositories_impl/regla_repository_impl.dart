import 'package:ejemplo/app/domain/models/menu.dart';
import 'package:ejemplo/app/domain/models/regla.dart';
import 'package:ejemplo/app/domain/repositories/regla_repository.dart';

import '../data_source/remote/getreglas_api.dart';

class ReglaRepositoryImpl implements ReglaRepository {
  final ReglaApi _api;

  List<Regla> regla = [];

  ReglaRepositoryImpl(this._api);

  @override
  Future<List<Regla>> getReglas() => _api.getRegla();
}
