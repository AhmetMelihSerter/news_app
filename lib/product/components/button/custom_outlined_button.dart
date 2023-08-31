import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    super.key,
    this.width = .5,
    this.onPressed,
    required this.child,
  });
  final double width;
  final VoidCallback? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.sized.dynamicHeight(width),
      child: OutlinedButton(
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
