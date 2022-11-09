import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class CustomOutlinedButton extends StatelessWidget {
  final double width;
  final VoidCallback? onPressed;
  final Widget child;
  const CustomOutlinedButton({
    Key? key,
    this.width = .5,
    this.onPressed,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.dynamicWidth(width),
      child: OutlinedButton(
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
