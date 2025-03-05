// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../core/utils/colors.dart';
import '../core/utils/spacer.dart';
import 'roundedContainer.dart';

class IconWithLabel extends StatelessWidget {
  final String imagePath;
  final String label;
  final Color labelColor;
  final Color borderColor;
  final Color bgColor;
  final VoidCallback onTap;
  const IconWithLabel({
    super.key,
    required this.imagePath,
    required this.label,
    this.labelColor = Colors.white,
    this.borderColor = const Color.fromARGB(255, 97, 97, 97),
    this.bgColor = customBlack,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          RoundedContainer(
              color: bgColor,
              useBorder: true,
              borderColor: borderColor,
              child: Image.asset(
                'assets/images/$imagePath',
                width: 30,
                height: 30,
              )),
          verticalSpace(10),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(color: labelColor, fontSize: 10),
          )
        ],
      ),
    );
  }
}
