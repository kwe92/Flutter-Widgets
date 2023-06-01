// showTimePicker
//    - Presents a dialog (pop up box) containing a material design time picker
//    - Pick a time value within the app
//    - Dialog boxes should be awaited

import 'package:flutter/material.dart';

class WorkingWithTimePicker extends StatefulWidget {
  const WorkingWithTimePicker({super.key});

  @override
  State<WorkingWithTimePicker> createState() => _WorkingWithTimePickerState();
}

class _WorkingWithTimePickerState extends State<WorkingWithTimePicker> {
  TimeOfDay? time = const TimeOfDay(hour: 11, minute: 11);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Working with showTimePicker'),
        ),
        body: Center(
          child: Text(
            '${time!.hour.toString()}:${time!.minute.toString()}',
            style: const TextStyle(fontSize: 60),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            TimeOfDay? newTime = await showTimePicker(
              context: context,
              initialTime: time!,
            );
            if (newTime != null) {
              setState(() {
                time = newTime;
              });
            }
          },
          child: const Icon(
            Icons.access_time_outlined,
          ),
        ),
      ),
    );
  }
}
