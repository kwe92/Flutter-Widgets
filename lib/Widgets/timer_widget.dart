// import 'package:flutter/material.dart';

// class TimerWidget extends StatelessWidget {
//   const TimerWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Timer Widget'),
//         ),
//         body: const Center(
//           child: TransparentContainer(),
//         ),
//       ),
//     );
//   }
// }

// class TransparentContainer extends StatelessWidget {
//   const TransparentContainer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     const double sideLength = 305;
//     return Container(
//       height: sideLength,
//       width: sideLength,
//       decoration: BoxDecoration(
//         color: const Color(0xFF0E3311).withOpacity(0.0),
//         border: Border.all(color: Colors.purple),
//         borderRadius: const BorderRadius.all(
//           Radius.circular(sideLength / 2),
//         ),
//       ),
//       child: const CountDownTimer(),
//     );
//   }
// }
