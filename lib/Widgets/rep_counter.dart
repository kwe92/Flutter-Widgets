import 'package:flutter/material.dart';

class RepCounter extends StatelessWidget {
  final int value;
  final int totalValue;
  final bool isTimerBased;

  const RepCounter({
    required this.value,
    required this.totalValue,
    required this.isTimerBased,
    super.key,
  });

  @override
  Widget build(BuildContext context) => !isTimerBased
      ? Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: 120,
              alignment: Alignment.center,
              transform: Transform.translate(
                offset: const Offset(0, 10.0),
              ).transform,
              child: Text(
                value.toString(),
                style: _textStyle.copyWith(fontSize: 100),
              ),
            ),
            Container(
              height: 5,
              width: 77,
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    offset: Offset(0, 4.0),
                    blurRadius: 4.0,
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                  )
                ],
              ),
            ),
            Container(
              width: 120,
              alignment: Alignment.center,
              transform: Transform.translate(
                offset: const Offset(0, -10),
              ).transform,
              child: Text(
                totalValue.toString(),
                style: _textStyle.copyWith(fontSize: 100),
              ),
            ),
          ],
        )
      : Text(
          '$value / $totalValue',
          style: _textStyle.copyWith(
            fontSize: 48,
            letterSpacing: -5,
          ),
        );
}

const TextStyle _textStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w700,
  fontFamily: 'Open Sans',
  shadows: <Shadow>[
    Shadow(
      offset: Offset(0, 4.0),
      blurRadius: 4.0,
      color: Color.fromRGBO(0, 0, 0, 0.25),
    ),
  ],
);
