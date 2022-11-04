import 'package:flutter/material.dart';

//TODO: After creating the inital Scaffolds and displaying them for Mobile & Desktop Pass the ResponsiveLayout widget to the Scaffold with the appropriate widget passed in

class ResponsiveHomePage extends StatefulWidget {
  const ResponsiveHomePage({super.key});

  @override
  State<ResponsiveHomePage> createState() => _ResponsiveHomePageState();
}

class _ResponsiveHomePageState extends State<ResponsiveHomePage> {
  @override
  Widget build(BuildContext contxt) {
    return SafeArea(child: Scaffold());
    // ResponsiveLayout(mobileBody: , desktopBody: );
  }
}
