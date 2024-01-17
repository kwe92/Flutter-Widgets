import 'package:flutter/material.dart';
import 'package:flutter_widgets/listViewSearchBar/ui/searchable_list_view_model.dart';
import 'package:flutter_widgets/listViewSearchBar/ui/widgets/hideable_search_bar.dart';
import 'package:provider/provider.dart';

// data source

class SearchableListView extends StatelessWidget {
  SearchableListView({super.key});

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        // declaratively instantiate model
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
              body: model.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Column(
                      children: [
                        Expanded(
                          child: NestedScrollView(
                            // floatHeaderSlivers: required to make SliverAppBar snappable
                            floatHeaderSlivers: true,
                            headerSliverBuilder: (context, _) => [
                              HideableSearchBar(searchController: searchController),
                            ],
                            body: model.items.isEmpty
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
                                    itemCount: model.items.length,
                                    itemBuilder: (context, index) => Padding(
                                      padding: EdgeInsets.only(
                                        left: horizontalPadding,
                                        right: horizontalPadding,
                                        bottom: index != model.items.length - 1 ? 12 : 0,
                                      ),
                                      child: ListTile(
                                        shape: const StadiumBorder(),
                                        tileColor: Theme.of(context).colorScheme.surface,
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
                        ),
                      ],
                    ),
            ),
          );
        },
      );
}
