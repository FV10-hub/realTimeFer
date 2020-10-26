import 'package:flutter/material.dart';
import 'package:real_time_chat/widgets/boton_azul.dart';

import 'package:real_time_chat/widgets/custom_input.dart';
import 'package:real_time_chat/widgets/labels.dart';
import 'package:real_time_chat/widgets/logo.dart';

class LogingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF2f2f2),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Logo(titulo: 'Mensajeria Fer',),
                  _Form(),
                  Labels(ruta:'register',titulo: 'No tienes una Cuenta?',subTitulo: 'Crea una Ahora',),
                  Text(
                    'Terminos y condiciones',
                    style: TextStyle(fontWeight: FontWeight.w200),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

class _Form extends StatefulWidget {
  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<_Form> {
  final ctlEmail = TextEditingController();
  final ctlPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          CustomInput(
            icono: Icons.mail_outline,
            placeholder: 'Email',
            keyBoardType: TextInputType.emailAddress,
            textController: ctlEmail,
          ),
          CustomInput(
            icono: Icons.lock_outline,
            placeholder: 'Password',
            textController: ctlPass,
            isPassword: true,
          ),
          // TODO: Crear boton login
          BotonAzul(
              text: 'Ingrese',
              OnPressed: () {
                print(ctlEmail.text);
              })
        ],
      ),
    );
  }
}
