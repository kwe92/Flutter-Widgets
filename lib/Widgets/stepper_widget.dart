import 'package:flutter/material.dart';

class WorkingWIthStepperWidget extends StatefulWidget {
  const WorkingWIthStepperWidget({super.key});

  @override
  State<WorkingWIthStepperWidget> createState() =>
      _WorkingWIthStepperWidgetState();
}

class _WorkingWIthStepperWidgetState extends State<WorkingWIthStepperWidget> {
  int _currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Working With Stepper Widget'),
      ),
      body: Center(
        // Stepper Widget
        //    - Will allow you to create a step by step flow
        child: Stepper(
          steps: const [
            Step(
              title: Text('Step 1'),
              content: Text('Information for step 1'),
            ),
            Step(
              title: Text('Step 2'),
              content: Text('Information for step 2'),
            ),
            Step(
              title: Text('Step 3'),
              content: Text('Information for step 3'),
            ),
          ],
          onStepTapped: (int newIndex) {
            setState(() {
              debugPrint('current step: $_currentStep');
              _currentStep = newIndex;
              debugPrint('current step inital: $_currentStep');
            });
          },
          currentStep: _currentStep,
          onStepContinue: () {
            if (_currentStep != 2) {
              setState(() {
                _currentStep += 1;
                debugPrint('current step +1: $_currentStep');
              });
            }
          },
          onStepCancel: () {
            if (_currentStep != 0) {
              setState(() {
                _currentStep -= 1;
                debugPrint('current step -1: $_currentStep');
              });
            }
          },
        ),
      ),
    ));
  }
}
