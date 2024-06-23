import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widgets/ui_examples/travel_app/features/home/destination_selection_view.dart';

class NavigationView extends StatelessWidget {
  const NavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: const DestinationSelectionView(),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset("/Users/kwe/flutter-projects/FlutterWidgets/flutter_widgets/assets/home_icon.svg"),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("/Users/kwe/flutter-projects/FlutterWidgets/flutter_widgets/assets/clock_menu_icon.svg"),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("/Users/kwe/flutter-projects/FlutterWidgets/flutter_widgets/assets/heart_menu_icon.svg"),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("/Users/kwe/flutter-projects/FlutterWidgets/flutter_widgets/assets/user_icon.svg"),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
