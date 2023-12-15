import 'package:flutter/material.dart';
import 'package:flutter_widgets/mvvm_architectural_dsign_pattern/without_framework/models/journal_entry.dart';

class JournalEntryCard extends StatelessWidget {
  final JournalEntry journalEntry;

  const JournalEntryCard({required this.journalEntry, super.key});

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(left: 24, top: 16, right: 24),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(16),
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 2),
              color: Colors.black.withOpacity(0.15),
              blurRadius: 3,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Center(
          child: Text(
            journalEntry.content,
            style: const TextStyle(fontSize: 18),
          ),
        ),
      );
}
