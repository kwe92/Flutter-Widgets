import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({super.key, required this.body});
  final body;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Working With Riverpod'),
        ),
        body: body,
      ),
    );
  }
}
