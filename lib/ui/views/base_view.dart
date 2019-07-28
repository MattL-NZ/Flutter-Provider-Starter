import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecutre/core/viewmodels/base_model.dart';
import 'package:provider_architecutre/locator.dart';

/*
    The BaseView<T> is used because a lot of the provider set up we need to do has to 
    be done on every view. We can separate this logic into another class so we don't
    need to write it each time. That way, when we add provider logic to a view, all
    we need to do is to extend the BaseView.
*/

class BaseView<T extends BaseModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T value, Widget child) builder;
  final Function(T) onModelReady;

  BaseView({this.builder, this.onModelReady});

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseModel> extends State<BaseView<T>> {
  T model = locator<T>();

  @override
  void initState() {
    if(widget.onModelReady != null) {
      widget.onModelReady(model);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T> (
      builder: (context) => model,
      child: Consumer<T>(
        builder: widget.builder
      )
    );
  }
}