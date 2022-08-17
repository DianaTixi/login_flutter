import 'dart:convert';

Submenu submenuFromJson(String str) => Submenu.fromJson(json.decode(str));

String submenuToJson(Submenu data) => json.encode(data.toJson());

class Submenu {
  Submenu({
    required this.dmeId,
    required this.dmeTexto,
    required this.prgId,
    required this.prgUrlPanel,
    required this.cmeId,
    required this.cmeNombre,
    required this.dmeOrden,
  });

  int dmeId;
  String dmeTexto;
  int prgId;
  String prgUrlPanel;
  int cmeId;
  String cmeNombre;
  int dmeOrden;

  Submenu copyWith({
    int? dmeId,
    String? dmeTexto,
    int? prgId,
    String? prgUrlPanel,
    int? cmeId,
    String? cmeNombre,
    int? dmeOrden,
  }) =>
      Submenu(
        dmeId: dmeId ?? this.dmeId,
        dmeTexto: dmeTexto ?? this.dmeTexto,
        prgId: prgId ?? this.prgId,
        prgUrlPanel: prgUrlPanel ?? this.prgUrlPanel,
        cmeId: cmeId ?? this.cmeId,
        cmeNombre: cmeNombre ?? this.cmeNombre,
        dmeOrden: dmeOrden ?? this.dmeOrden,
      );

  factory Submenu.fromJson(Map<String, dynamic> json) => Submenu(
        dmeId: json["dme_id"],
        dmeTexto: json["dme_texto"],
        prgId: json["prg_id"],
        prgUrlPanel: json["prg_url_panel"],
        cmeId: json["cme_id"],
        cmeNombre: json["cme_nombre"],
        dmeOrden: json["dme_orden"],
      );

  Map<String, dynamic> toJson() => {
        "dme_id": dmeId,
        "dme_texto": dmeTexto,
        "prg_id": prgId,
        "prg_url_panel": prgUrlPanel,
        "cme_id": cmeId,
        "cme_nombre": cmeNombre,
        "dme_orden": dmeOrden,
      };
}
