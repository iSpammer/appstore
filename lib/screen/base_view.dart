

import 'package:flutter/cupertino.dart';
import 'package:carisma/viewmodels/base_view_model.dart';
import 'package:provider/provider.dart';

class BaseView<T extends BaseViewModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T viewModel, Widget? child) builder;
  final T viewModel;
  final Function(T)? onModelReady;
  // final Widget child;

  BaseView({required Key key, required this.builder, required this.viewModel, required this.onModelReady});

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  late T viewModel;

  @override
  void initState() {
    // TODO: implement initState
    viewModel = widget.viewModel;
    if (widget.onModelReady != null) {
      widget.onModelReady!(viewModel);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ChangeNotifierProvider<T>(
      create: (BuildContext context) {
        return viewModel;
      },
      child: Consumer(
        builder: (widget.builder)
      ),
    );
  }
}



