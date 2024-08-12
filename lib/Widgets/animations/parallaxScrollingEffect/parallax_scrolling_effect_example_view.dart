import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/animations/parallaxScrollingEffect/parallax_scrolling_effect_example_view_model.dart';
import 'package:flutter_widgets/Widgets/animations/parallaxScrollingEffect/widgets/location_list_item.dart';
import 'package:provider/provider.dart';

// TODO: Refactor builder functions to widgets

class ParallaxScrollingEffectExampleView extends StatelessWidget {
  const ParallaxScrollingEffectExampleView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ChangeNotifierProvider(
        create: (context) => ParallaxScrollingEffectExampleViewModel(),
        builder: (context, _) {
          final viewModel = context.read<ParallaxScrollingEffectExampleViewModel>();
          return Scaffold(
            appBar: _buildAppBar(context),
            body: FutureBuilder<void>(
              future: viewModel.getLocations(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return _snapshotComplete(snapshot)
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                        child: Column(
                          children: [
                            !snapshot.hasError
                                ? Builder(
                                    builder: _buildLocationListItems(viewModel),
                                  )
                                : Builder(builder: _buildErrorView),
                          ],
                        ),
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

  Widget Function(BuildContext) _buildLocationListItems(ParallaxScrollingEffectExampleViewModel viewModel) => (BuildContext context) {
        return Expanded(
          child: ListView.separated(
            itemCount: viewModel.locations.length,
            itemBuilder: (BuildContext context, int i) => LocationListItem(
              imageUrl: viewModel.locations[i].imageUrl,
              name: viewModel.locations[i].name,
              country: viewModel.locations[i].place,
            ),
            separatorBuilder: (context, index) => const SizedBox(height: 16),
          ),
        );
      };

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    final appBarColor = Theme.of(context).scaffoldBackgroundColor;

    return AppBar(
      title: const Text("Parallax Scrolling Effect"),
      scrolledUnderElevation: 0,
      elevation: 3,
      shadowColor: Colors.white.withOpacity(0.15),
      backgroundColor: appBarColor,
      surfaceTintColor: appBarColor,
    );
  }

  Widget _buildErrorView(BuildContext context) => const Expanded(
        child: Center(
          child: Text(
            "There was an issues with your network connection, try again.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      );

  bool _snapshotComplete(AsyncSnapshot snapShot) => snapShot.connectionState == ConnectionState.done;
}
