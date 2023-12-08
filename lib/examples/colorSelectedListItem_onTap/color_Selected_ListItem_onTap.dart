import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// TODO: review

// Select and highlighting one item in a list of items

class SelectListItemOnTapViewModel extends ChangeNotifier {
  int? selectedIndex;

  void setIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}

class SelectListItemOnTap extends StatelessWidget {
  const SelectListItemOnTap({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Consumer<SelectListItemOnTapViewModel>(
              builder: (context, model, _) {
                return ListTile(
                  title: Text('Item: $index'),
                  tileColor: model.selectedIndex == index ? Colors.blue : null,
                  onTap: () {
                    model.setIndex(index);
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
