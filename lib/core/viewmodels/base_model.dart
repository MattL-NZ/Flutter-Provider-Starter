import 'package:flutter/widgets.dart';
import 'package:provider_architecutre/core/constants/enums.dart';
import 'package:provider_architecutre/core/services/authenticationservice.dart';
import 'package:provider_architecutre/locator.dart';

class BaseModel extends  ChangeNotifier{
  ViewState _state = ViewState.Idle;
  ViewState get state => _state;

  setState(ViewState state) {
    _state = state;
    notifyListeners();
  }
}