import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/rep_counter.dart';

import 'base_scaffold.dart';

class SetsRepsWidget extends StatelessWidget {
  const SetsRepsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScaffold(
        title: 'Sets && Reps Widget',
        child: _SetsRepsComponent(
          sets: '1',
          reps: '5',
          holdTime: '3',
        ));
  }
}

class _SetsRepsComponent extends StatelessWidget {
  final String sets;
  final String reps;
  final String? holdTime;

  const _SetsRepsComponent({required this.sets, required this.reps, this.holdTime, super.key});

  final Color shadowColor = const Color.fromRGBO(0, 0, 0, 0.25);

  @override
  Widget build(BuildContext conetxt) {
    return Center(
      child: Container(
        width: 337,
        height: 70,
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(15),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: shadowColor,
              offset: const Offset(0, 2),
              blurRadius: 3,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Row(children: <Widget>[
          _NewSingleSummary(label: 'sets', value: sets),
          _NewSingleSummary(label: 'reps', value: reps),
          _NewSingleSummary(label: 'hold time', value: holdTime as String),
        ]),
      ),
    );
  }
}

class _NewSingleSummary extends StatelessWidget {
  final String label;
  final String value;

  const _NewSingleSummary({
    required this.label,
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 93.67,
      height: 58,
      child: Column(children: <Widget>[
        Text(label),
        // TODO: replace with gap
        const SizedBox(
          height: 7,
        ),
        Text(value),
      ]),
    );
  }
}
