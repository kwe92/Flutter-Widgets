import 'package:flutter/material.dart';
import 'package:flutter_widgets/listViewSearchBar/searchable_list_view_model.dart';
import 'package:provider/provider.dart';

// data source

class SearchableListView extends StatelessWidget {
  SearchableListView({super.key});

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => SearchableListViewModel(),
        builder: (context, _) {
          final model = Provider.of<SearchableListViewModel>(context);

          const horizontalPadding = 16.0;

          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Searchable List',
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: horizontalPadding, top: 16, right: horizontalPadding),
                  child: TextField(
                    controller: searchController,
                    onChanged: (value) {},
                    decoration: const InputDecoration(
                      labelText: 'Search',
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: model.items.length,
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.only(
                        left: horizontalPadding,
                        top: index == 0 ? 16 : 0,
                        right: horizontalPadding,
                        bottom: index != model.items.length - 1 ? 12 : 0,
                      ),
                      child: ListTile(
                        shape: const StadiumBorder(),
                        tileColor: Theme.of(context).colorScheme.surface,

                        // tileColor: Colors.purple.withOpacity(0.50),
                        title: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            model.items[index],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
}
