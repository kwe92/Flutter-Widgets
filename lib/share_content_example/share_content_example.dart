import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ShareExample extends StatelessWidget {
  const ShareExample({super.key});

  @override
  Widget build(BuildContext context) {
    const textToShare = "some text to share \n\n - Kweayon";

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(textToShare),
            const SizedBox(height: 24),
            ElevatedButton(
                onPressed: () async {
                  await Share.share(textToShare);
                },
                child: const Text("Share Button")),
          ],
        ),
      ),
    );
  }
}
