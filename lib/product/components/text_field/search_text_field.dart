import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final ValueSetter<String>? onChanged;
  final TextEditingController? controller;
  final VoidCallback? onClear;
  final String? hintText;

  const SearchTextField({
    Key? key,
    this.onChanged,
    this.controller,
    this.onClear,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: TextField(
        onChanged: onChanged,
        controller: controller,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 18,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(5),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          hintText: hintText,
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.black,
            size: 30,
          ),
          suffixIcon: InkWell(
            onTap: onClear,
            child: const Icon(
              Icons.cancel_outlined,
              color: Colors.black,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }
}
