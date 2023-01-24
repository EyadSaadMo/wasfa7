import 'package:flutter/material.dart';

Widget buildContainer(Widget child) {
  return   Container(
    padding: const EdgeInsets.all(5),
    margin: const EdgeInsets.all(5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),

    ),
    height: 220,
    width: 300,
    child: child
  );
}
