import 'package:real_time_chat/models/mensajes_response.dart';
import 'package:real_time_chat/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:real_time_chat/global/environment.dart';
import 'package:real_time_chat/models/usuario.dart';



class ChatService with ChangeNotifier {

  Usuario usuarioPara;


  Future<List<Mensaje>> getChat( String usuarioID ) async {

    final resp = await http.get('${ Environment.apiUrl }/mensajes/$usuarioID',
      headers: {
        'Content-Type': 'application/json',
        'x-token': await AuthServices.getToke()
      }
    );

    final mensajesResp = mensajesResponseFromJson(resp.body);

    return mensajesResp.mensajes;


  }



}