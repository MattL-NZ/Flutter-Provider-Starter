import 'package:flutter/widgets.dart';
import 'package:provider_architecutre/core/constants/enums.dart';
import 'package:provider_architecutre/core/services/authenticationservice.dart';
import 'package:provider_architecutre/locator.dart';

/*
    The BaseModel class is used purely for state management.
    We extend this class in each of the viewmodel classes so we can get the state
    of the UI. After setting the state, we call nofitifListers() to update the UI.
*/

class BaseModel extends  ChangeNotifier{
  ViewState _state = ViewState.Idle;
  ViewState get state => _state;

  setState(ViewState state) {
    _state = state;
    notifyListeners();
  }
}