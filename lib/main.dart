import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_time_chat/routes/routes.dart';
import 'package:real_time_chat/services/auth_services.dart';
import 'package:real_time_chat/services/chat_service.dart';
import 'package:real_time_chat/services/socket_services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => AuthServices(),),
        ChangeNotifierProvider(create: ( _ ) => SocketService(),),
        ChangeNotifierProvider(create: ( _ ) => ChatService() ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Material App Bar'),
          ),
          body: Center(
            child: Container(
              child: Text('Hello World'),
            ),
          ),
        ),
        initialRoute: 'loading',
        routes: appRoutes,
      ),
    );
  }
}
