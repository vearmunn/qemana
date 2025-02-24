import 'package:flutter/material.dart';

void showSnackbar(context, String message, {Color bgColor = Colors.red}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    backgroundColor: bgColor,
  ));
}
