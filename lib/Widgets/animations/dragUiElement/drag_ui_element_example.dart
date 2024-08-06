import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/animations/dragUiElement/customer.dart';
import 'package:flutter_widgets/Widgets/animations/dragUiElement/item.dart';
import 'package:flutter_widgets/Widgets/animations/dragUiElement/items_service.dart';

final _customers = [
  Customer(
      name: "Francis",
      imageProvider: Image.asset("/Users/kwe/flutter-projects/FlutterWidgets/flutter_widgets/assets/profile_img00.avif").image),
  Customer(name: "Beth", imageProvider: Image.asset("/Users/kwe/flutter-projects/FlutterWidgets/flutter_widgets/assets/oregon.jpeg").image),
  Customer(
      name: "Weeb", imageProvider: Image.asset("/Users/kwe/flutter-projects/FlutterWidgets/flutter_widgets/assets/sololvl.jpeg").image),
];

class DragUiElementExample extends StatefulWidget {
  const DragUiElementExample({super.key});

  @override
  State<DragUiElementExample> createState() => _DragUiElementExampleState();
}

class _DragUiElementExampleState extends State<DragUiElementExample> {
  void _notifyWidget() => setState(() {});

  void _itemDroppedOnCustomerCart(Item item, Customer customer) {
    customer.items.add(item);

    _notifyWidget();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const _AppBarWithShadow(),
        body: FutureBuilder(
          future: itemService.getItems(),
          builder: (context, snapshot) {
            return snapshot.connectionState == ConnectionState.done
                ? Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 24,
                            top: 12,
                            right: 24,
                          ),
                          child: ListView.separated(
                            itemCount: itemService.items.length,
                            itemBuilder: (BuildContext context, int i) => LongPressDraggable<Item>(
                              data: itemService.items[i],
                              feedback: DraggingListItem(
                                imageProvider: itemService.items[i].imageProvider,
                              ),
                              child: MenuListItem(
                                item: itemService.items[i],
                              ),
                            ),
                            separatorBuilder: (context, index) => const SizedBox(height: 16),
                          ),
                        ),
                      ),
                      // bottom section
                      Align(
                        alignment: const Alignment(1, 1),
                        child: Container(
                          height: MediaQuery.of(context).size.height / 3,
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ...List.generate(
                                3,
                                (i) => Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: i != 0 ? 8.0 : 0.0),
                                    child: DragTarget<Item>(
                                      builder: (context, candidateData, rejectedData) => CustomerCart(
                                        customer: _customers[i],
                                        highlighted: candidateData.isNotEmpty,
                                      ),
                                      onAcceptWithDetails: (details) => _itemDroppedOnCustomerCart(details.data, _customers[i]),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }
}

class CustomerCart extends StatelessWidget {
  final Customer customer;
  final bool highlighted;

  const CustomerCart({required this.customer, required this.highlighted, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24),
      height: double.infinity,
      decoration: BoxDecoration(
        color: !highlighted ? Colors.white : Colors.lightBlue,
        borderRadius: const BorderRadius.all(
          Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.20),
            offset: const Offset(0, 2),
            spreadRadius: 2,
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: const BoxDecoration(
              color: Colors.lightBlue,
              shape: BoxShape.circle,
            ),
            child: ClipOval(
              child: Image(
                image: customer.imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            customer.name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            !(customer.total == 0) ? "\$${customer.total.toStringAsFixed(2)}" : "",
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            customer.items.isEmpty
                ? ""
                : customer.items.length == 1
                    ? "1 item"
                    : "${customer.items.length} items",
          ),
        ],
      ),
    );
  }
}

class MenuListItem extends StatelessWidget {
  final Item item;
  const MenuListItem({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 175,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.16),
            offset: const Offset(0, 2),
            spreadRadius: 2,
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: const BorderRadius.all(
                  Radius.circular(16),
                ),
                image: DecorationImage(
                  image: item.imageProvider,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  textAlign: TextAlign.center,
                  item.name,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "\$${item.price.toString()}",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DraggingListItem extends StatelessWidget {
  final ImageProvider imageProvider;

  const DraggingListItem({required this.imageProvider, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(16),
        ),
        child: Image(
          image: imageProvider,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _AppBarWithShadow extends StatelessWidget implements PreferredSizeWidget {
  const _AppBarWithShadow();

  @override
  Widget build(Object context) {
    return AppBar(
      elevation: 3,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      shadowColor: Colors.black.withOpacity(0.20),
      title: const Text("Drag && Drop Element Example"),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}




// Aligning Widgets to Bottom of Screen

//   - Align(alignment: const Alignment(1, 1))

