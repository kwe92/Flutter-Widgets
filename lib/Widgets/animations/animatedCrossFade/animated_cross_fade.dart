import 'package:flutter/material.dart';

class AnimatedCrossFadeExample extends StatefulWidget {
  const AnimatedCrossFadeExample({super.key});
  final title = 'Animated Cross Fade';

  @override
  State<AnimatedCrossFadeExample> createState() => _AnimatedCrossFadeAppState();
}

class _AnimatedCrossFadeAppState extends State<AnimatedCrossFadeExample> {
  bool _isFirst = true;

  void _notifyWidget() => setState(() {});

  void _setIsFirst(bool isFirst) {
    _isFirst = isFirst;

    _notifyWidget();
  }

  @override
  Widget build(BuildContext context) {
    const showFirstWidget = CrossFadeState.showFirst;

    const showSecondWidget = CrossFadeState.showSecond;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(37, 37, 37, 1),
        appBar: AppBar(
          elevation: 3,
          backgroundColor: const Color.fromRGBO(44, 44, 44, 1),
          surfaceTintColor: const Color.fromRGBO(44, 44, 44, 1),
          shadowColor: Colors.white.withOpacity(0.25),
          title: Text(
            widget.title,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => _setIsFirst(!_isFirst),
              child: const Text(
                'Switch',
                style: TextStyle(
                  color: Color(0xff00b0ff),
                ),
              ),
            ),
          ],
        ),
        body: AnimatedCrossFade(
          firstChild: _customColumn('Isekai', 'assets/isekai.jpeg'),
          secondChild: _customColumn('Seinen', 'assets/seinen.webp'),
          duration: const Duration(seconds: 1, milliseconds: 500),
          crossFadeState: _isFirst ? showFirstWidget : showSecondWidget,
        ),
      ),
    );
  }

  Widget _customColumn(String text, String image) => Column(
        children: [
          const SizedBox(height: 24.0),
          Text(
            text,
            style: const TextStyle(
              fontSize: 50.0,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12.0),
          Image.asset(image),
        ],
      );
}

// Animated Cross Fade

//   - switch between two widgets predicated on some condition
//   - when the widgets are switched between an animation is shown
