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

          return SafeArea(
            child: Scaffold(
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
                    padding: const EdgeInsets.only(left: horizontalPadding, top: 24, right: horizontalPadding),
                    // SEARCH BAR
                    child: TextField(
                      controller: searchController,
                      onChanged: model.onQueryItems,
                      decoration: InputDecoration(
                        labelText: 'Search',
                        hintText: 'Search',
                        prefixIcon: const Icon(Icons.search_outlined),
                        suffixIcon: model.query.isNotEmpty
                            ? IconButton(
                                onPressed: () {
                                  searchController.clear();
                                  model.clearQueriedItems();
                                },
                                icon: const Icon(Icons.clear),
                              )
                            : null,
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // LIST VIEW
                  Expanded(
                    child: model.queriedItems.isEmpty
                        ? Padding(
                            padding: EdgeInsets.only(
                              left: horizontalPadding,
                              top: MediaQuery.of(context).size.height / 4.5,
                              right: horizontalPadding,
                            ),
                            child: Text(
                              'There are no items containing the text: ${model.query}',
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
                            ),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: model.queriedItems.length,
                            itemBuilder: (context, index) => Padding(
                              padding: EdgeInsets.only(
                                left: horizontalPadding,
                                top: index == 0 ? 16 : 0,
                                right: horizontalPadding,
                                bottom: index != model.queriedItems.length - 1 ? 12 : 0,
                              ),
                              child: ListTile(
                                shape: const StadiumBorder(),
                                tileColor: Theme.of(context).colorScheme.surface,
                                title: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                  child: Text(
                                    model.queriedItems[index],
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
            ),
          );
        },
      );
}
