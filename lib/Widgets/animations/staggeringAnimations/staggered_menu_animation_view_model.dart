import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class StaggeredMenuAnimationExampleViewModel extends TickerProvider with ChangeNotifier {
  bool _isToggled = false;

  bool get isToggled => _isToggled;

  late AnimationController _drawerController;

  AnimationController get drawerController => _drawerController;

  StaggeredMenuAnimationExampleViewModel() {
    initialize();
  }

  void initialize() {
    _drawerController = AnimationController(vsync: this, duration: const Duration(seconds: 0, milliseconds: 100));
  }

  void setToggleDrawer() {
    isToggled ? _drawerController.reverse() : _drawerController.forward();
    _isToggled = !isToggled;
    notifyListeners();
  }

  bool isDrawerClosed() => _drawerController.value == 0;

  @override
  Ticker createTicker(TickerCallback onTick) => Ticker(onTick);

  @override
  void dispose() {
    _drawerController.dispose();
    super.dispose();
  }
}
