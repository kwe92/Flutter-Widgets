import 'package:flutter/material.dart';

class CommonShaderMask extends StatelessWidget {
  final Widget child;
  final LinearGradient gradient;
  const CommonShaderMask({required this.child, required this.gradient, super.key});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
        blendMode: BlendMode.srcATop,
        shaderCallback: (Rect bounds) {
          return gradient.createShader(bounds);
        },
        child: child);
  }
}
