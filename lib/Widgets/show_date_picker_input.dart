// showDatePicker
//    - a dialog date picker function
//    - Will allow you to select a date in any given range

import 'package:flutter/material.dart';

class WorkingWithDatePickerInput extends StatefulWidget {
  const WorkingWithDatePickerInput({super.key});

  @override
  State<WorkingWithDatePickerInput> createState() =>
      _WorkingWithDatePickerInputState();
}

class _WorkingWithDatePickerInputState
    extends State<WorkingWithDatePickerInput> {
  TextEditingController dateController = TextEditingController();

  @override
  void initState() {
    DateTime dateTime = _initDateTime();

    dateController.text =
        '${dateTime.day.toString()}-${dateTime.month.toString()}-${dateTime.year.toString()}';
    super.initState();
  }

  DateTime _initDateTime() => DateTime(2023);

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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: CustomTextFormField(
                    title: 'Date',
                    controller: dateController,
                    onTap: () async {
                      DateTime? newDate = await showDatePicker(
                        context: context,
                        initialDate: _initDateTime(),
                        firstDate: DateTime(2023),
                        lastDate: DateTime(3000),
                      );
                      if (newDate != null) {
                        setState(() {
                          dateController.text = newDate.toString();
                        });
                      }
                    }),
              ),
              const SizedBox(
                height: 8.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

typedef VoidCallback = Function();

class CustomTextFormField extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final VoidCallback onTap;

  const CustomTextFormField(
      {required this.title,
      required this.controller,
      required this.onTap,
      super.key});

  @override
  Widget build(BuildContext context) {
    const purple = Colors.purple;
    const grey = Colors.grey;
    return TextFormField(
      onTap: onTap,
      controller: controller,
      decoration: InputDecoration(
        focusColor: purple,
        suffixIcon: GestureDetector(
          onTap: () => controller.clear(),
          child: const Icon(
            Icons.close,
          ),
        ),
        label: Text(
          title,
          style: const TextStyle(color: grey),
        ),
        // labelText: 'Street Address',
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[300] as Color),
            borderRadius: BorderRadius.circular(6)),
        focusedBorder:
            const OutlineInputBorder(borderSide: BorderSide(color: purple)),
      ),
    );
  }
}

// Text(
              //   '${dateTime!.day.toString()}-${dateTime!.month.toString()}-${dateTime!.year.toString()}',
              //   style: const TextStyle(fontSize: 45.0),
              // ),

    //  ElevatedButton(
    //             onPressed: () async {
    //               DateTime? newDate = await showDatePicker(
    //                 context: context,
    //                 initialDate: dateTime!,
    //                 firstDate: DateTime(2023),
    //                 lastDate: DateTime(3000),
    //               );
    //               if (newDate != null) {
    //                 setState(() {
    //                   dateTime = newDate;
    //                 });
    //               }
    //             },
    //             child: const Text('Get Date'),
    //           )
