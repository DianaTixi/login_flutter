import 'dart:convert';

import 'package:ejemplo/app/domain/models/submenu.dart';

Menu menuFromJson(String str) => Menu.fromJson(json.decode(str));

String menuToJson(Menu data) => json.encode(data.toJson());

class Menu {
  Menu({
    required this.dmeId,
    required this.dmeTexto,
    required this.prgId,
    required this.prgUrlPanel,
    required this.cmeId,
    required this.cmeNombre,
    required this.dmeOrden,
    required this.hijos,
  });

  int dmeId;
  String dmeTexto;
  int prgId;
  String prgUrlPanel;
  int cmeId;
  String cmeNombre;
  int dmeOrden;
  List<Submenu> hijos;

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
      dmeId: json["dme_id"],
      dmeTexto: json["dme_texto"],
      prgId: json["prg_id"],
      prgUrlPanel: json["prg_url_panel"],
      cmeId: json["cme_id"],
      cmeNombre: json["cme_nombre"],
      dmeOrden: json["dme_orden"],
      hijos: json['hijos'] != null
          ? List<Submenu>.from(json["hijos"].map((x) => Submenu.fromJson(x)))
          : []);

  Map<String, dynamic> toJson() => {
        "dme_id": dmeId,
        "dme_texto": dmeTexto,
        "prg_id": prgId,
        "prg_url_panel": prgUrlPanel,
        "cme_id": cmeId,
        "cme_nombre": cmeNombre,
        "dme_orden": dmeOrden,
        "hijos": new List<dynamic>.from(hijos.map((x) => x.toJson())),
      };
}
