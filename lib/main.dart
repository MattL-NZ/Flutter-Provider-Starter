import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecutre/core/models/user.dart';
import 'package:provider_architecutre/core/services/authenticationservice.dart';
import 'package:provider_architecutre/locator.dart';
import 'package:provider_architecutre/ui/router.dart';
import 'package:provider_architecutre/ui/views/login_view.dart';

void main() {
  // Call the setupLocator method when the app is first created to get dependency injection activated
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*
        We're wrapping the Material app in a StreamProvider because we want to be 
        able to access the User class from anywhere in the app. Doing this allows us
        to use Provider.of<User>.(context).fieldName.
        This saves having to inject the Api service into this class which is not needed
        and basically doesn't make sense.
    */
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
