import 'package:provider/single_child_widget.dart';

class ApplicationProvider {
  static ApplicationProvider? _instance;

  static ApplicationProvider get instance => _instance ??= ApplicationProvider._internal();

  ApplicationProvider._internal();

  List<SingleChildWidget> uiChangesItems = [];
}
