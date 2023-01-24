import 'package:flutter/material.dart';

Widget buildSectionTitle(BuildContext context, String text) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10),
    child: Text(
      text,
      style: Theme.of(context).textTheme.bodyText2,
    ),
  );
}