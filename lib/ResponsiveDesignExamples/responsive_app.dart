import 'package:flutter/material.dart';
import 'Responsive/responsive_home_page.dart';
import 'MediaQuery/home_page.dart';

//TODO: Add Comments
// HomePage() | Media Query Practice
class ResponsiveApp extends StatelessWidget {
  const ResponsiveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      debugShowCheckedModeBanner: false,
      home: const ResponsiveHomePage(),
    );
  }
}
