import 'package:flutter/material.dart';
import 'package:flutter_widgets/ResponsiveDesignExamples/Responsive/desktop_body.dart';
import 'package:flutter_widgets/ResponsiveDesignExamples/Responsive/mobile_body.dart';

import 'responsive_layout.dart';

//TODO: Add Comments
class ResponsiveHomePage extends StatefulWidget {
  const ResponsiveHomePage({super.key});

  @override
  State<ResponsiveHomePage> createState() => _ResponsiveHomePageState();
}

class _ResponsiveHomePageState extends State<ResponsiveHomePage> {
  @override
  Widget build(BuildContext contxt) {
    //return SafeArea(child: Scaffold());
    return const ResponsiveLayout(
      mobileBody: MyMobileBody(),
      desktopBody: MyDesktopBody(),
    );
  }
}
