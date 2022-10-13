// import 'package:flutter/material.dart';

// // Immutable Widget to display count
// class CounterDisplay extends StatelessWidget {
//   const CounterDisplay({super.key, required this.count});
//   final int count;
//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       'Count: $count',
//       style: const TextStyle(fontSize: 16.0),
//     );
//   }
// }

// class CustomButton extends StatelessWidget {
//   const CustomButton(
//       {required this.onPressed,
//       required this.child,
//       this.color = Colors.blueAccent,
//       super.key});
//   final VoidCallback onPressed;
//   final Widget child;
//   final Color color;
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 150,
//       height: 50,
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(backgroundColor: color),
//         onPressed: onPressed,
//         child: child,
//       ),
//     );
//   }
// }

// class CounterIncrementor extends StatelessWidget {
//   const CounterIncrementor({required this.onPressed, super.key});
//   final VoidCallback onPressed;

//   @override
//   Widget build(BuildContext context) {
//     return CustomButton(
//       onPressed: onPressed,
//       child: const Text('Increment'),
//     );
//   }
// }

// class CounterDecrementor extends StatelessWidget {
//   const CounterDecrementor(
//       {required this.onPressed, required this.count, super.key});
//   final VoidCallback onPressed;
//   final int count;

//   void _decrementCheck() {
//     if (count > 0) {
//       return onPressed();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (count > 0) {
//       return CustomButton(
//           onPressed: _decrementCheck, child: const Text('Decrement'));
//     } else {
//       return CustomButton(
//         onPressed: _decrementCheck,
//         color: Colors.grey,
//         child: const Text('Decrement'),
//       );
//     }
//   }
// }

// class Counter extends StatefulWidget {
//   const Counter({super.key});

//   @override
//   State<Counter> createState() => _CounterState();
// }

// class _CounterState extends State<Counter> {
//   int _count = 0;
//   void _increment() {
//     setState(() {
//       _count++;
//     });
//   }

//   void _decrement() {
//     setState(() {
//       _count--;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Separation && Encapsulation!'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               CounterDisplay(count: _count),
//               const SizedBox(height: 8),
//               CounterIncrementor(onPressed: _increment),
//               const SizedBox(height: 8),
//               CounterDecrementor(
//                 onPressed: _decrement,
//                 count: _count,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
