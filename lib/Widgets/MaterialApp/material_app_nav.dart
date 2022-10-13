import 'package:flutter/material.dart';

class CustomMaterialAppNav extends StatelessWidget {
  const CustomMaterialAppNav({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(brightness: Brightness.dark, primaryColor: Colors.orange),
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) {
          return SafeArea(
            child: Scaffold(
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
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color.fromRGBO(59, 68, 131, 1)),
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
            ),
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
    );
  }
}
