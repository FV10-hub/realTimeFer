import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final IconData icono;
  final String placeholder;
  final TextEditingController textController;
  final TextInputType keyBoardType;
  final bool isPassword;

  const CustomInput(
      {Key key,
      @required this.icono,
      @required this.placeholder,
      @required this.textController,
      this.keyBoardType = TextInputType.text,
      this.isPassword = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5, left: 5, bottom: 5, right: 20),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: <BoxShadow>[
            BoxShadow(
                offset: Offset(0, 0.5),
                color: Colors.black.withOpacity(0.5),
                blurRadius: 5)
          ]),
      child: TextField(
        controller: this.textController,
          autocorrect: false,
          obscureText: this.isPassword,
          keyboardType: this.keyBoardType,
          decoration: InputDecoration(
              prefixIcon: Icon(this.icono),
              focusedBorder: InputBorder.none,
              border: InputBorder.none,
              hintText: this.placeholder)),
    );
  }
}
