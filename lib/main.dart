import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecutre/core/models/user.dart';
import 'package:provider_architecutre/core/services/authenticationservice.dart';
import 'package:provider_architecutre/locator.dart';
import 'package:provider_architecutre/ui/router.dart';
import 'package:provider_architecutre/ui/views/login_view.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  StreamProvider<User>.controller(
      initialData: User.initial(),
      builder: (context) => locator<AuthenticationService>().userController,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(),
        home: LoginView(),
        initialRoute: 'login',
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}
