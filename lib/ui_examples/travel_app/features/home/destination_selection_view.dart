import 'package:flutter/material.dart';
import 'package:flutter_widgets/ui_examples/travel_app/features/home/destination_selection_view_model.dart';
import 'package:flutter_widgets/ui_examples/travel_app/features/home/widgets/custom_search_bar.dart';
import 'package:flutter_widgets/ui_examples/travel_app/features/home/widgets/destination_card.dart';
import 'package:flutter_widgets/ui_examples/travel_app/features/home/widgets/menu_button.dart';
import 'package:flutter_widgets/ui_examples/travel_app/features/home/widgets/welcome_user_list_tile.dart';
import 'package:flutter_widgets/ui_examples/travel_app/features/shared/services/destination_service.dart';
import 'package:flutter_widgets/ui_examples/travel_app/features/splashScreen/ui/splash_view.dart';
import 'package:provider/provider.dart';

// TODO: Construct NavigatorView

class DestinationSelectionView extends StatelessWidget {
  const DestinationSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: destinationService.fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SplashView();
            }
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.only(
                  left: 24,
                  top: 32,
                  right: 24,
                ),
                child: ChangeNotifierProvider(
                    create: (context) => DestinationSelectionViewModel(),
                    builder: (context, child) {
                      final viewModel = context.watch<DestinationSelectionViewModel>();
                      return Column(
                        children: [
                          const WelcomeUserListTile(),
                          const SizedBox(height: 32),
                          const CustomSearchBar(),
                          const SizedBox(height: 32),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Popular places",
                                style: TextStyle(
                                  color: Color(0xff2F2F2F),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "View all",
                                style: TextStyle(
                                  color: Color(0xff888888),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 32),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MenuButton(
                                onTap: () {
                                  viewModel.setIndex(0);
                                },
                                label: "Popular",
                                isSelected: viewModel.selectedIndex == 0 ? true : false,
                              ),
                              MenuButton(
                                onTap: () {
                                  viewModel.setIndex(1);
                                },
                                label: "Nearby",
                                isSelected: viewModel.selectedIndex == 1 ? true : false,
                              ),
                              MenuButton(
                                onTap: () {
                                  viewModel.setIndex(2);
                                },
                                label: "Latest",
                                isSelected: viewModel.selectedIndex == 2 ? true : false,
                              ),
                            ],
                          ),
                          const SizedBox(height: 32),
                          SizedBox(
                            height: 310,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: viewModel.destinations.length,
                              itemBuilder: (context, i) {
                                return Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: DestinationCard(destination: viewModel.destinations[i]),
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    }),
              );
            }

            return const Center(
              // TODO: could add error view
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
