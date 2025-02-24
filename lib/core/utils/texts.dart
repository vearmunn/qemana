import 'package:flutter/material.dart';
import 'package:qemana/core/utils/colors.dart';

TextStyle extraLargeText(
    {double size = 32, color = customBlack, weight = FontWeight.bold}) {
  return TextStyle(fontSize: size, color: color, fontWeight: weight);
}

TextStyle largeText(
    {double size = 28, color = customBlack, weight = FontWeight.bold}) {
  return TextStyle(fontSize: size, color: color, fontWeight: weight);
}

TextStyle mediumText(
    {double size = 16,
    color = customBlack,
    weight = FontWeight.w600,
    useShadow = false}) {
  return TextStyle(
    fontSize: size,
    color: color,
    fontWeight: weight,
    shadows: [
      Shadow(
        blurRadius: 8.0,
        color: useShadow ? Colors.black87 : Colors.transparent,
        offset: const Offset(4.0, 4.0),
      ),
    ],
  );
}

TextStyle regularText(
    {double size = 14, color = customBlack, weight = FontWeight.normal}) {
  return TextStyle(fontSize: size, color: color, fontWeight: weight);
}

TextStyle smallText(
    {double size = 12, color = Colors.grey, weight = FontWeight.w500}) {
  return TextStyle(fontSize: size, color: color, fontWeight: weight);
}

TextStyle extraSmallText(
    {double size = 10, color = Colors.grey, weight = FontWeight.w500}) {
  return TextStyle(fontSize: size, color: color, fontWeight: weight);
}
