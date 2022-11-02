import 'package:flutter/material.dart';

const dividerColor = Colors.black;
const padding = EdgeInsets.only(bottom: 12.0);

Widget divider(
        {EdgeInsetsGeometry padding = padding, Color color = dividerColor}) =>
    Padding(
      padding: padding,
      child: Divider(
        color: color,
      ),
    );
