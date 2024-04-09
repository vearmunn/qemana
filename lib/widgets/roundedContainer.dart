// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class RoundedContainer extends StatelessWidget {
  const RoundedContainer({
    super.key,
    required this.child,
    this.padding = 12,
    this.color = Colors.white,
    this.useShadow = true,
    this.useBorder = false,
    this.borderRadius = 40,
  });

  final Widget child;
  final double padding;
  final Color color;
  final bool useShadow;
  final bool useBorder;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(
                color: useBorder ? Colors.grey[300]! : Colors.transparent,
                width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(useShadow ? 0.1 : 0),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ]),
        child: child);
  }
}
