import 'package:meta/meta.dart';
import 'dart:convert';

Regla reglaFromJson(String str) => Regla.fromJson(json.decode(str));

String reglaToJson(Regla data) => json.encode(data.toJson());

class Regla {
  Regla({
    required this.regId,
    required this.regNombre,
    required this.regActivo,
  });

  int regId;
  String regNombre;
  bool regActivo;

  factory Regla.fromJson(Map<String, dynamic> json) => Regla(
        regId: json["reg_id"],
        regNombre: json["reg_nombre"],
        regActivo: json["reg_activo"],
      );

  Map<String, dynamic> toJson() => {
        "reg_id": regId,
        "reg_nombre": regNombre,
        "reg_activo": regActivo,
      };
}
