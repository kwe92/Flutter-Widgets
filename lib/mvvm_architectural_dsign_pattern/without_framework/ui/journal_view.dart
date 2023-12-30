import 'package:flutter/material.dart';
import 'package:flutter_widgets/mvvm_architectural_dsign_pattern/without_framework/ui/journal_view_model.dart';
import 'package:flutter_widgets/mvvm_architectural_dsign_pattern/shared/widgets/entry_count_icon.dart';
import 'package:flutter_widgets/mvvm_architectural_dsign_pattern/shared/widgets/journal_entry_card.dart';
import 'package:provider/provider.dart';

class JournalEntryView extends StatelessWidget {
  const JournalEntryView({super.key});

  @override
  Widget build(BuildContext context) {
    // place ChangeNotifierProvider as low in the Widget tree as possible
    return ChangeNotifierProvider(
      // declaratively instantiate (create) ViewModel: View First Composition
      create: (context) => JournalEntryViewModel(),
      // The Builder Widget is required to obtain the ViewModel instance that was created above it within a callback
      child: Builder(
        builder: (context) {
          // obtain the created ViewModel instance
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
                  : Column(
                      children: [
                        const EntryCountIcon(),
                        const SizedBox(
                          height: 24,
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: viewModel.journalEntries.length,
                            itemBuilder: (context, index) => JournalEntryCard(
                              journalEntry: viewModel.journalEntries[index],
                            ),
                          ),
                        )
                      ],
                    ),
            ),
          );
        },
      ),
    );
  }
}

// View Class (M-V-VM: Model-View-ViewModel Architectural Design Pattern)

//   - Defines the structure, appearance and layout of your applications U.I.
//   - View Classes should be immutable where possible and react (rebuild parts but not all of their U.I.)
//     to state changes in the ViewModel
//   - The View reacts to changes in the ViewModel by listening to notification events (notifyListeners)
//     triggered by the ViewModel
//   - The View observes ViewModel properties that change in response to user interaction or asynchronous method calls
//     like pre-caching images or retrieving data from an API.
//   - The View should not contain business logic and its components should be enabled, disabled, and mutated based on observed ViewModel properties