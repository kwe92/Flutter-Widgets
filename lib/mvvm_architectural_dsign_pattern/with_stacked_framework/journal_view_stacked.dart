import 'package:flutter/material.dart';
import 'package:flutter_widgets/mvvm_architectural_dsign_pattern/with_stacked_framework/journal_view_model_stacked.dart';
import 'package:flutter_widgets/mvvm_architectural_dsign_pattern/shared/widgets/entry_count_icon.dart';
import 'package:flutter_widgets/mvvm_architectural_dsign_pattern/shared/widgets/journal_entry_card.dart';
import 'package:stacked/stacked.dart';

class JournalEntryViewStacked extends StatelessWidget {
  const JournalEntryViewStacked({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<JournalEntryViewModelStacked>.reactive(
      // declaratively instantiate (create) ViewModel: View First Composition
      viewModelBuilder: () => JournalEntryViewModelStacked(),
      onViewModelReady: (JournalEntryViewModelStacked viewModel) => viewModel.initialize(),
      // Builder Widget required to obtain ViewModel instance created above within a callback
      builder: (BuildContext context, JournalEntryViewModelStacked viewModel, Widget? _) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text('MVVM Without Framework'),
            ),
            body: viewModel.isBusy
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
                          itemBuilder: (BuildContext context, int index) => JournalEntryCard(
                            journalEntry: viewModel.journalEntries[index],
                          ),
                        ),
                      )
                    ],
                  ),
          ),
        );
      },
    );
  }
}


// ViewModelBuilder

//   - Provides a ViewModel (ChangeNoitifier) to decendents and fires builder
//     when ViewModel.notifyListeners is called 

//   - has additional benefits not included withih a ChangeNotifierProvider
//     to reduce the amount of boiler plate code needed