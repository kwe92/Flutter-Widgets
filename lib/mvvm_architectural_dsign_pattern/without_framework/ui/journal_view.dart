import 'package:flutter/material.dart';
import 'package:flutter_widgets/mvvm_architectural_dsign_pattern/without_framework/ui/journal_view_model.dart';
import 'package:flutter_widgets/mvvm_architectural_dsign_pattern/without_framework/ui/widgets/journal_entry_card.dart';
import 'package:provider/provider.dart';

class JournalEntryView extends StatelessWidget {
  const JournalEntryView({super.key});

  @override
  Widget build(BuildContext context) {
    // place ChangeNotifierProvider as low in the Widget tree as possible
    return ChangeNotifierProvider(
      // declaratively instatiate ViewModel: View First Composition
      create: (context) => JournalEntryViewModel(),
      child: Builder(
        builder: (context) {
          final JournalEntryViewModel viewModel = Provider.of<JournalEntryViewModel>(context);
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: const Text('MVVM Without Framework'),
              ),
              body: viewModel.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: viewModel.journalEntries.length,
                      itemBuilder: (context, index) => JournalEntryCard(
                        journalEntry: viewModel.journalEntries[index],
                      ),
                    ),
            ),
          );
        },
      ),
    );
  }
}

// TODO: add comments

// View Class
