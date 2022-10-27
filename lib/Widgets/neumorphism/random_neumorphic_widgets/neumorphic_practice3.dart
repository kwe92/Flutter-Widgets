import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widgets/Widgets/neumorphism/random_neumorphic_widgets/providers.dart';

// A neumorphic button that updates UI after the button is pressed and not before

class MyButton extends StatefulWidget {
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
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    //final Color backgroundColor = Colors.grey[100]!;
    final Offset distance = isPressed ? const Offset(5, 5) : const Offset(8, 8);
    final double blur = isPressed ? 5 : 15.0;

    return GestureDetector(
      onTap: () async {
        await () async {
          setState(() {
            isPressed = !isPressed;
          });
          await Future.delayed(const Duration(milliseconds: 50));
          setState(() {
            isPressed = !isPressed;
          });
        }();

        // Callback is called after button tap
        widget.buttontapped!();
      },
      child: AnimatedContainer(
        duration: const Duration(microseconds: 50),
        height: 200,
        width: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: widget.color,
            boxShadow: <BoxShadow>[
              // right shadow
              BoxShadow(
                  blurRadius: blur,
                  offset: distance,
                  color: Colors.grey[300]!,
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
            widget.buttonText,
            style: TextStyle(
                fontSize: widget.fontSize,
                fontWeight: FontWeight.bold,
                color: widget.textColor),
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
  int num = 5;
  void pressButton() {
    setState(() {
      num = -num;
    });
  }

  @override
  Widget build(BuildContext context) {
    //bool isPressed = ref.watch(isPressedProvider.state).state;
    final Color backgroundColor = Colors.grey[100]!;

    return SafeArea(
      child: Scaffold(
          backgroundColor: backgroundColor,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  num.toString(),
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                MyButton(
                    color: backgroundColor,
                    textColor: Colors.black,
                    buttonText: '- / +',
                    buttontapped: pressButton,
                    fontSize: 26),
              ],
            ),
          )),
    );
  }
}

// Note: Button With a provider for global state management 

// class MyButton extends ConsumerWidget {
//   const MyButton(
//       {required this.color,
//       required this.textColor,
//       required this.buttonText,
//       required this.buttontapped,
//       required this.fontSize,
//       Key? key})
//       : super(key: key);

//   final Color? color;
//   final Color? textColor;
//   final String buttonText;
//   final double fontSize;
//   final void Function()? buttontapped;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     bool isPressed = false;
//     //ref.watch(isPressedProvider.state).state;
//     //final Color backgroundColor = Colors.grey[100]!;
//     final Offset distance =
//         isPressed ? const Offset(6, 6) : const Offset(12, 12);
//     final double blur = isPressed ? 5 : 15.0;

//     return GestureDetector(
//       onTap: () {
//         buttontapped!();
//         isPressed = !isPressed;
//       },
//       child: AnimatedContainer(
//         duration: const Duration(microseconds: 50),
//         height: 200,
//         width: 200,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(30),
//             color: color,
//             boxShadow: <BoxShadow>[
//               // right shadow
//               BoxShadow(
//                   blurRadius: blur,
//                   offset: distance,
//                   color: Colors.grey[500]!,
//                   inset: isPressed),
//               // left shadow
//               BoxShadow(
//                   blurRadius: blur,
//                   offset: -distance,
//                   color: Colors.white,
//                   inset: isPressed)
//             ]),
//         child: Center(
//           child: Text(
//             buttonText,
//             style: TextStyle(
//                 fontSize: fontSize,
//                 fontWeight: FontWeight.bold,
//                 color: textColor),
//           ),
//         ),
//       ),
//     );
//   }
// }
