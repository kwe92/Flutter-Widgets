// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';

class CustomDropDownMenu extends StatefulWidget {
  const CustomDropDownMenu({super.key});

  @override
  State<StatefulWidget> createState() => _CustomDropDownMenuState();
}

class _CustomDropDownMenuState extends State<CustomDropDownMenu> {
  @override
  void initState() {
    _controller.text = 'Net 1 Day';
    super.initState();
  }

  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) => SafeArea(
          child: Scaffold(
        appBar: AppBar(title: const Text('Custom Dropdown Menu')),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DropdownMenu(
                  label: const Text('Payment Terms'),
                  width: 300,
                  controller: _controller,
                  inputDecorationTheme: InputDecorationTheme(
                    enabledBorder: _border(),
                    focusedBorder: _border(),
                  ),
                  dropdownMenuEntries: <String>[
                    'Net 1` Day',
                    'Net 7 Days',
                    'Net 14 Days',
                    'Net 30 Days'
                  ].map((String value) {
                    return DropdownMenuEntry<String>(
                      label: value,
                      value: value,
                    );
                  }).toList())
            ]),
      ));
}

OutlineInputBorder _border() => const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.orange),
    );
