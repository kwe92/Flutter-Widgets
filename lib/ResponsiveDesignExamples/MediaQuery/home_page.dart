import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // Size of the current window
    final Size currentMediaSize = MediaQuery.of(context).size;
    // Horizontal extent of the current window
    final double currentWidth = currentMediaSize.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor:
            currentWidth < 600 ? Colors.deepPurple[300] : Colors.green[300],
        body: Center(
          child: Text(
            currentWidth.toString(),
          ),
        ),
      ),
    );
  }
}
