import 'package:flutter/material.dart';
import '../Responsive/responsie_home_page.dart';
import 'home_page.dart';

// HomePage() | Media Query Practice
class ResponsiveApp extends StatelessWidget {
  const ResponsiveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ResponsiveHomePage(),
    );
  }
}
