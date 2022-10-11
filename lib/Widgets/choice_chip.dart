// ChoiceChip
//    - Can be used to select and unselect items

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class WorkingWithChoiceChip extends StatefulWidget {
  const WorkingWithChoiceChip({super.key});

  @override
  State<WorkingWithChoiceChip> createState() => _WorkingWithChoiceChipState();
}

class _WorkingWithChoiceChipState extends State<WorkingWithChoiceChip> {
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Working With ChoiceChip'),
        ),
        body: Center(
          child: ChoiceChip(
            backgroundColor: Colors.green,
            selectedColor: Colors.blueAccent,
            label: const Text(
              'Select a Choice',
              style: TextStyle(color: Colors.white),
            ),
            selected: _isSelected,
            onSelected: (newBoolValue) {
              setState(() {
                _isSelected = newBoolValue;
              });
            },
          ),
        ),
      ),
    );
  }
}
