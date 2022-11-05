import 'package:flutter/material.dart';
import 'package:flutter_widgets/ResponsiveDesignExamples/Responsive/dimensions.dart';

//TODO: More Comments
class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout(
      {required this.mobileBody, required this.desktopBody, super.key});
  final Widget mobileBody;
  final Widget desktopBody;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < BreakPoint.mobileWidth) {
        return mobileBody;
      } else {
        return desktopBody;
      }
    });
  }
}
