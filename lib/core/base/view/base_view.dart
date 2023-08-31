// ignore_for_file: always_use_package_imports

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../product/init/startup/startup_manager.dart';

class BaseView<T extends ChangeNotifier> extends StatefulWidget {
  const BaseView({
    super.key,
    required this.onPageBuilder,
    required this.onModelReady,
    this.onDispose,
  });

  final Widget Function(BuildContext context, T model) onPageBuilder;
  final void Function(T model) onModelReady;
  final void Function(T model)? onDispose;

  @override
  State<BaseView<T>> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends ChangeNotifier> extends State<BaseView<T>> {
  late final T model;

  @override
  void initState() {
    model = getIt<T>();
    widget.onModelReady(model);
    super.initState();
  }

  @override
  void dispose() {
    widget.onDispose?.call(model);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: model,
      child: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: widget.onPageBuilder(context, model),
      ),
    );
  }
}
