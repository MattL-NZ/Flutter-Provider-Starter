import 'package:flutter/material.dart';
import 'package:provider_architecutre/ui/shared/text_styles.dart';
import 'package:provider_architecutre/ui/shared/ui_helpers.dart';

class LoginHeader extends StatelessWidget {
  final TextEditingController controller;
  final String validationMessage;

  LoginHeader({@required this.controller, this.validationMessage});

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text('Login', style: headerStyle),
      UIHelper.verticalSpaceMedium(),
      Text('Enter a User Id between 1 - 10', style: subHeaderStyle),
      LoginTextField(controller),
      this.validationMessage != null
      ? Text(validationMessage, style: TextStyle(color: Colors.white, fontSize: 20.0))
      : Container()
    ]);
  }
}

class LoginTextField extends StatelessWidget {
  final TextEditingController controller;

  LoginTextField(this.controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      height: 50.0,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
      child: TextField(
          decoration: InputDecoration.collapsed(hintText: 'User Id'),
          controller: controller),
    );
  }
}
