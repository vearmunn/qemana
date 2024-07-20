import 'package:flutter/material.dart';

Future loadingCircle(context) {
  return showDialog(
      context: context,
      builder: (context) => const Center(
            child: CircularProgressIndicator(),
          ));
}

Widget centerLoadingCircle(context) {
  return SizedBox(
    width: double.infinity,
    height: MediaQuery.of(context).size.height * 0.7,
    child: const Center(child: CircularProgressIndicator()),
  );
}
