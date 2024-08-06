import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/animations/dragUiElement/customer.dart';
import 'package:flutter_widgets/Widgets/animations/dragUiElement/item.dart';
import 'package:flutter_widgets/Widgets/animations/dragUiElement/items_service.dart';

class DragUiElementExampleViewModel with ChangeNotifier {
  List<Customer> _customers = [];

  List<Customer> get customers => _customers;

  List<Item> get items => itemsService.items;

  Future<void> initialize() async {
    await Future.delayed(const Duration(seconds: 1));

    _customers = [
      Customer(
          name: "Francis",
          imageProvider: Image.asset("/Users/kwe/flutter-projects/FlutterWidgets/flutter_widgets/assets/profile_img00.avif").image),
      Customer(
          name: "Beth", imageProvider: Image.asset("/Users/kwe/flutter-projects/FlutterWidgets/flutter_widgets/assets/oregon.jpeg").image),
      Customer(
          name: "Weeb", imageProvider: Image.asset("/Users/kwe/flutter-projects/FlutterWidgets/flutter_widgets/assets/sololvl.jpeg").image),
    ];

    await itemsService.getItems();
  }

  void itemDroppedOnCustomerCart(Item item, Customer customer) {
    customer.items.add(item);

    notifyListeners();
  }
}
