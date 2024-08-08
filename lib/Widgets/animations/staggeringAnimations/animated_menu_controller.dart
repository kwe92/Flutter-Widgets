import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class AnimatedMenuController extends TickerProvider with ChangeNotifier {
  final List<String> menuTitles = [
    'Declarative Style',
    'Premade Widgets',
    'Stateful Hot Reload',
    'Native Performance',
    'Great Community',
  ];

  // TODO: Review

  // Animation Controller
  late AnimationController _staggeredController;

  // Animation Delays
  final Duration initialDelayTime = const Duration(milliseconds: 50);

  final Duration itemSlideTime = const Duration(milliseconds: 250);

  final Duration staggerTime = const Duration(milliseconds: 50);

  final Duration buttonDelayTime = const Duration(milliseconds: 150);

  final Duration buttonTime = const Duration(milliseconds: 500);

  // Animation Intervals
  final List<Interval> _itemSlideIntervals = [];

  late Interval _buttonInterval;

  // derived member variables
  List<Interval> get itemSlideIntervals => _itemSlideIntervals;

  AnimationController get staggeredController => _staggeredController;

  Interval get buttonInterval => _buttonInterval;

  Duration get animationDuration => initialDelayTime + (staggerTime * menuTitles.length) + buttonDelayTime + buttonTime;

  AnimatedMenuController() {
    initialize();
  }

  void initialize() {
    _createAnimationIntervals();

    _staggeredController = AnimationController(
      vsync: this,
      duration: animationDuration,
    )..forward();
  }

  void _createAnimationIntervals() {
    _createAnimatedMenuTitleIntervals();
    _createButtonInterval();
  }

  // TODO: Review
  void _createAnimatedMenuTitleIntervals() {
    for (int i = 0; i < menuTitles.length; i++) {
      final Duration startTime = initialDelayTime + (staggerTime * i);

      final Duration endTime = startTime + itemSlideTime;

      final double intervalBegin = (startTime.inMilliseconds / animationDuration.inMilliseconds);

      final double intervalEnd = (endTime.inMilliseconds / animationDuration.inMilliseconds);

      _itemSlideIntervals.add(Interval(intervalBegin, intervalEnd));
    }
  }

  // TODO: Review
  void _createButtonInterval() {
    final Duration buttonStartTime =
        Duration(milliseconds: (menuTitles.length * staggerTime.inMilliseconds)) + buttonDelayTime + initialDelayTime;

    final Duration buttonEndTime = buttonStartTime + buttonDelayTime;

    final double intervalBegin = (buttonStartTime.inMilliseconds / animationDuration.inMilliseconds);

    final double intervalEnd = (buttonEndTime.inMilliseconds / animationDuration.inMilliseconds);

    _buttonInterval = Interval(intervalBegin, intervalEnd);
  }

  @override
  Ticker createTicker(TickerCallback onTick) => Ticker(onTick);

  @override
  void dispose() {
    _staggeredController.dispose();
    super.dispose();
  }
}



// TODO: Write comments and Summarize

// Interval