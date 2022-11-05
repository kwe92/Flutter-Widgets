import 'package:flutter/material.dart';

const _leading = Padding(
  padding: EdgeInsets.only(left: 8.0),
  child: Icon(Icons.menu),
);

final _actions = [
  Padding(
    padding: const EdgeInsets.only(right: 24.0),
    child: Row(
      children: const [
        Icon(Icons.search),
        SizedBox(
          width: 6,
        ),
        Text('Search')
      ],
    ),
  ),
];

class MyDesktopBody extends StatelessWidget {
  const MyDesktopBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      appBar: AppBar(
        leading: _leading,
        actions: _actions,
        title: const Text('D E S K T O P'),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              children: <Widget>[
                // Video playing
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Container(
                      color: Colors.deepPurple[400],
                    ),
                  ),
                ),
                // List of comments
                Expanded(
                  child: ListView.builder(
                    itemCount: 8,
                    itemBuilder: (BuildContext context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 115,
                          color: Colors.deepPurple[300],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          // Side panel list of video
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.deepPurple[300],
            ),
          ))
        ],
      ),
    );
  }
}
