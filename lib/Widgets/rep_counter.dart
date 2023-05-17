import 'package:flutter/material.dart';

class RepCounter extends StatelessWidget {
  final int value;
  final int totalValue;
  final double fontSize;
  final bool isTimerBased;

  const RepCounter({
    required this.value,
    required this.totalValue,
    required this.fontSize,
    required this.isTimerBased,
    super.key,
  });

  @override
  Widget build(BuildContext context) => !isTimerBased
      ? _VerticalView(
          value: value,
          totalValue: totalValue,
          fontSize: fontSize,
        )
      : _HorizontalView(
          value: value,
          totalValue: totalValue,
          fontSize: fontSize,
        );
}

class _HorizontalView extends StatelessWidget {
  final int value;
  final int totalValue;
  final double fontSize;
  const _HorizontalView({
    required this.value,
    required this.totalValue,
    required this.fontSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle textstyle = _CustomTextStyle(
      size: fontSize,
    );
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          value.toString(),
          style: textstyle,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          '/',
          style: textstyle,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          totalValue.toString(),
          style: textstyle,
        ),
      ],
    );
  }
}

class _VerticalView extends StatelessWidget {
  final int value;
  final int totalValue;
  final double fontSize;
  const _VerticalView({
    required this.value,
    required this.totalValue,
    required this.fontSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            value.toString(),
            style: _CustomTextStyle(
              size: fontSize,
            ),
          ),
          const Divider(
            height: 0,
            color: Colors.white,
            thickness: 5,
            indent: 156.5,
            endIndent: 156.5,
          ),
          Text(
            totalValue.toString(),
            style: _CustomTextStyle(
              size: fontSize,
            ),
          ),
        ],
      );
}

class _CustomTextStyle extends TextStyle {
  final double size;
  const _CustomTextStyle({required this.size});

  @override
  FontWeight get fontWeight => FontWeight.w700;

  @override
  Color get color => Colors.white;

  @override
  double get fontSize => size;

  @override
  List<Shadow> get shadows => <Shadow>[
        const Shadow(
          offset: Offset(0, 4.0),
          blurRadius: 4.0,
          color: Color.fromRGBO(0, 0, 0, 0.25),
        ),
      ];
}
