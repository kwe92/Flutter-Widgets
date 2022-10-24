import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CustomNeumorphicButton extends StatelessWidget {
  const CustomNeumorphicButton(
      {required this.onPressed,
      required this.child,
      this.color = const Color.fromRGBO(109, 130, 3, 1),
      super.key});
  final VoidCallback onPressed;
  final Widget child;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: 150,
        maxWidth: 150,
        minHeight: 50,
        maxHeight: 50,
      ),
      child: NeumorphicButton(
          margin: const EdgeInsets.only(top: 12),
          onPressed: onPressed,
          style: NeumorphicStyle(
            color: color,
            shape: NeumorphicShape.flat,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(4)),
          ),
          padding: const EdgeInsets.all(12.0),
          child: Center(child: child)),
    );
  }
}



//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 50,
//       width: 150,
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(backgroundColor: color),
//         onPressed: onPressed,
//         child: child,
//       ),
//     );
//   }
// }