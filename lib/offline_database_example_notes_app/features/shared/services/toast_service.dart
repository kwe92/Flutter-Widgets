import 'package:flutter/material.dart';
import 'package:flutter_widgets/offline_database_example_notes_app/features/shared/main_button.dart';

final toastService = ToastService(); // typically a singleton, we are using a global variable for brevity

typedef CancelationButtons = ({MainButton yes, MainButton no});

class ToastService {
  Future<void> popUpMenu(BuildContext context, CancelationButtons buttons, String content) async {
    await showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          contentPadding: const EdgeInsets.fromLTRB(24.0, 16.0, 4.0, 16.0),
          children: [
            Text(
              content,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 46),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                buttons.yes,
                const SizedBox(width: 8),
                buttons.no,
                const SizedBox(width: 8),
              ],
            )
          ],
        );
      },
    );
  }
}
