import "package:flutter/material.dart";

// Create a Class that implements MaterialStateProperty<T> and @override the resolver function

class ButtonTextStyle implements MaterialStateProperty<TextStyle> {
  final BuildContext context;

  const ButtonTextStyle({required this.context});

  @override
  TextStyle resolve(Set<MaterialState> states) => TextStyle(
        foreground: Paint()..color = states.contains(MaterialState.pressed) ? Colors.purple : Colors.blue,
      );
}

class WorkingWithMaterialState2 extends StatelessWidget {
  const WorkingWithMaterialState2({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Material State Example"),
          ),
          body: Center(
            child: OutlinedButton(
              style: ButtonStyle(
                textStyle: ButtonTextStyle(context: context),
              ),
              onPressed: () {},
              child: const Text("state Button"),
            ),
          ),
        ),
      );
}
