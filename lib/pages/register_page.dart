import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_time_chat/helpers/mostrar_alertas.dart';
import 'package:real_time_chat/services/auth_services.dart';
import 'package:real_time_chat/widgets/boton_azul.dart';

import 'package:real_time_chat/widgets/custom_input.dart';
import 'package:real_time_chat/widgets/labels.dart';
import 'package:real_time_chat/widgets/logo.dart';

class RegisterPage extends StatelessWidget {
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
                  Logo(titulo: 'Registrarse'),
                  _Form(),
                  Labels(
                    ruta: 'login',
                    titulo: 'Ya tengo una cuenta',
                    subTitulo: 'Regresar al Login',
                  ),
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
  final ctlName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authaservice = Provider.of<AuthServices>(context);
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          CustomInput(
            icono: Icons.account_circle_outlined,
            placeholder: 'Nombre',
            keyBoardType: TextInputType.text,
            textController: ctlName,
          ),
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
              text: 'Registrarse',
              OnPressed: authaservice.autenticando
                  ? null
                  : () async {
                      FocusScope.of(context).unfocus();
                      final registroOk = await authaservice.register(
                          ctlName.text.trim(),
                          ctlEmail.text.trim(),
                          ctlPass.text.trim());
                      if (registroOk == true) {
                        Navigator.pushReplacementNamed(context, 'usuarios');
                      } else {
                        mostrarDialogo(
                            context, 'Registro Incorrecto', registroOk);
                      }
                    })
        ],
      ),
    );
  }
}
