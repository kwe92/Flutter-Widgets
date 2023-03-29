// showDatePicker
//    - a dialog date picker function
//    - Will allow you to select a date in any given range

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class WorkingWithDatePicker extends StatefulWidget {
  const WorkingWithDatePicker({super.key});

  @override
  State<WorkingWithDatePicker> createState() => _WorkingWithDatePickerState();
}

class _WorkingWithDatePickerState extends State<WorkingWithDatePicker> {
  DateTime? dateTime = DateTime(2023);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Working With showDatePicker'),
        ),
        body: Center(
          child: Column(
            // Centers the children??
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                '${dateTime!.day.toString()}-${dateTime!.month.toString()}-${dateTime!.year.toString()}',
                style: const TextStyle(fontSize: 45.0),
              ),
              const SizedBox(
                height: 8.0,
              ),
              ElevatedButton(
                onPressed: () async {
                  DateTime? newDate = await showDatePicker(
                    context: context,
                    initialDate: dateTime!,
                    firstDate: DateTime(2023),
                    lastDate: DateTime(3000),
                  );
                  if (newDate != null) {
                    setState(() {
                      dateTime = newDate;
                    });
                  }
                },
                child: const Text('Get Date'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
