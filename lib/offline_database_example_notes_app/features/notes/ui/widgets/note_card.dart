import 'package:flutter/material.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/addNote/widgets/image_layout.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/notes/models/note.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/shared/services/image_picker_service.dart';

// TODO: remove

const longTextForTesting =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

class NoteCard extends StatelessWidget {
  final Note note;

  const NoteCard({required this.note, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            offset: const Offset(0, 2),
            spreadRadius: 1,
            blurRadius: 3,
          )
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 24),
            child: Text(
              note.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            height: 1,
            width: double.maxFinite,
            margin: const EdgeInsets.symmetric(horizontal: 24),
            color: Colors.black.withOpacity(0.15),
          ),
          const SizedBox(height: 16),
          GrowableContainer(
            padding: const EdgeInsets.only(
              left: 12,
              right: 12,
              bottom: 16,
            ),
            child: Text(
              note.content,
              overflow: TextOverflow.fade,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 12,
              right: 12,
              bottom: 12,
            ),
            child: ImageLayout(
              images: note.images != null ? ImagePickerService.imageFromBase64String(note.images!) : [],
            ),
          )
        ],
      ),
    );
  }
}

class GrowableContainer extends StatelessWidget {
  final double minHeight;

  final double maxHeight;

  final EdgeInsets padding;

  final BoxDecoration decoration;

  final Widget child;

  const GrowableContainer({
    this.minHeight = 100,
    this.maxHeight = 150,
    this.padding = const EdgeInsets.all(0),
    this.decoration = const BoxDecoration(),
    required this.child,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: minHeight,
        maxHeight: maxHeight,
        minWidth: double.maxFinite,
      ),
      child: Padding(
        padding: padding,
        child: DecoratedBox(
          decoration: decoration,
          child: child,
        ),
      ),
    );
  }
}
