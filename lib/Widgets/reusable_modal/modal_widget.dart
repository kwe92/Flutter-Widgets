import "package:flutter/material.dart";
import "package:flutter_widgets/Widgets/reusable_modal/modal.dart";
import "package:flutter_widgets/Widgets/reusable_modal/modal_v2.dart";

class ModalWidget extends StatelessWidget {
  const ModalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Working with Modals"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // await Modal.careNavigationPopup<bool>(
            //   context,
            //   parameters: CareNavigationPopupParameters(
            //     title: 'Are you sure you want to quit?',
            //     subtitle: 'Your progress will be lost.',
            //     defaultReturn: false,
            //     options: {
            //       'Cancel': false,
            //       'Yes, Exit': true,
            //     },
            //   ),
            // );

            await ModalV2.careNavigationPopupRefact<bool>(
              context,
              parameters: CareNavigationPopupParameters(
                title: 'Are you sure you want to quit?',
                subtitle: 'Your progress will be lost.',
                defaultReturn: false,
                options: {
                  'Cancel': false,
                  'Yes, Exit': true,
                },
              ),
            );
          },
          child: const Text("Show Modal"),
        ),
      ),
    );
  }
}
