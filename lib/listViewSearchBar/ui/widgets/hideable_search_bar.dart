import 'package:flutter/material.dart';
import 'package:flutter_widgets/listViewSearchBar/ui/searchable_list_view_model.dart';
import 'package:provider/provider.dart';

class HideableSearchBar extends StatelessWidget {
  final TextEditingController searchController;

  const HideableSearchBar({required this.searchController, super.key});

  @override
  Widget build(BuildContext context) {
    const horizontalPadding = 16.0;

    final model = context.read<SearchableListViewModel>();

    return SliverAppBar(
      // floating: required to make SliverAppBar snappable
      floating: true,
      // snap: required to make SliverAppBar snappable
      snap: true,
      backgroundColor: Colors.white,
      toolbarHeight: 100,
      title: Padding(
        padding: const EdgeInsets.only(
          left: horizontalPadding,
          right: horizontalPadding,
        ),
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
                      model.clearFilteredItems();
                    },
                    icon: const Icon(Icons.clear),
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
