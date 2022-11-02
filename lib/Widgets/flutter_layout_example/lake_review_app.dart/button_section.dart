import 'package:flutter/material.dart';

const buttonSectionColor = Colors.blue;
Widget _buildButtonColumn(
        {required IconData icon,
        required Color color,
        required String label}) =>
    GestureDetector(
      onTap: () {},
      child: Column(
        children: <Widget>[
          Icon(
            icon,
            color: color,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 6.0),
            child: Text(
              label,
              style: TextStyle(color: color),
            ),
          )
        ],
      ),
    );

Widget buttonSection = Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: <Widget>[
    _buildButtonColumn(
        icon: Icons.phone, color: buttonSectionColor, label: 'CALL'),
    _buildButtonColumn(
        icon: Icons.route, color: buttonSectionColor, label: 'ROUTE'),
    _buildButtonColumn(
        icon: Icons.share, color: buttonSectionColor, label: 'SHARE')
  ],
);
