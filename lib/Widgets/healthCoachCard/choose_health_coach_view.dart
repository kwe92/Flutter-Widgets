import 'package:flutter/material.dart';
import 'package:flutter_widgets/Widgets/healthCoachCard/choose_health_coach_view_model.dart';
import 'package:flutter_widgets/Widgets/healthCoachCard/reusables/reusables.dart';
import 'package:flutter_widgets/Widgets/healthCoachCard/theme/colors.dart';
import 'package:flutter_widgets/Widgets/healthCoachCard/theme/text_styles.dart';
import 'package:flutter_widgets/Widgets/healthCoachCard/widgets/car_nav_card.dart';
import 'package:flutter_widgets/Widgets/healthCoachCard/widgets/centered_text.dart';
import 'package:flutter_widgets/Widgets/healthCoachCard/widgets/flat_card.dart';
import 'package:flutter_widgets/Widgets/healthCoachCard/widgets/secondary_app_bar.dart';
import 'package:stacked/stacked.dart';

// ?? Done

class ChooseCareNavigatorView extends StatelessWidget {
  const ChooseCareNavigatorView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChooseCareNavigatorViewModel>.reactive(
      viewModelBuilder: () => ChooseCareNavigatorViewModel(),
      onViewModelReady: (viewModel) => viewModel.initialize(),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: SecondaryAppBar(
            title: Text(
              'Choose a Health Coach',
              style: textStyleBody2.copyWith(
                color: CareNavigationColors.tpDarkBlue,
                fontSize: 18,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  gap10,
                  CenteredText(
                    'Select a Health Coach below to talk on phone or video chat.'
                    ' Someone will be available within the next 48 hours.',
                    style: textStyleBody2.copyWith(
                      fontSize: 12,
                      color: CareNavigationColors.gray,
                    ),
                  ),
                  if (!model.isBusy)
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: model.carNavs.length,
                      itemBuilder: (context, index) {
                        // !! used to jump to widget not jumping properly
                        // final dataKey = GlobalKey();

                        return Padding(
                          padding: paddingV16,
                          child: FlatCard(
                            padding: 12,
                            borderRadius: circular16,
                            borderColor: CareNavigationColors.grayAccent,
                            child: CareNavigatorCard(
                              // !! used to jump to widget not jumping properly
                              // key: dataKey,
                              careNavigator: model.carNavs[index],
                              fullDescription: model.currentIndex == index ? true : false,
                              onReadPressed: () {
                                model.setCurrentIndex(index);
                                // !! used to jump to widget not jumping properly

                                // Scrollable.ensureVisible(dataKey.currentContext!);
                              },
                              onPressed: () async {
                                model.resetAllIndices();
                                // !! TODO: implement navigation to health coach view
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  if (model.isBusy)
                    const Padding(
                      padding: EdgeInsets.all(48),
                      child: CircularProgressIndicator(),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
