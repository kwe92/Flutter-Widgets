import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class WorkingWithShowSearchWidget extends StatefulWidget {
  const WorkingWithShowSearchWidget({super.key});

  @override
  State<WorkingWithShowSearchWidget> createState() =>
      _WorkingWithShowSearchWidgetState();
}

class _WorkingWithShowSearchWidgetState
    extends State<WorkingWithShowSearchWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Working With ShowSearch Widget'),
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: CustomSearchDeleate());
                },
                icon: const Icon(Icons.search))
          ],
        ),
      ),
    );
  }
}

// Create a search bar within flutter

class CustomSearchDeleate extends SearchDelegate {
  List<String> searchTerms = [
    'Shoujo',
    'Seinen',
    'Josei',
    'Ecchi',
    'Harem',
    'Isekai',
    'Mecha',
    'Slice of Life',
    'Kodomomuke',
    'Iyashikei'
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
          );
        });
  }
}
