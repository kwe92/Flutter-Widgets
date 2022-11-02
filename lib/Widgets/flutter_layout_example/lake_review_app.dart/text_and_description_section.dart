import 'package:flutter/material.dart';

Widget textSection = const Padding(
  padding: EdgeInsets.fromLTRB(32.0, 0, 32.0, 32.0),
  child: Text(
    'Kinkaku-ji (金閣寺, literally "Temple of the Golden Pavilion"), officially named Rokuon-ji (鹿苑寺, literally "Deer Garden Temple"), is a Zen Buddhist temple in Kyoto, Japan.[2] It is one of the most popular buildings in Kyoto, attracting many visitors annually.[3] It is designated as a National Special Historic Site, a National Special Landscape and is one of 17 locations making up the Historic Monuments of Ancient Kyoto which are World Heritage Sites.',
    softWrap: true,
    style: TextStyle(fontSize: 16.0),
  ),
);

Widget descriptionText = const Padding(
  padding: EdgeInsets.fromLTRB(18.0, 10.0, 0, 10.0),
  child: Text(
    'Description:',
    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
  ),
);
