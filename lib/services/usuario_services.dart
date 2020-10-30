import 'package:http/http.dart' as http;
import 'package:real_time_chat/global/environment.dart';
import 'package:real_time_chat/models/usuario.dart';
import 'package:real_time_chat/models/usuarios_response.dart';
import 'package:real_time_chat/services/auth_services.dart';

class UsuarioServices {
  Future<List<Usuario>> getUsuarios() async {
    try {
      final resp = await http.get('${Environment.apiUrl}/usuarios', headers: {
        'Content-Type': 'application/json',
        'x-token': await AuthServices.getToke()
      });
      final usuariosResp = listaUsuariosFromJson(resp.body);

      return usuariosResp.usuarios;
    } catch (e) {
      return [];
    }
  }
}
