import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widgets/Widgets/neumorphism/random_neumorphic_widgets/providers.dart';

class MyButton extends ConsumerWidget {
  const MyButton(
      {required this.color,
      required this.textColor,
      required this.buttonText,
      required this.buttontapped,
      required this.fontSize,
      Key? key})
      : super(key: key);

  final Color? color;
  final Color? textColor;
  final String buttonText;
  final double fontSize;
  final void Function()? buttontapped;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isPressed = ref.watch(isPressedProvider.state).state;
    //final Color backgroundColor = Colors.grey[100]!;
    final Offset distance =
        isPressed ? const Offset(6, 6) : const Offset(12, 12);
    final double blur = isPressed ? 5 : 15.0;

    return GestureDetector(
      onTap: buttontapped,
      child: AnimatedContainer(
        duration: const Duration(microseconds: 50),
        height: 200,
        width: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: color,
            boxShadow: <BoxShadow>[
              // right shadow
              BoxShadow(
                  blurRadius: blur,
                  offset: distance,
                  color: Colors.grey[500]!,
                  inset: isPressed),
              // left shadow
              BoxShadow(
                  blurRadius: blur,
                  offset: -distance,
                  color: Colors.white,
                  inset: isPressed)
            ]),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: textColor),
          ),
        ),
      ),
    );
  }
}

class NeumorphicPractice3 extends ConsumerStatefulWidget {
  const NeumorphicPractice3({super.key});

  @override
  ConsumerState<NeumorphicPractice3> createState() =>
      _NeumorphicPractice3State();
}

class _NeumorphicPractice3State extends ConsumerState<NeumorphicPractice3> {
  //bool isPressed = false;
  void pressButton() async {
    ref.read(isPressedProvider.state).state = true;
    await Future.delayed(const Duration(milliseconds: 50));
    ref.read(isPressedProvider.state).state = false;
  }

  @override
  Widget build(BuildContext context) {
    //bool isPressed = ref.watch(isPressedProvider.state).state;
    final Color backgroundColor = Colors.grey[100]!;
    return SafeArea(
      child: Scaffold(
          backgroundColor: backgroundColor,
          body: Center(
            child: MyButton(
                color: backgroundColor,
                textColor: Colors.black,
                buttonText: '42',
                buttontapped: pressButton,
                fontSize: 26),
          )),
    );
  }
}
