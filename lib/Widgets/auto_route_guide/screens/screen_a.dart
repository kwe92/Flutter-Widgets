import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/auto_route_guide/routes/app_router.gr.dart';

@RoutePage()
class ScreenA extends StatelessWidget {
  const ScreenA({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          backgroundColor: Colors.purple,
          appBar: AppBar(
            title: const Text('Screen A'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: ElevatedButton(
                  onPressed: () => _handlePushScreenB(context),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 24.0),
                    child: Text('Push to Screen B'),
                  ),
                ),
              )
            ],
          ),
        ),
      );
}

void _handlePushScreenB(BuildContext context) => AutoRouter.of(context).push(
      const RouteB(),
    );
