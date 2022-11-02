import 'package:flutter/material.dart';

import 'favorite_widget.dart';

Widget titleSection = Container(
  padding: const EdgeInsets.all(32),
  //color: Colors.green[200],
  child: Row(
    children: <Widget>[
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Text(
                'kinkaku-ji Temple',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              'Kyoto, Japan',
              style: TextStyle(fontSize: 16.0, color: Colors.grey[500]),
            ),
          ],
        ),
      ),
      const FavoriteWidget()
    ],
  ),
);
