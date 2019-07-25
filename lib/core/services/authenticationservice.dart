import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:provider_architecutre/core/models/user.dart';
import 'package:provider_architecutre/locator.dart';

import 'api.dart';

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