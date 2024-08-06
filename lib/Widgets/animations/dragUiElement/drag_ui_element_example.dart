import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/animations/dragUiElement/customer_cart.dart';
import 'package:flutter_widgets/Widgets/animations/dragUiElement/drag_ui_element_example_view_model.dart';
import 'package:flutter_widgets/Widgets/animations/dragUiElement/dragging_list_item.dart';
import 'package:flutter_widgets/Widgets/animations/dragUiElement/item.dart';
import 'package:flutter_widgets/Widgets/animations/dragUiElement/menu_list_item.dart';
import 'package:provider/provider.dart';

class DragUiElementExampleView extends StatelessWidget {
  const DragUiElementExampleView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ChangeNotifierProvider(
        // declaratively create view model
        create: (BuildContext context) => DragUiElementExampleViewModel(),
        builder: (BuildContext context, Widget? _) {
          // obtain nearest view model as read-only to prevent triggering U.I. rebuild
          final viewModelReadOnly = context.read<DragUiElementExampleViewModel>();
          return Scaffold(
            appBar: const _AppBarWithShadow(),
            body: FutureBuilder<void>(
              // trigger view model initialization logic
              future: viewModelReadOnly.initialize(),
              builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
                return _isComputationComplete(snapshot)
                    ? Column(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 24,
                                top: 12,
                                right: 24,
                              ),
                              child:
                                  // handle if snapshot returned with errors
                                  !snapshot.hasError
                                      ? ListView.separated(
                                          itemCount: viewModelReadOnly.items.length,
                                          itemBuilder: (BuildContext context, int i) => LongPressDraggable<Item>(
                                            data: viewModelReadOnly.items[i],
                                            feedback: DraggingListItem(
                                              imageProvider: viewModelReadOnly.items[i].imageProvider,
                                            ),
                                            child: MenuListItem(
                                              item: viewModelReadOnly.items[i],
                                            ),
                                          ),
                                          separatorBuilder: (context, index) => const SizedBox(height: 16),
                                        )
                                      : const Center(
                                          child: Text(
                                            "There was a network issue, please check that your connection is stable.",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                            ),
                          ),
                          // bottom section
                          Align(
                            alignment: const Alignment(1, 1),
                            child: Container(
                              height: MediaQuery.of(context).size.height / 3,
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                              child: Consumer(
                                builder: (BuildContext context, DragUiElementExampleViewModel viewModel, Widget? _) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ...List.generate(
                                        viewModel.customers.length,
                                        (i) => Expanded(
                                          child: Padding(
                                            padding: EdgeInsets.only(left: i != 0 ? 8.0 : 0.0),
                                            child: DragTarget<Item>(
                                              builder: (BuildContext context, List<Item?> candidateData, List<dynamic> rejectedData) =>
                                                  CustomerCart(
                                                customer: viewModel.customers[i],
                                                highlighted: candidateData.isNotEmpty,
                                              ),
                                              onAcceptWithDetails: (DragTargetDetails<Item> details) =>
                                                  viewModel.itemDroppedOnCustomerCart(details.data, viewModel.customers[i]),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      );
              },
            ),
          );
        },
      ),
    );
  }
}

bool _isComputationComplete<T>(AsyncSnapshot<T> snapshot) => snapshot.connectionState == ConnectionState.done;

class _AppBarWithShadow extends StatelessWidget implements PreferredSizeWidget {
  const _AppBarWithShadow();

  @override
  Widget build(Object context) {
    return AppBar(
      elevation: 3,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      shadowColor: Colors.black.withOpacity(0.20),
      title: const Text("Drag && Drop Element Example"),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}


// Align Widget

//   - Aligns a widget relative to its parent, controlling the positioning of a child widget within a parent widgets space

//   - origin: center of parent

//   - x-axis and y-axis range: [-1, 1] where (0,0) is the orgin (center of parent)

//   - y-axis inverted compared to standard mathematical cartesian plane

// Aligning Widgets to Bottom of Screen

//   - Align(alignment: const Alignment(1, 1))


// LongPressDraggable and DragTarget

//   - allows a widget to be dragged when a long press is detected

//   - a separate widget is built to represent the dragged widget

//   - the dragged widget contains the data to be dropped into a DragTarget

//   - the parameterized type of the LongPressDraggable<T> and the DragTarget<T> must be the same

//   - DragTarget can accept or reject the data being dropped in

//   - DragTarget has a `onAcceptWithDetails` callback that is triggered when data is dropped into the DragTarget
//     you can modify any state within this callback once data is accepted from the DragTargetDetails<T>



