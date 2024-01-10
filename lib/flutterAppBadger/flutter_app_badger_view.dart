import 'package:flutter/material.dart';
import 'package:flutter_widgets/flutterAppBadger/flutter_app_badger_view_model.dart';
import 'package:stacked/stacked.dart';

class FlutterAppBadgerView extends StatelessWidget {
  const FlutterAppBadgerView({super.key});

  @override
  Widget build(BuildContext context) => ViewModelBuilder.reactive(
        viewModelBuilder: () => FlutterAppBadgerViewModel(),
        builder: (cotnext, model, _) => Scaffold(
          appBar: AppBar(
            title: const Text('Plugin example app'),
          ),
          body: SizedBox.expand(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('Badge supported: ${model.appBadgeSupported}\n'),
                Text('Badge count: ${model.count}\n'),
                ElevatedButton(
                  child: const Text('Add badge'),
                  onPressed: () => model.addBadge(),
                ),
                ElevatedButton(
                  child: const Text('Remove badge'),
                  onPressed: () => model.removeBadge(),
                ),
              ],
            ),
          ),
        ),
      );
}
