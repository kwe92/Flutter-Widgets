import 'package:flutter/material.dart';

//TODO: Wrap the BottomNavigationBar Widget with a Theme

class CounterDisplay extends StatelessWidget {
  const CounterDisplay({required this.count, super.key});
  final int count;
  @override
  Widget build(BuildContext context) {
    return Text(
      'Count: $count',
      style: const TextStyle(fontSize: 22.0),
    );
  }
}

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {required this.onPressed,
      required this.child,
      this.color = const Color.fromRGBO(109, 130, 3, 1),
      super.key});
  final VoidCallback onPressed;
  final Widget child;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 150,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: color),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}

class CounterIncrementor extends StatelessWidget {
  const CounterIncrementor({required this.onPressed, super.key});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      onPressed: onPressed,
      child: const Text('Increment'),
    );
  }
}

class CounterDecrementor extends StatelessWidget {
  const CounterDecrementor(
      {required this.onPressed, required this.count, super.key});
  final VoidCallback onPressed;
  final int count;
  final Widget text = const Text('Decrement');

  @override
  Widget build(BuildContext context) {
    return count > 0
        ? CustomElevatedButton(onPressed: onPressed, child: text)
        : CustomElevatedButton(
            onPressed: () {}, color: Colors.grey, child: text);
  }
}

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int _count = 0;

  void _increment() {
    setState(() {
      _count++;
    });
  }

  void _decrement() {
    if (_count > 0) {
      setState(() {
        _count--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(109, 130, 3, 1),
          leading: const Icon(Icons.menu),
          actions: const <Widget>[Icon(Icons.search)],
          title: const FittedBox(
              child: Text('Separation && Encapsulation Review!')),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CounterDisplay(count: _count),
              const SizedBox(
                height: 5.0,
              ),
              CounterIncrementor(
                onPressed: _increment,
              ),
              const SizedBox(
                height: 5.0,
              ),
              CounterDecrementor(
                onPressed: _decrement,
                count: _count,
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            //fixedColor: Colors.red,
            currentIndex: 0,
            unselectedItemColor: Colors.orange[400],
            selectedItemColor: Colors.orange[400],
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.zoom_in), label: 'zoom_in'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.zoom_out), label: 'zoom_out'),
              BottomNavigationBarItem(icon: Icon(Icons.logout), label: 'logout')
            ]),
      ),
    );
  }
}

// bottomNavigationBar: new Theme(
//     data: Theme.of(context).copyWith(
//         // sets the background color of the `BottomNavigationBar`
//         canvasColor: Colors.green,
//         // sets the active color of the `BottomNavigationBar` if `Brightness` is light
//         primaryColor: Colors.red,
//         textTheme: Theme
//             .of(context)
//             .textTheme
//             .copyWith(caption: new TextStyle(color: Colors.yellow))), // sets the inactive color of the `BottomNavigationBar`
//     child: new BottomNavigationBar(
//       type: BottomNavigationBarType.fixed,
//       currentIndex: 0,
//       items: [
//         new BottomNavigationBarItem(
//           icon: new Icon(Icons.add),
//           title: new Text("Add"),
//         ),
//         new BottomNavigationBarItem(
//           icon: new Icon(Icons.delete),
//           title: new Text("Delete"),
//         )
//       ],
//     ),
//   ),
