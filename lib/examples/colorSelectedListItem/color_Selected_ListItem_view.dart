import 'package:flutter/material.dart';
import 'package:flutter_widgets/examples/colorSelectedListItem/color_Selected_ListItem_view_model.dart';
import 'package:provider/provider.dart';

// Select and highlighting one item in a list of items

class SelectListItemOnTapView extends StatelessWidget {
  const SelectListItemOnTapView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: ChangeNotifierProvider(
          create: (context) => SelectListItemOnTapViewModel(),
          builder: (context, _) => ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) => ListTile(
              title: Text('Item: $index'),
              tileColor: context.watch<SelectListItemOnTapViewModel>().selectedIndex == index ? Colors.blue.withOpacity(0.25) : null,
              onTap: () => context.read<SelectListItemOnTapViewModel>().setIndex(index),
            ),
          ),
        ),
      );
}
