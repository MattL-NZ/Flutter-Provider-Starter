import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:provider_architecutre/core/models/user.dart';
import 'package:provider_architecutre/locator.dart';

import 'api.dart';

/*
    A simple Authentication Service class that handles basic login functionality.
    We inject the API class in using get_it. We also use a StreamController to
    stream (send) the User to provider so we can get it anywhere in the app.

    We use the Login method to get the user from the API service. 
    We check that a user exists and then return it.
*/

class AuthenticationService {
  Api _api = locator<Api>();
  StreamController<User> userController = StreamController<User>();

  Future<bool> login(int userId) async {
    var fetchedUser = await _api.getUserProfile(userId);

    var hasUser = fetchedUser != null;

    if(hasUser) {
      userController.add(fetchedUser);
    }

    return hasUser;
  }
}