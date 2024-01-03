import 'package:flutter/material.dart';
import 'package:flutter_widgets/mvvm_architectural_dsign_pattern/shared/services/journal_entry_service.dart';
import 'package:flutter_widgets/mvvm_architectural_dsign_pattern/shared/services/services.dart';
import 'package:provider/provider.dart';

class EntryCountIcon extends StatelessWidget {
  const EntryCountIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<JournalEntryService>.value(
      value: journalEntryService,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.book_online_outlined),
          const SizedBox(
            width: 6,
          ),
          // TODO: ensure U.I. rebuilds when an entry is removed
          Text(context.watch<JournalEntryService>().journalEntries.length.toString()),
        ],
      ),

      // Consumer<JournalEntryService>(
      //   builder: (BuildContext context, JournalEntryService journalEntryService, _) {
      //     return Row(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         const Icon(Icons.book_online_outlined),
      //         const SizedBox(
      //           width: 6,
      //         ),
      //         Text(journalEntryService.journalEntries.length.toString()),
      //       ],
      //     );
      //   },
      // ),
    );
  }
}

// ChangeNotifierProvider<T extends ChangeNotifier?>

//   - creates or reuses a ChangeNotifier depending on which constructor you use
//   - there are two constructors:
//       - 1: ChangeNotifierProvider() - (the default constructor used to create a new instance of a ChangeNotifier concrete implementation)
//       - 2: ChangeNotifierProvider<T>.value - (a named constructor used to provide an exisiting (instantiated) ChangeNotifier implementation)
//   - listens to and exposes a ChangeNotifier to decendant nodes (Widgets) in the Widget tree
//   - decendant nodes (Widgets) dependent upon the ChangeNotifier exposed by the ancestor node (ChangeNotifierProvider)
//     rebuild their U.I. with updated data when a notification event is emited by ChangeNotifier.notifyListeners
