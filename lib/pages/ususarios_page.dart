import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:real_time_chat/models/usuario.dart';
import 'package:real_time_chat/services/auth_services.dart';

class UsuariosPage extends StatefulWidget {
  @override
  _UsuariosPageState createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  final usuarios = [
    Usuario(online: true, email: 'test1@abc.com', nombre: 'Maria', uid: '1'),
    Usuario(online: true, email: 'test2@abc.com', nombre: 'Fernando', uid: '2'),
    Usuario(online: true, email: 'test3@abc.com', nombre: 'Ariel', uid: '3'),
    Usuario(online: false, email: 'test4@abc.com', nombre: 'Diego', uid: '4'),
    Usuario(online: true, email: 'test5@abc.com', nombre: 'Victor', uid: '5'),
    Usuario(online: true, email: 'test6@abc.com', nombre: 'Yessi', uid: '6'),
  ];

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthServices>(context);
    final usuario = authService.usuario;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          usuario.nombre,
          style: TextStyle(color: Colors.black54),
        ),
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.exit_to_app,
            color: Colors.black54,
          ),
          onPressed: () {
            Navigator.pushReplacementNamed(context, 'login');
            AuthServices.deleteToke();
          },
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            //child: Icon(Icons.check_circle, color: Colors.blue[400],),
            child: Icon(
              Icons.offline_bolt,
              color: Colors.red[400],
            ),
          )
        ],
      ),
      body: SmartRefresher(
        controller: _refreshController,
        header: WaterDropHeader(
          complete: Icon(Icons.check, color: Colors.blue[400]),
          waterDropColor: Colors.blue[400],
        ),
        onRefresh: _cargarUsuarios,
        enablePullDown: true,
        enablePullUp: true,
        child: _usuarioListView(),
      ),
    );
  }

  ListView _usuarioListView() {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (_, i) => usuarioListTile(usuarios[i]),
      itemCount: usuarios.length,
      separatorBuilder: (context, index) => Divider(),
    );
  }

  ListTile usuarioListTile(Usuario usuario) {
    return ListTile(
      title: Text(usuario.nombre),
      leading: CircleAvatar(
        child: Text(usuario.nombre.substring(0, 2)),
        backgroundColor: Colors.blue[100],
      ),
      trailing: Container(
        height: 10,
        width: 10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: usuario.online ? Colors.green : Colors.red,
        ),
      ),
    );
  }

  _cargarUsuarios() async {
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }
}
