import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'presentation/decrement_button.dart';
import 'presentation/eleveated_button.dart';
import 'presentation/providers/count_provider.dart';

//TODO: Wrap the BottomNavigationBar Widget with a Theme

Widget counterDisplay({count}) => Text(
      'Count: $count',
      style: const TextStyle(fontSize: 22.0),
    );

Widget counterIncrementor({required onPressed}) => CustomElevatedButton(
      onPressed: onPressed,
      child: const Text('Increment'),
    );

class CounterApp extends ConsumerStatefulWidget {
  const CounterApp({super.key});

  @override
  ConsumerState<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends ConsumerState<CounterApp> {
  @override
  Widget build(BuildContext context) {
    final count = ref.watch(countProvider);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(109, 130, 3, 1),
          leading: const Icon(Icons.menu),
          actions: const <Widget>[Icon(Icons.search)],
          title: const FittedBox(
              child: Text('Separation,Encapsulation, Consumer, Provider!')),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              counterDisplay(count: count),
              const SizedBox(
                height: 5.0,
              ),
              counterIncrementor(
                onPressed: () => ref.read(countProvider.state).state++,
              ),
              const SizedBox(
                height: 5.0,
              ),
              CounterDecrementor(
                onPressed: () => ref.read(countProvider.state).state--,
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
