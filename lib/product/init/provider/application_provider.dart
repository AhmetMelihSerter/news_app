import 'package:news_app/product/providers/theme_provider.dart';
import 'package:provider/provider.dart';

import 'package:provider/single_child_widget.dart';

class ApplicationProvider {
  static List<SingleChildWidget> uiChangesItems = [
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
    ),
  ];
}
