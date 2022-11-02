import 'package:flutter/material.dart';

import 'button_section.dart';
import 'divider.dart';
import 'layout.dart';
import 'text_and_description_section.dart';
import 'title_section.dart';

class LocationApp extends StatelessWidget {
  const LocationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tour of Japan',
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColor.main,
            title: const Text('Tour of Japan'),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                  fit: BoxFit.cover, height: 240, 'assets/kinkakuji.jpeg'),
              titleSection,
              divider(),
              buttonSection,
              divider(),
              descriptionText,
              Expanded(
                child: SingleChildScrollView(child: textSection),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
