import "package:flutter/material.dart";

class WorkingWithMaterialState extends StatelessWidget {
  const WorkingWithMaterialState({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Material State Example"),
          ),
          body: Center(
            child: OutlinedButton(
              style: ButtonStyle(
                textStyle: MaterialStateProperty.resolveWith(
                  (Set<MaterialState> state) => TextStyle(
                    foreground: Paint()..color = state.contains(MaterialState.pressed) ? Colors.purple : Colors.blue,
                  ),
                ),
              ),
              onPressed: () {},
              child: const Text("state Button"),
            ),
          ),
        ),
      );
}
