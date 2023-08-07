import 'package:flutter/material.dart';

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
      ),
    );
  }
}

class _SetsRepsComponent extends StatelessWidget {
  final String sets;
  final String reps;
  final String? holdTime;

  const _SetsRepsComponent({
    required this.sets,
    required this.reps,
    this.holdTime,
    super.key,
  });

  final Color shadowColor = const Color.fromRGBO(0, 0, 0, 0.25);

  @override
  Widget build(BuildContext conetxt) {
    // TODO: replace with Gap
    const SizedBox gapw5 = SizedBox(width: 5);
    const double width = 337;
    return Center(
      child: Container(
        width: width,
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
        child: Padding(
          // TODO: Check padding still seems off
          padding: const EdgeInsets.only(
            left: 2,
            top: 9,
            right: 10,
            bottom: 9,
          ),
          child: Stack(
            children: <Widget>[
              Row(
                children: <Widget>[
                  _NewSingleSummary(label: 'sets', value: sets),
                  gapw5,
                  _NewSingleSummary(label: 'reps', value: reps),
                  gapw5,
                  _NewSingleSummary(label: 'hold time', value: '$holdTime sec'),
                  gapw5,
                ],
              ),
              const Positioned(
                // TODO: Check proper distance
                left: width - 32.5,
                child: _InformationIcon(),
              )
            ],
          ),
        ),
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
    return
        // ! remove ColoredBox Widget with final push
        ColoredBox(
      color: const Color.fromRGBO(156, 39, 176, 0),
      child: SizedBox(
        width: 93.67,
        height: 58,
        child: Column(
          children: <Widget>[
            Text(
              label.toUpperCase(),
              // TODO: Move to TextStyle module ? | Check if can reuse existing TextStyles | Check for color 979797

              style: const TextStyle(
                color: Color(0xFF979797),
                fontSize: 13,
                fontWeight: FontWeight.w800,
              ),
            ),
            // TODO: replace with Gap ?
            const SizedBox(
              height: 7,
            ),
            Text(
              value,
              // TODO: Move to TextStyle module ? | Check if can reuse existing TextStyles | Check for color 15C859

              style: const TextStyle(
                color: Color(0xFF15C859),
                fontSize: 24,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InformationIcon extends StatelessWidget {
  const _InformationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    const double sides = 17;
    return Container(
      width: sides,
      height: sides,
      decoration: BoxDecoration(
// TODO: check for color 208CFF
        color: const Color(0xFF208CFF),
        borderRadius: BorderRadius.circular(
          sides / 2,
        ),
      ),
      child: const Center(
        child: Text(
          'i',
          style: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 12,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
