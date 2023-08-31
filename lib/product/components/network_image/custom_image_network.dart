import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class CustomImageNetwork extends StatelessWidget {
  const CustomImageNetwork({
    super.key,
    required this.imageUrl,
    this.width = .18,
    this.height = .07,
  });

  final String imageUrl;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.sized.dynamicWidth(width),
      height: context.sized.dynamicHeight(height),
      child: Image.network(
        imageUrl,
        errorBuilder: (context, error, stackTrace) => Icon(
          Icons.error,
          size: context.sized.dynamicHeight(height),
        ),
      ),
    );
  }
}
