import 'package:ejemplo/app/domain/models/regla.dart';

abstract class ReglaRepository {
  Future<List<Regla>> getReglas();
}
