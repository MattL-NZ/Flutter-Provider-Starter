import 'package:flutter/material.dart';
import 'package:provider_architecutre/core/constants/enums.dart';
import 'package:provider_architecutre/core/viewmodels/login_model.dart';
import 'package:provider_architecutre/ui/shared/app_colors.dart' as prefix0;
import 'package:provider_architecutre/ui/views/base_view.dart';
import 'package:provider_architecutre/ui/widgets/login_header.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _controller = new TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return BaseView<LoginModel>(
      builder: (context, model, child) => Scaffold(
        backgroundColor: prefix0.backgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LoginHeader(
              controller: _controller,
              validationMessage: model.errorMessage,
            ),
            model.state == ViewState.Busy
            ? Center(child: CircularProgressIndicator())
            : FlatButton(
              color: Colors.white,
              child: Text(
                'Login',
                style: TextStyle(color: Colors.black)
              ),
              onPressed: () async {
                var loginSuccess = await model.login(_controller.text);
                if(loginSuccess) {
                  Navigator.pushNamed(context, 'home');
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
