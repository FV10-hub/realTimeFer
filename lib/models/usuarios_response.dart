// To parse this JSON data, do
//
//     final listaUsuarios = listaUsuariosFromJson(jsonString);

import 'dart:convert';

import 'package:real_time_chat/models/usuario.dart';

ListaUsuarios listaUsuariosFromJson(String str) => ListaUsuarios.fromJson(json.decode(str));

String listaUsuariosToJson(ListaUsuarios data) => json.encode(data.toJson());

class ListaUsuarios {
    ListaUsuarios({
        this.ok,
        this.usuarios,
    });

    bool ok;
    List<Usuario> usuarios;

    factory ListaUsuarios.fromJson(Map<String, dynamic> json) => ListaUsuarios(
        ok: json["ok"],
        usuarios: List<Usuario>.from(json["usuarios"].map((x) => Usuario.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "usuarios": List<dynamic>.from(usuarios.map((x) => x.toJson())),
    };
}

