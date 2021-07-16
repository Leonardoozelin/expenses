import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeTextField extends StatelessWidget {
  const AdaptativeTextField({
    Key? key,
    required this.controller,
    required this.keyboardType,
    required this.onSubmited,
    required this.decoration,
  }) : super(key: key);

  final TextEditingController controller;
  final TextInputType keyboardType;
  final void Function(String) onSubmited;
  final String decoration;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: CupertinoTextField(
              controller: controller,
              keyboardType: keyboardType,
              onSubmitted: onSubmited,
              placeholder: decoration,
              padding: EdgeInsets.symmetric(
                horizontal: 6,
                vertical: 12,
              ),
            ),
        )
        : TextField(
            controller: controller,
            keyboardType: keyboardType,
            onSubmitted: onSubmited,
            decoration: InputDecoration(
              labelText: decoration,
            ),
          );
  }
}
