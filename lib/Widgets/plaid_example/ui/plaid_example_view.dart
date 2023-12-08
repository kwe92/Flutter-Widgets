import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/base_scaffold.dart';

class PlaidExampleView extends StatelessWidget {
  const PlaidExampleView({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScaffold(
      title: "Working With Plaid",
      child: Center(
        child: Text("Plaid API"),
      ),
    );
  }
}
