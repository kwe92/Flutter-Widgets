// Example From Flutter Docs
// A hypothetical shopping application displays various products offered for sale,
// and maintains a shopping cart for intended purchases.
// Start by defining the presentation class, ShoppingListItem

// Modal Product
import 'package:flutter/material.dart';

class Product {
  const Product({required this.name});
  final String name;
}

// Used to store state higher in the Widget hierarchy
// causing state to presist for longer periods of time
typedef CartChangedCallBack = Function(Product product, bool inCart);

// Presentation Class: ShoppingListItem
// Stateless Widget
// Member Variables:
//  - product type: Product
//  - inCart  type: bool
//  - onCartChanged type: CartChangedCallback
//  - initalizer list: super(key: ObjectKey(product)) ??
//
// nl

class ShoppingListItem extends StatelessWidget {
  ShoppingListItem({
    required this.product,
    required this.inCart,
    required this.onCartChanged,
  }) : super(key: ObjectKey(product));
  final Product product;
  final bool inCart;
  final CartChangedCallBack onCartChanged;

  Color _getColor(BuildContext context) {
    // The theme depends on the BuildContext
    // because different part of the tree can have different themes.
    // The BuildContext indicates where the build is
    // taking place in your tree and therefore which theme to use
    // at the specified location

    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle? _getTextStyle(BuildContext context) {
    if (!inCart) return null;
    return const TextStyle(
        color: Colors.black54, decoration: TextDecoration.lineThrough);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onCartChanged(product, inCart);
      },
      leading: CircleAvatar(
        backgroundColor: _getColor(context),
        child: Text(product.name[0]),
      ),
      title: Text(
        product.name,
        style: _getTextStyle(context),
      ),
    );
  }
}

class ShoppingListApp extends StatefulWidget {
  const ShoppingListApp({required this.products, super.key});
  final List<Product> products;
  @override
  State<ShoppingListApp> createState() => _ShoppingListAppState();
}

class _ShoppingListAppState extends State<ShoppingListApp> {
  final _shoppingCart = <Product>{};
  static const String _title = 'Shopping List App';

  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
      if (!inCart) {
        _shoppingCart.add(product);
      } else {
        _shoppingCart.remove(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text(_title),
          ),
          body: ListView(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            children: widget.products.map((product) {
              return ShoppingListItem(
                  product: product,
                  inCart: _shoppingCart.contains(product),
                  onCartChanged: _handleCartChanged);
            }).toList(),
          ),
        ),
      ),
    );
  }
}

// class ShoppingListApp extends StatelessWidget {
//   const ShoppingListApp({super.key});
//   static const _title = 'Shopping List App';
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: SafeArea(
//         child: Scaffold(
//           appBar: AppBar(title: const Text(_title)),
//           body: Center(
//             child: ShoppingListItem(
//               product: const Product(name: 'Glasses'),
//               inCart: true,
//               onCartChanged: (product, inCart) {},
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
