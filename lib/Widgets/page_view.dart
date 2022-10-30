// PageView
//  - A very simple way to add pages inside of an app
//  - A scrollable list that works page by page

// Clean Code
//  - Keep code clean and orthagonal
//  - DRY code
//  - Decoupled code
//  - Create functions and classes with the Law of Demeter in mind at all times

import 'package:flutter/material.dart';

// A stateless widget to display our app
class PageViewApp extends StatelessWidget {
  const PageViewApp({super.key});

  static const String _title = 'Page Controller Code Example';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      title: _title,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(title: const Text(_title)),
          body: const WorkingWithPageView(),
        ),
      ),
    );
  }
}

// Custom Image Widget keep it DRY
Widget customImage(String image) => Expanded(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: ClipOval(
          child: Image.asset(
            image,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );

// Custom Column Widget keep it DRY
Column customColumn(String image, String text, TextStyle style) => Column(
      children: [
        customText(text, style),
        customImage(image),
      ],
    );

// Custom Text Widget keep it DRY
Widget customText(String text, TextStyle style) => Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 12.0, 0, 12.0),
        child: Text(text, style: style),
      ),
    );

class WorkingWithPageView extends StatelessWidget {
  const WorkingWithPageView({super.key});
  static const _style = TextStyle(fontSize: 42, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();

    return PageView(
      controller: controller,
      children: <Widget>[
        customColumn('assets/isekai.jpeg', 'Isekai', _style),
        customColumn('assets/seinen.webp', 'Seinen', _style),
        customColumn('assets/sololvl.jpeg', 'Korean Manga', _style),
      ],
    );
  }
}
