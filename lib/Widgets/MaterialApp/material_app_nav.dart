import 'package:flutter/material.dart';

class CustomMaterialAppNav extends StatelessWidget {
  const CustomMaterialAppNav({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:
          ThemeData(brightness: Brightness.dark, primaryColor: Colors.orange),
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Home'),
            ),
            body: Center(
                child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/about');
              },
              child: Container(
                height: 100,
                width: 400,
                margin: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                color: Colors.blueGrey,
                child: const Center(
                    child: FittedBox(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                    child: Text(
                      'Container turned Button, routing to the About Screen',
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                  ),
                )),
              ),
            )),
          );
        },
        '/about': (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('About Screen'),
            ),
          );
        }
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
