import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

extension StatefulWidgetExtension<T extends StatefulWidget> on State<T> {
  Widget buildSpacer({double? width, double height = .05}) {
    return Builder(
      builder: (context) => SizedBox(
        width: width != null ? context.sized.dynamicHeight(width) : null,
        height: context.sized.dynamicHeight(height),
      ),
    );
  }
}

extension StatelessWidgetExtension on StatelessWidget {
  Widget buildSpacer({double? width, double height = .05}) {
    return Builder(
      builder: (context) => SizedBox(
        width: width != null ? context.sized.dynamicHeight(width) : null,
        height: context.sized.dynamicHeight(height),
      ),
    );
  }
}
