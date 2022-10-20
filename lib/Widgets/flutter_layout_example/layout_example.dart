import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

const buttonSectionColor = Colors.blue;

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
      const Icon(
        Icons.star,
        color: Colors.orange,
      ),
      const Text('658', style: TextStyle(fontSize: 16.0))
    ],
  ),
);

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

Widget textSection = const Padding(
  padding: EdgeInsets.fromLTRB(32.0, 0, 32.0, 32.0),
  child: Text(
    'Kinkaku-ji (金閣寺, literally "Temple of the Golden Pavilion"), officially named Rokuon-ji (鹿苑寺, literally "Deer Garden Temple"), is a Zen Buddhist temple in Kyoto, Japan.[2] It is one of the most popular buildings in Kyoto, attracting many visitors annually.[3] It is designated as a National Special Historic Site, a National Special Landscape and is one of 17 locations making up the Historic Monuments of Ancient Kyoto which are World Heritage Sites.',
    softWrap: true,
    style: TextStyle(fontSize: 16.0),
  ),
);

Widget _divider({
  required EdgeInsetsGeometry padding,
  required Color color,
}) =>
    Padding(
      padding: padding,
      child: Divider(
        color: color,
      ),
    );

Widget descriptionText = const Padding(
  padding: EdgeInsets.fromLTRB(18.0, 10.0, 0, 10.0),
  child: Text(
    'Description:',
    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
  ),
);

class LayoutExample1 extends StatelessWidget {
  const LayoutExample1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tour of Japan',
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromRGBO(83, 123, 13, 1),
            title: const Text('Tour of Japan'),
          ),
          body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Image.asset(
                fit: BoxFit.cover, height: 240, 'assets/kinkakuji.jpeg'),
            titleSection,
            _divider(
                padding: const EdgeInsets.only(bottom: 12.0),
                color: Colors.black),
            buttonSection,
            _divider(
                padding: const EdgeInsets.only(top: 12.0), color: Colors.black),
            descriptionText,
            Expanded(child: SingleChildScrollView(child: textSection))
          ]),
        ),
      ),
    );
  }
}
